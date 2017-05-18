module Contact.Decoder
    exposing
        ( decodeContacts
        )

import Contact.Model exposing (Contact, DictListContact, Names)
import DictList exposing (DictList, decodeKeysAndValues)
import Json.Decode exposing (Decoder, andThen, dict, int, index, fail, field, float, list, map, map2, nullable, oneOf, string, succeed)
import Json.Decode.Pipeline exposing (custom, decode, optional, optionalAt, required, requiredAt)


decodeContacts : Decoder DictListContact
decodeContacts =
    decodeKeysAndValues
        (list string)
        (\id -> requiredAt [ toString id ] decodeContact)


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
