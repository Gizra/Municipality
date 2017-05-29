module Event.Model exposing (..)

import DictList exposing (DictList)


type alias Model =
    { events : DictListEvent }


emptyModel : Model
emptyModel =
    { events = DictList.empty }


type Msg
    = HandleEvents (Result String DictListEvent)


type alias Name =
    String


type alias EventId =
    String


type alias Event =
    { name : Name
    , imageUrl : Maybe String
    }


type alias DictListEvent =
    DictList EventId Event
