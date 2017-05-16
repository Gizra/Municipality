module Contact.View exposing (..)

import Contact.Model exposing (Contact, DictListContact)
import Html exposing (..)
import Html.Attributes exposing (alt, class, classList, href, src, style, target)
import Html.Events exposing (onClick)


view : DictListContact -> Html msg
view contacts =
    div [] [ text "Contact lists" ]
