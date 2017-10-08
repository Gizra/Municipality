module Events.Decoder exposing (decodeEvents)

import DictList exposing (DictList, decodeArray2)
import Event.Decoder exposing (decodeEvent)
import Events.Model exposing (DictListEvent)
import Json.Decode exposing (Decoder, field, list, oneOf)
import Utils.Json exposing (decodeEmptyArrayAs, decodeIntAsString)


decodeEvents : Decoder DictListEvent
decodeEvents =
    oneOf
        [ decodeArray2 (field "id" decodeIntAsString) decodeEvent
        , decodeEmptyArrayAs DictList.empty
        ]
