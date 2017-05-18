module App.Decoder
    exposing
        ( decodePage
        )

import App.Types exposing (Page(..))
import Json.Decode exposing (Decoder, andThen, fail, string, succeed)


decodePage : Decoder Page
decodePage =
    string
        |> andThen
            (\value ->
                case value of
                    "contact" ->
                        succeed Contact

                    _ ->
                        fail <| "Could not recognise page: " ++ value
            )
