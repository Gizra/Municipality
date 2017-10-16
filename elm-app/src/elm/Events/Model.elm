module Events.Model exposing (..)

import Date exposing (Date, Day)
import DictList exposing (DictList)
import Event.Model exposing (Event, EventId)


type alias Model =
    { events : DictListEvent
    , filterString : String
    }


emptyModel : Model
emptyModel =
    { events = DictList.empty
    , filterString = ""
    }


type Msg
    = HandleEvents (Result String DictListEvent)
    | SetFilter String


type alias DictListEvent =
    DictList EventId Event
