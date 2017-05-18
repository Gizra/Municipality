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



-- @todo: Adapt flags.


type alias Flags =
    { page : String
    }


type alias Model =
    { language : Language
    , page : Page
    , pageContact : Contact.Model.Model
    }


emptyModel : Model
emptyModel =
    { language = Hebrew
    , page = Contact
    , pageContact = Contact.Model.emptyModel
    }
