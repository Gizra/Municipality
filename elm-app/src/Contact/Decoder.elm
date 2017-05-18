module Contact.Decoder
    exposing
        ( decodeContacts
        )

import Contact.Model exposing (Contact, DictListContact, Names)
import DictList exposing (DictList, decodeWithKeys)
import Json.Decode exposing (Decoder, andThen, dict, int, fail, field, float, list, map, map2, nullable, oneOf, string, succeed)
import Json.Decode.Pipeline exposing (custom, decode, optional, optionalAt, required)


decodeContacts : Decoder DictListContact
decodeContacts =
    decodeWithKeys int decodeContact


decodeContact : Decoder Contact
decodeContact =
    decode Contact
        |> custom decodeNames
        |> optional "phone" string Nothing


decodeNames : Decoder Names
decodeNames =
    decode Names
        |> optional "name_arabic" string Nothing
        |> optional "name_english" string Nothing
        |> optional "name_hebrew" string Nothing
