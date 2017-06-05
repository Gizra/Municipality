module Contact.Decoder
    exposing
        ( decodeContacts
        )

import Contact.Model exposing (Color(..), Contact, DictListContact, ReceptionTimes, Topic)
import DictList exposing (DictList, decodeArray, empty)
import Json.Decode exposing (Decoder, andThen, at, dict, fail, field, float, index, int, keyValuePairs, list, map, map2, nullable, oneOf, string, succeed)
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
        |> required "name" string
        |> optional "job_title" (nullable string) Nothing
        |> optional "image_url" (nullable string) Nothing
        |> optional "topics" (nullable decodeTopic) Nothing
        |> optional "phone" (nullable string) Nothing
        |> optional "fax" (nullable string) Nothing
        |> optional "email" (nullable string) Nothing
        |> optional "address" (nullable string) Nothing
        |> optional "reception_hours" (nullable decodeReceptionTimes) Nothing


decodeTopic : Decoder (List Topic)
decodeTopic =
    list
        (decode Topic
            |> required "id" string
            |> required "name" string
            |> required "color" decodeColor
        )


decodeReceptionTimes : Decoder (List ReceptionTimes)
decodeReceptionTimes =
    list
        (decode ReceptionTimes
            |> required "days" string
            |> required "hours" string
        )


decodeColor : Decoder Color
decodeColor =
    string
        |> andThen
            (\color ->
                case color of
                    "white" ->
                        succeed White

                    "red" ->
                        succeed Red

                    "orange" ->
                        succeed Orange

                    "yellow" ->
                        succeed Yellow

                    "olive" ->
                        succeed Olive

                    "green" ->
                        succeed Green

                    "teal" ->
                        succeed Teal

                    "blue" ->
                        succeed Blue

                    "violet" ->
                        succeed Violet

                    "purple" ->
                        succeed Purple

                    "pink" ->
                        succeed Pink

                    "brown" ->
                        succeed Brown

                    "grey" ->
                        succeed Grey

                    "black" ->
                        succeed Black

                    _ ->
                        fail <| "Could not recognise color: " ++ color
            )
