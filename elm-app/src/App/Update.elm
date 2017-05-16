port module App.Update
    exposing
        ( init
        , update
        )

import App.Model exposing (..)
import EveryDict exposing (EveryDict)
import List.Extra as List exposing (getAt)


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( emptyModel, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []
