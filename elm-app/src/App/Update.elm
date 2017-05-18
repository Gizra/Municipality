port module App.Update
    exposing
        ( init
        , update
        , subscriptions
        )

import App.Model exposing (..)
import App.Types exposing (Page(..))
import Contact.Update
import EveryDict exposing (EveryDict)
import List.Extra as List exposing (getAt)


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( emptyModel, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MsgPagesContact subMsg ->
            let
                ( val, cmds ) =
                    Contact.Update.update subMsg model.pageContact
            in
                ( { model | pageContact = val }
                , Cmd.map MsgPagesContact cmds
                )


subscriptions : Model -> Sub Msg
subscriptions model =
    case model.page of
        Contact ->
            Sub.map MsgPagesContact <| Contact.Update.subscriptions
