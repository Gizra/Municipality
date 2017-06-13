module App.Model
    exposing
        ( emptyModel
        , Flags
        , Msg(..)
        , Model
        )

import App.Types exposing (Language(..), Page(..))
import Contact.Model exposing (Model, Msg)
import Event.Model exposing (Model, Msg)


type Msg
    = MsgPagesContact Contact.Model.Msg
    | MsgPagesEvent Event.Model.Msg


type alias Flags =
    { page : String
    , language : String
    , showAsBlock : Bool
    }


type alias Model =
    { language : Language
    , page : Page
    , pageContact : Contact.Model.Model
    , pageEvent : Event.Model.Model
    , showAsBlock : Bool
    }


emptyModel : Model
emptyModel =
    { language = Hebrew
    , page = NotFound
    , pageContact = Contact.Model.emptyModel
    , pageEvent = Event.Model.emptyModel
    , showAsBlock = False
    }
