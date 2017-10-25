module App.Model
    exposing
        ( BaseUrl
        , Flags
        , Model
        , Msg(..)
        , emptyModel
        )

import App.Types exposing (Language(..), Page(..))
import Contact.Model exposing (Model, Msg)
import Event.Model exposing (Model, Msg)
import Events.Model


type Msg
    = MsgPagesContact Contact.Model.Msg
    | MsgPagesEvent Event.Model.Msg
    | MsgPagesEvents Events.Model.Msg


type alias Flags =
    { baseUrl : BaseUrl
    , editorPermissions : Bool
    , language : String
    , page : String
    , showAsBlock : Bool
    }


type alias Model =
    { baseUrl : BaseUrl
    , editorPermissions : Bool
    , language : Language
    , page : Page
    , pageContact : Contact.Model.Model
    , pageEvent : Event.Model.Model
    , pageEvents : Events.Model.Model
    , showAsBlock : Bool
    }


type alias BaseUrl =
    { path : String
    , query : String
    }


emptyModel : Model
emptyModel =
    { baseUrl =
        { path = ""
        , query = ""
        }
    , editorPermissions = False
    , language = Hebrew
    , page = NotFound
    , pageContact = Contact.Model.emptyModel
    , pageEvent = Event.Model.emptyModel
    , pageEvents = Events.Model.emptyModel
    , showAsBlock = False
    }
