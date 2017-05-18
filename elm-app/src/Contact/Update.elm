port module Contact.Update
    exposing
        ( update
        )

import Contact.Model exposing (Model, Msg(..))
import Json.Decode exposing (Value)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []


port contacts : (Value -> msg) -> Sub msg
