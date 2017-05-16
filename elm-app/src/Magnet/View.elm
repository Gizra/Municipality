module Magnet.View exposing (..)

import Attribute.Model exposing (Attribute)
import Attribute.Utils exposing (attributeToString)
import Html exposing (..)
import Html.Attributes exposing (class, classList, style)
import Html.Events exposing (on, onClick)
import Json.Decode as Json
import Magnet.Model exposing (..)
import Magnet.Utils exposing (..)
import Magnets.Model exposing (..)
import Mouse exposing (position)


view : ( Attribute.Model.Attribute, Magnet ) -> Html Msg
view ( attribute, magnet ) =
    div
        [ on "mousedown" (Json.map (DragStart attribute magnet) Mouse.position)
        , onClick <| ToggleAttribute attribute
        , style
            [ -- Treat the magnet position as its center.
              ( "left", px <| (getPosition magnet).x - 50 )
            , ( "top", px <| (getPosition magnet).y - 15 )
            , ( "transform", "rotate(" ++ (toString magnet.rotation) ++ "deg)" )
            ]
        , classList [ ( "selected", magnet.selected ) ]
        ]
        [ text <| attributeToString attribute
        ]


px : Int -> String
px number =
    toString number ++ "px"
