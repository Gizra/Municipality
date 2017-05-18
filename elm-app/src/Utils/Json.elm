module Utils.Json
    exposing
        ( decodeEmptyArrayAs
        )

{-| If given an empty array, decodes it as the given value. Otherwise, fail.
-}

import Json.Decode exposing (Decoder, andThen, fail, list, value, succeed)


decodeEmptyArrayAs : a -> Decoder a
decodeEmptyArrayAs default =
    list value
        |> andThen
            (\list ->
                let
                    length =
                        List.length list
                in
                    if length == 0 then
                        succeed default
                    else
                        fail <| "Expected an empty array, not an array with length: " ++ toString length
            )
