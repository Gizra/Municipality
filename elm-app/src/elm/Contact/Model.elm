module Contact.Model exposing (..)

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


type alias Name =
    String


type alias ContactId =
    String


type alias Topic =
    { id : Int
    , name : Name
    }


type alias Contact =
    { name : Name
    , job_title : Maybe String
    , image_url : Maybe String
    , topics : Maybe Topic
    , phone : Maybe String
    , fax : Maybe String
    , email : Maybe String
    , address : Maybe String
    }


type alias DictListContact =
    DictList ContactId Contact
