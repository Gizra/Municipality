module Event.Decoder
    exposing
        ( decodeEvents
        )

import Event.Model exposing (Event, DictListEvent)
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
