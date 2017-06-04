module Event.Model exposing (..)

import DictList exposing (DictList)


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


type alias Name =
    String


type alias EventId =
    String


type alias Event =
    { name : Name
    , imageUrl : Maybe String
    , description : Maybe String
    , date : Maybe String
    , endDate : Maybe String
    , recurringWeekly : Maybe Bool
    , ticketPrice : Maybe String
    }


type alias DictListEvent =
    DictList EventId Event
