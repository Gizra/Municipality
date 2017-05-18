module Contact.Decoder
    exposing
        ( decodeContacts
        )

import Contact.Model exposing (Contact, DictListContact, Names)
import DictList exposing (DictList, decodeWithKeys, decodeKeysAndValues, empty)
import Json.Decode exposing (Decoder, at, andThen, dict, int, index, keyValuePairs, fail, field, float, list, map, map2, nullable, oneOf, string, succeed)
import Json.Decode.Pipeline exposing (custom, decode, optional, optionalAt, required, requiredAt)
import Utils.Json exposing (decodeEmptyArrayAs)


decodeContacts : Decoder DictListContact
decodeContacts =
    oneOf
        [ decodeKeysAndValues
            (keyValuePairs decodeContact
                |> andThen (\values -> succeed (List.map Tuple.first values))
            )
            (\id -> at [ id ] decodeContact)
          -- (\id -> decodeContact)
        , decodeEmptyArrayAs DictList.empty
        ]


decodeContact : Decoder Contact
decodeContact =
    decode Contact
        |> custom decodeNames
        |> optional "phone" (nullable string) Nothing


decodeNames : Decoder Names
decodeNames =
    decode Names
        |> optional "name_arabic" (nullable string) Nothing
        |> optional "name_english" (nullable string) Nothing
        |> optional "name_hebrew" (nullable string) Nothing
