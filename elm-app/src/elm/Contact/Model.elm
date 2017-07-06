module Contact.Model exposing (..)

import Date exposing (Day)
import DictList exposing (DictList)


type alias Model =
    { contacts : DictListContact
    , filterString : String
    }


emptyModel : Model
emptyModel =
    { contacts = DictList.empty
    , filterString = ""
    }


type Msg
    = HandleContacts (Result String DictListContact)
    | SetFilter String


type Color
    = Red
    | Orange
    | Olive
    | Green
    | Teal
    | Blue
    | Pink
    | Turquoise


type alias Name =
    String


type alias ContactId =
    String


type alias Topic =
    { id : String
    , name : Name
    , color : Color
    }


type alias ReceptionTimes =
    { days : List Day
    , hours : String
    , daysDelimiter : String
    }


type alias Contact =
    { name : Name
    , jobTitle : Maybe String
    , imageUrl : Maybe String
    , topics : Maybe (List Topic)
    , phone : Maybe String
    , fax : Maybe String
    , email : Maybe String
    , address : Maybe String
    , receptionTimes : Maybe (List ReceptionTimes)
    }


type alias DictListContact =
    DictList ContactId Contact
