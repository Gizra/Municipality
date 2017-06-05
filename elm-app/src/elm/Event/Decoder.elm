module Event.Decoder
    exposing
        ( decodeEvents
        )

import DictList exposing (DictList, decodeArray2, empty)
import Event.Model exposing (DictListEvent, Event)
import Json.Decode exposing (Decoder, andThen, at, bool, dict, fail, field, float, index, keyValuePairs, list, map, map2, nullable, oneOf, string, succeed)
import Json.Decode.Pipeline exposing (custom, decode, optional, optionalAt, required, requiredAt)
import Utils.Json exposing (decodeDate, decodeEmptyArrayAs, decodeIntAsString)


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
        |> required "date" decodeDate
        |> optional "end_date" (nullable decodeDate) Nothing
        |> required "recurring_weekly" bool
        |> optional "ticket_price" (nullable string) Nothing
