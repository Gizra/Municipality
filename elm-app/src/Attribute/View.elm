module Attribute.View
    exposing
        ( viewEmptyResult
        )

import App.Model exposing (Msg(..))
import Attribute.Model exposing (Attribute)
import Html exposing (..)
import Html.Attributes exposing (alt, class, classList, href, src, style, target)


{-| Show no results found.
-}
viewEmptyResult : List Attribute.Model.Attribute -> Html Msg
viewEmptyResult attributes =
    div [ class "ui grid" ]
        [ div [ class "sixteen wide mobile sixteen wide tablet twelve wide computer centered column" ]
            [ div
                [ class "ui transparent segment" ]
                [ p [] [ text "We try to be diverse, but you have reached our limit, we don't have such a person in Gizra." ]
                , p [] [ text "On the other hand, maybe it's you? Go ahead, apply for a job!" ]
                ]
            ]
        ]
