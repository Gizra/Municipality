module Contact.Model exposing (..)


type alias Name =
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
