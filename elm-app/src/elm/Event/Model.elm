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
    , day : String
    , date : String
    , endDate : Maybe String
    , recurringWeekly : Maybe String
    , ticketPrice : Maybe String
    , moreDetailsText : String
    }


type alias DictListEvent =
    DictList EventId Event
