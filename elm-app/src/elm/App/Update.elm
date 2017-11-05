port module App.Update
    exposing
        ( init
        , subscriptions
        , update
        )

import App.Model exposing (..)
import App.Types exposing (Language(..), Page(..))
import App.Utils exposing (handleErrors)
import Contact.Update
import Event.Update
import Events.Update


init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        page =
            case flags.page of
                "contacts" ->
                    Contact

                "event" ->
                    Event

                "events" ->
                    Events

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
        | baseUrl = flags.baseUrl
        , editorPermissions = flags.editorPermissions
        , language = language
        , showAsBlock = flags.showAsBlock
        , page = page
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MsgPagesContact subMsg ->
            let
                ( val, cmds, maybeError ) =
                    Contact.Update.update subMsg model.pageContact

                modelUpdatedWithError =
                    handleErrors maybeError model
            in
            ( { modelUpdatedWithError | pageContact = val }
            , Cmd.map MsgPagesContact cmds
            )

        MsgPagesEvent subMsg ->
            let
                ( val, cmds, maybeError ) =
                    Event.Update.update subMsg model.pageEvent

                modelUpdatedWithError =
                    handleErrors maybeError model
            in
            ( { modelUpdatedWithError | pageEvent = val }
            , Cmd.map MsgPagesEvent cmds
            )

        MsgPagesEvents subMsg ->
            let
                ( val, cmds, maybeError ) =
                    Events.Update.update subMsg model.pageEvents

                modelUpdatedWithError =
                    handleErrors maybeError model
            in
            ( { modelUpdatedWithError | pageEvents = val }
            , Cmd.map MsgPagesEvents cmds
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    case model.page of
        Contact ->
            Sub.map MsgPagesContact <| Contact.Update.subscriptions

        Event ->
            Sub.map MsgPagesEvent <| Event.Update.subscriptions

        Events ->
            Sub.map MsgPagesEvents <| Events.Update.subscriptions

        NotFound ->
            Sub.none
