module Contact.Decoder
    exposing
        ( decodeContacts
        , decodeDay
        )

import Contact.Model exposing (Color(..), Contact, DictListContact, ReceptionTimes, Topic)
import Date exposing (Day)
import DictList exposing (DictList, decodeArray2, empty)
import Json.Decode exposing (Decoder, andThen, at, bool, dict, fail, field, float, index, int, keyValuePairs, list, map, map2, nullable, oneOf, string, succeed)
import Json.Decode.Pipeline exposing (custom, decode, optional, optionalAt, required, requiredAt)
import Utils.Json exposing (decodeEmptyArrayAs, decodeIntAsString)


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
        |> optional "department" (nullable string) Nothing
        |> optional "job_title" (nullable string) Nothing
        |> optional "image_url" (nullable string) Nothing
        |> optional "topics" (nullable decodeTopic) Nothing
        |> optional "phone" (nullable string) Nothing
        |> optional "fax" (nullable string) Nothing
        |> optional "email" (nullable string) Nothing
        |> optional "address" (nullable string) Nothing
        |> optional "reception_hours" (nullable decodeReceptionTimes) Nothing
        |> required "edit" bool


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
            |> required "days" decodeDay
            |> required "hours" string
            |> required "multiple_days" bool
        )


decodeColor : Decoder Color
decodeColor =
    string
        |> andThen
            (\color ->
                case color of
                    "danger" ->
                        succeed Danger

                    "warning" ->
                        succeed Warning

                    "quaternary" ->
                        succeed Quaternary

                    "success" ->
                        succeed Success

                    "tertiary" ->
                        succeed Tertiary

                    "primary" ->
                        succeed Primary

                    "secondary" ->
                        succeed Secondary

                    "info" ->
                        succeed Info

                    "default" ->
                        succeed Default

                    _ ->
                        fail <| "Could not recognise color: " ++ color
            )


decodeDay : Decoder (List Day)
decodeDay =
    list
        (string
            |> andThen
                (\day ->
                    case day of
                        "0" ->
                            succeed Date.Sun

                        "1" ->
                            succeed Date.Mon

                        "2" ->
                            succeed Date.Tue

                        "3" ->
                            succeed Date.Wed

                        "4" ->
                            succeed Date.Thu

                        "5" ->
                            succeed Date.Fri

                        "6" ->
                            succeed Date.Sat

                        _ ->
                            fail <| "Could not recognise day: " ++ day
                )
        )
