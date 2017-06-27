module App.Model
    exposing
        ( emptyModel
        , Flags
        , Msg(..)
        , Model
        , BaseUrl
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
    , baseUrl : BaseUrl
    }


type alias Model =
    { baseUrl : BaseUrl
    , language : Language
    , page : Page
    , pageContact : Contact.Model.Model
    , pageEvent : Event.Model.Model
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
    , language = Hebrew
    , page = NotFound
    , pageContact = Contact.Model.emptyModel
    , pageEvent = Event.Model.emptyModel
    , showAsBlock = False
    }
