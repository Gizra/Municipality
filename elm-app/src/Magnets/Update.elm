module Magnets.Update exposing (..)

import Attribute.Model exposing (Attribute)
import EveryDict exposing (values)
import Magnet.Model exposing (Magnet)
import Magnet.Utils exposing (setDragAt, setDragEnd, setDragStart)
import Magnets.Model exposing (..)
import Mouse exposing (Position)


type alias Model =
    Magnets


update : Msg -> Model -> ( Model, Cmd Msg, Maybe Attribute )
update msg model =
    case msg of
        MouseMove position ->
            let
                modelUpdated =
                    case getDraggedMagnet model of
                        Nothing ->
                            model

                        Just ( attribute, magnet ) ->
                            updateMagnet model ( attribute, setDragAt magnet position )
            in
                ( modelUpdated, Cmd.none, Nothing )

        MouseUp position ->
            let
                modelUpdated =
                    case getDraggedMagnet model of
                        Nothing ->
                            model

                        Just ( attribute, magnet ) ->
                            updateMagnet model ( attribute, setDragEnd magnet position )
            in
                ( modelUpdated, Cmd.none, Nothing )

        DragStart attribute magnet position ->
            let
                magnetUpdated =
                    setDragStart magnet position

                modelUpdated =
                    updateMagnet model ( attribute, magnetUpdated )
            in
                ( modelUpdated, Cmd.none, Nothing )

        ToggleAttribute attribute ->
            ( model, Cmd.none, Just attribute )


{-| Replace the updated magnet on the magnets dictionary.
-}
updateMagnet : Model -> ( Attribute, Magnet ) -> Model
updateMagnet model ( attribute, magnet ) =
    EveryDict.insert attribute magnet model


getDraggedMagnet : Model -> Maybe ( Attribute, Magnet )
getDraggedMagnet model =
    let
        isMagnetDragged : ( Attribute, Magnet ) -> Bool
        isMagnetDragged ( _, magnet ) =
            case magnet.drag of
                Just _ ->
                    True

                Nothing ->
                    False
    in
        EveryDict.toList model
            |> List.filter isMagnetDragged
            |> List.head


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Mouse.moves MouseMove
        , Mouse.ups MouseUp
        ]
