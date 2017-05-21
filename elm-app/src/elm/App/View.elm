module App.View exposing (..)

import App.Model exposing (..)
import App.Types exposing (Page(..))
import Contact.View exposing (view)
import Html exposing (..)


view : Model -> Html Msg
view model =
    case model.page of
        Contact ->
            div []
                [ Html.map MsgPagesContact <| Contact.View.view model.language model.pageContact
                ]

        NotFound ->
            div [] [ text "Wrong page defined" ]
