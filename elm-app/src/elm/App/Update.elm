port module App.Update
    exposing
        ( init
        , update
        , subscriptions
        )

import App.Model exposing (..)
import App.Types exposing (Language(..), Page(..))
import Contact.Update
import Event.Update


init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        page =
            case flags.page of
                "contacts" ->
                    Contact

                "events" ->
                    Event

                -- Fallback to page not found.
                _ ->
                    NotFound

        language =
            case flags.language of
                "ar" ->
                    Arabic

                "en" ->
                    English

                "he" ->
                    Hebrew

                -- Fallback to English.
                _ ->
                    English
    in
        ( { emptyModel
            | page = page
            , language = language
            , showAsBlock = flags.showAsBlock
          }
        , Cmd.none
        )


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

        MsgPagesEvent subMsg ->
            let
                ( val, cmds ) =
                    Event.Update.update subMsg model.pageEvent
            in
                ( { model | pageEvent = val }
                , Cmd.map MsgPagesEvent cmds
                )


subscriptions : Model -> Sub Msg
subscriptions model =
    case model.page of
        Contact ->
            Sub.map MsgPagesContact <| Contact.Update.subscriptions

        Event ->
            Sub.map MsgPagesEvent <| Event.Update.subscriptions

        NotFound ->
            Sub.none
