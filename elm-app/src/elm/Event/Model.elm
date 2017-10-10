module Event.Model exposing (..)

import Date exposing (Date, Day)


type alias Model =
    { event : Event
    }


emptyModel : Model
emptyModel =
    { event =
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
    = HandleEvent (Result String Event)


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
