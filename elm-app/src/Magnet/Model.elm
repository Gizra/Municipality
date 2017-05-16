module Magnet.Model exposing (..)

import Mouse exposing (Position)


type alias Magnet =
    { selected : Bool
    , position : Position
    , drag : Maybe Drag
    , rotation : Float
    }


type Side
    = Left
    | Right


type alias Drag =
    { start : Position
    , current : Position
    , -- How far from its center the magnet is dragged from.
      distanceFromCenter : Float
    , -- Whether the magnet is dragged from its right or left side.
      side : Side
    }
