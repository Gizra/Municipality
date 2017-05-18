module App.Model
    exposing
        ( emptyModel
        , Flags
        , Msg(..)
        , Model
        )

import App.Types exposing (Language(..), Page(..))
import DictList exposing (DictList)
import EveryDict exposing (EveryDict)


type Msg
    = NoOp



-- @todo: Adapt flags.


type alias Flags =
    { page : String
    }


type alias Model =
    { language : Language
    , page : Page
    }


emptyModel : Model
emptyModel =
    { language = Hebrew
    , page = Contact
    }
