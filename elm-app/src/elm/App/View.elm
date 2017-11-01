module App.View exposing (..)

import App.Model exposing (..)
import App.Types exposing (Page(..))
import Contact.View exposing (view)
import Error.View exposing (viewError)
import Event.View exposing (view)
import Events.View
import Html exposing (..)
import Utils.Html exposing (showIf)


view : Model -> Html Msg
view model =
    let
        errorElement =
            Error.View.view model.language model.errors
    in
    case model.page of
        Contact ->
            div []
                [ errorElement
                , Html.map MsgPagesContact <| Contact.View.view model.baseUrl model.language model.showAsBlock model.editorPermissions model.pageContact
                ]

        Event ->
            div []
                [ errorElement
                , Html.map MsgPagesEvent <| Event.View.view model.baseUrl model.language model.pageEvent.event
                ]

        Events ->
            div []
                [ errorElement
                , Html.map MsgPagesEvents <| Events.View.view model.baseUrl model.language model.showAsBlock model.editorPermissions model.pageEvents
                ]

        NotFound ->
            div [] [ text "Wrong page defined" ]
