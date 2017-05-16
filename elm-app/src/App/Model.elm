module App.Model
    exposing
        ( emptyModel
        , Flags
        , Msg(..)
        , Model
        )

import App.Types exposing (Language(..), Page(..))
import Attribute.Model exposing (Attribute)
import DictList exposing (DictList)
import EveryDict exposing (EveryDict)
import GizraTeam exposing (people)
import Magnets.Model exposing (Magnets, Msg)
import People.Model exposing (GitHubName, Person)


type Msg
    = MsgMagnets Magnets.Model.Msg
    | ToggleAttribute Attribute


type alias Flags =
    { randomNumbers : List Int
    }


type alias Model =
    { language : Language
    , magnets : Magnets
    , people : DictList GitHubName Person
    , page : Page
    }


emptyModel : Model
emptyModel =
    { language = Hebrew
    , magnets = EveryDict.empty
    , people = people
    , page = Contact
    }
