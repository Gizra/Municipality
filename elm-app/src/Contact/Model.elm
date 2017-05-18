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


type alias Names =
    { arabic : Maybe Name
    , english : Maybe Name
    , hebrew : Maybe Name
    }


type alias Contact =
    { names : Names
    , phone : Maybe String
    }


type alias DictListContact =
    DictList ContactId Contact
