module App.Model
    exposing
        ( emptyModel
        , Flags
        , Msg(..)
        , Model
        )

import App.Types exposing (Language(..), Page(..))
import Contact.Model exposing (Model, Msg)
import DictList exposing (DictList)
import EveryDict exposing (EveryDict)


type Msg
    = MsgPagesContact Contact.Model.Msg


type alias Flags =
    { page : String
    , language : String
    }


type alias Model =
    { language : Language
    , page : Page
    , pageContact : Contact.Model.Model
    }


emptyModel : Model
emptyModel =
    { language = Hebrew
    , page = NotFound
    , pageContact = Contact.Model.emptyModel
    }