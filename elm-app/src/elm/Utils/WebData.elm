module Utils.WebData exposing (errorString, getError, sendWithHandler, viewError, whenSuccess)

import App.Types exposing (Language)
import Html exposing (..)
import Http
import HttpBuilder exposing (..)
import Json.Decode exposing (Decoder)
import RemoteData exposing (..)
import Translate as Trans exposing (TranslationId(..), translate)


{-| Get Error message as `String`.
-}
errorString : Language -> Http.Error -> String
errorString language error =
    case error of
        Http.BadUrl message ->
            translate language <| HttpError Trans.ErrorBadUrl

        Http.BadPayload message _ ->
            translate language <| HttpError <| Trans.ErrorBadPayload message

        Http.NetworkError ->
            translate language <| HttpError Trans.ErrorNetworkError

        Http.Timeout ->
            translate language <| HttpError Trans.ErrorTimeout

        Http.BadStatus response ->
            translate language <| HttpError <| Trans.ErrorBadStatus response.status.message


{-| Provide some `Html` to view an error message.
-}
viewError : Language -> Http.Error -> Html any
viewError language error =
    div [] [ text <| errorString language error ]


whenSuccess : RemoteData e a -> result -> (a -> result) -> result
whenSuccess remoteData default func =
    case remoteData of
        Success val ->
            func val

        _ ->
            default


sendWithHandler : Decoder a -> (Result Http.Error a -> msg) -> RequestBuilder a1 -> Cmd msg
sendWithHandler decoder tagger builder =
    builder
        |> withExpect (Http.expectJson decoder)
        |> send tagger


getError : RemoteData e a -> Maybe e
getError remoteData =
    case remoteData of
        Failure err ->
            Just err

        _ ->
            Nothing
