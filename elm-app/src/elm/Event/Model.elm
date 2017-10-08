module Event.Model exposing (..)

import Date exposing (Date, Day)
import DictList exposing (DictList)


type alias Model =
    { events : DictListEvent
    , filterString : String
    , singleEvent : Event
    }


emptyModel : Model
emptyModel =
    { events = DictList.empty
    , filterString = ""
    , singleEvent =
        { name = ""
        , imageUrl = Nothing
        , description = Nothing
        , date = Date.fromTime 0
        , endDate = Nothing
        , recurringWeekly = False
        , ticketPrice = Nothing
        , location = Nothing
        , showEditLink = False
        }
    }


type Msg
    = HandleEvents (Result String DictListEvent)
    | HandleEvent (Result String Event)
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
    , showEditLink : Bool
    }


type alias DictListEvent =
    DictList EventId Event
