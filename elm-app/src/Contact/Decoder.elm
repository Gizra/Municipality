module Contact.Decoder
    exposing
        ( decodeContacts
        )

import Contact.Model exposing (Contact, DictListContact, Names)
import DictList exposing (DictList, decodeArray, empty)
import Json.Decode exposing (Decoder, at, andThen, dict, int, index, keyValuePairs, fail, field, float, list, map, map2, nullable, oneOf, string, succeed)
import Json.Decode.Pipeline exposing (custom, decode, optional, optionalAt, required, requiredAt)
import Utils.Json exposing (decodeEmptyArrayAs, decodeIntAsString)


-- @todo: Remove after https://github.com/Gizra/elm-dictlist/pull/10 is merged.


decodeArray2 : Decoder comparable -> Decoder value -> Decoder (DictList comparable value)
decodeArray2 keyDecoder valueDecoder =
    Json.Decode.map2 (,) keyDecoder valueDecoder
        |> Json.Decode.list
        |> Json.Decode.map DictList.fromList


decodeContacts : Decoder DictListContact
decodeContacts =
    oneOf
        [ decodeArray2 (field "id" decodeIntAsString) decodeContact
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
