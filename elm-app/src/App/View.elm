module App.View exposing (..)

import App.Model exposing (..)
import App.Types exposing (Page(..))
import App.Update exposing (..)
import DictList
import Html exposing (..)
import Html.Attributes exposing (alt, class, classList, href, src, style, target)
import Html.Events exposing (onClick)


view : Model -> Html Msg
view model =
    case model.page of
        Contact ->
            div [] [ text "This is the Elm App!" ]
