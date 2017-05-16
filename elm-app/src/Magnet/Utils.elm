module Magnet.Utils exposing (..)

import Magnet.Model exposing (..)
import Mouse exposing (Position)


getPosition : Magnet -> Position
getPosition { position, drag } =
    case drag of
        Nothing ->
            position

        Just { start, current } ->
            Position
                (position.x + current.x - start.x)
                (position.y + current.y - start.y)


setDragStart : Magnet -> Position -> Magnet
setDragStart magnet position =
    let
        side =
            if position.x < magnet.position.x then
                Left
            else
                Right

        distanceFromMagnetCenter =
            sqrt << toFloat <| (magnet.position.x - position.x) ^ 2 + (magnet.position.y - position.y) ^ 2
    in
        { magnet | drag = Just (Drag position position distanceFromMagnetCenter side) }


setDragAt : Magnet -> Position -> Magnet
setDragAt magnet position =
    let
        rotationDelta =
            case magnet.drag of
                Just { start, current, distanceFromCenter, side } ->
                    let
                        sideFactor =
                            case side of
                                Left ->
                                    -1

                                Right ->
                                    1
                    in
                        toFloat (position.y - current.y) * sideFactor * distanceFromCenter / 100

                _ ->
                    Debug.crash "no drag"

        dragUpdated =
            Maybe.map
                (\{ start, current, distanceFromCenter, side } ->
                    Drag start position distanceFromCenter side
                )
                magnet.drag

        rotationUpdated =
            magnet.rotation + rotationDelta
    in
        { magnet
            | drag = dragUpdated
            , rotation = rotationUpdated
        }


setDragEnd : Magnet -> Position -> Magnet
setDragEnd magnet position =
    { magnet
        | position = getPosition magnet
        , drag = Nothing
    }
