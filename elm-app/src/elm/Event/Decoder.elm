module Event.Decoder
    exposing
        ( decodeEvents
        )

import DictList exposing (DictList, decodeArray2, empty)
import Event.Model exposing (DictListEvent, Event)
import Json.Decode exposing (Decoder, andThen, at, dict, fail, field, float, index, keyValuePairs, list, map, map2, nullable, oneOf, string, succeed)
import Json.Decode.Pipeline exposing (custom, decode, optional, optionalAt, required, requiredAt)
import Utils.Json exposing (decodeEmptyArrayAs, decodeIntAsString)


decodeEvents : Decoder DictListEvent
decodeEvents =
    oneOf
        [ decodeArray2 (field "id" decodeIntAsString) decodeEvent
        , decodeEmptyArrayAs DictList.empty
        ]


decodeEvent : Decoder Event
decodeEvent =
    decode Event
        |> required "name" string
        |> optional "image_url" (nullable string) Nothing
        |> optional "description" (nullable string) Nothing
        |> required "day" string
        |> required "date" string
        |> optional "end_date" (nullable string) Nothing
        |> optional "recurring_weekly" (nullable string) Nothing
        |> optional "ticket_price" (nullable string) Nothing
        |> required "more_details_text" string
