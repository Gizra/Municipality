module App.View exposing (..)

import App.Model exposing (..)
import App.Types exposing (Page(..))
import Contact.View exposing (view)
import Event.View exposing (view)
import Events.View
import Html exposing (..)


view : Model -> Html Msg
view model =
    case model.page of
        Contact ->
            div []
                [ Html.map MsgPagesContact <| Contact.View.view model.baseUrl model.language model.showAsBlock model.pageContact
                ]

        Event ->
            div []
                [ Html.map MsgPagesEvent <| Event.View.view model.baseUrl model.language model.pageEvent.event
                ]

        Events ->
            div []
                [ Html.map MsgPagesEvents <| Events.View.view model.baseUrl model.language model.showAsBlock model.pageEvents
                ]

        NotFound ->
            div [] [ text "Wrong page defined" ]
