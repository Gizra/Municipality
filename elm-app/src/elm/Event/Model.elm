module Event.Model exposing (..)

import Date exposing (Day, Date)
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


type alias Location =
    { title : String
    , url : String
    }


type alias Event =
    { name : Name
    , imageUrl : Maybe String
    , description : Maybe String
    , date : Date
    , endDate : Maybe Date
    , recurringWeekly : Bool
    , ticketPrice : Maybe String
    , location : Maybe Location
    , edit : Bool
    }


type alias DictListEvent =
    DictList EventId Event
