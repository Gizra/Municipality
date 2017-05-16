module Magnets.Model
    exposing
        ( Magnets
        , Msg(..)
        )

import Attribute.Model exposing (Attribute)
import EveryDict exposing (EveryDict)
import Magnet.Model exposing (Magnet)
import Mouse exposing (Position)


type alias Magnets =
    EveryDict Attribute Magnet


type Msg
    = DragStart Attribute Magnet Position
    | MouseMove Position
    | MouseUp Position
    | ToggleAttribute Attribute
