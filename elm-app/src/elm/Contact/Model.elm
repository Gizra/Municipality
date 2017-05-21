module Contact.Model exposing (..)

import DictList exposing (DictList)


type alias Model =
    { contacts : DictListContact
    , filter : String
    }


emptyModel : Model
emptyModel =
    { contacts = DictList.empty
    , filter = ""
    }


type Msg
    = HandleContacts (Result String DictListContact)
    | SetFilter String


type alias Name =
    String


type alias ContactId =
    String


type alias Contact =
    { name : Name
    , phone : Maybe String
    }


type alias DictListContact =
    DictList ContactId Contact
