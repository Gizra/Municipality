module Contact.View exposing (..)

import App.Types exposing (Language(..))
import Contact.Model exposing (Model)
import Html exposing (..)
import Html.Attributes exposing (alt, class, classList, href, src, style, target)
import Html.Events exposing (onClick)


view : Language -> Model -> Html msg
view language model =
    div []
        [ text "Contact lists"
        ]
