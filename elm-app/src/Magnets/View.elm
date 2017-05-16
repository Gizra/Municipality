module Magnets.View exposing (..)

import Attribute.Model exposing (Attribute)
import Attribute.Utils exposing (attributeToString)
import EveryDict exposing (values)
import Html exposing (..)
import Html.Attributes exposing (class, style)
import Html.Events exposing (on, onClick)
import Json.Decode as Json
import Magnet.Model exposing (..)
import Magnet.Utils exposing (..)
import Magnet.View
import Magnets.Model exposing (..)
import Magnets.Update exposing (..)
import Mouse exposing (position)


view : Magnets -> Html Msg
view model =
    div []
        [ div
            [ class "magnets" ]
            (List.map Magnet.View.view <| EveryDict.toList model)
        ]
