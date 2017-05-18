module Contact.Model exposing (..)

import DictList exposing (DictList)


type alias Model =
    { contacts : DictListContact
    }


emptyModel : Model
emptyModel =
    { contacts = DictList.empty
    }


type Msg
    = NoOp


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
    { name : Names
    , phone : Maybe String
    , email : Maybe String
    }


type alias DictListContact =
    DictList ContactId Contact
