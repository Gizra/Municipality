module Contact.View exposing (..)

import Contact.Model exposing (Model)
import Html exposing (..)
import Html.Attributes exposing (alt, class, classList, href, src, style, target)
import Html.Events exposing (onClick)


view : Model -> Html msg
view contacts =
    div [] [ text "Contact lists" ]
