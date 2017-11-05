module Error.View exposing (..)

import App.Types exposing (Language)
import Error.Model exposing (Error, ErrorType(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Translate as Trans
import Utils.Html exposing (emptyNode)
import Utils.WebData exposing (viewError)


view : Language -> List Error -> Html msg
view language errors =
    if List.isEmpty errors then
        emptyNode
    else
        div [ class "alert alert-danger fade in alert-dismissable debug-errors" ]
            [ ul [] (List.map (viewError language) errors)
            ]


viewError : Language -> Error -> Html msg
viewError language error =
    let
        prefix =
            text <| error.module_ ++ "." ++ error.location ++ ": "
    in
    case error.error of
        Http err ->
            li []
                [ prefix
                , Utils.WebData.viewError language err
                ]

        Plain txt ->
            li []
                [ prefix
                , text txt
                ]
