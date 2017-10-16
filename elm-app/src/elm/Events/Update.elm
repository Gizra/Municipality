port module Events.Update
    exposing
        ( subscriptions
        , update
        )

import Events.Decoder exposing (decodeEvents)
import Events.Model exposing (Model, Msg(..))
import Json.Decode exposing (Value, decodeValue)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        HandleEvents (Ok values) ->
            { model | events = values } ! []

        HandleEvents (Err err) ->
            let
                _ =
                    Debug.log "HandleEvents" err
            in
            model ! []

        SetFilter filterString ->
            { model | filterString = filterString } ! []


subscriptions : Sub Msg
subscriptions =
    events (decodeValue decodeEvents >> HandleEvents)



-- PORTS


port events : (Value -> msg) -> Sub msg
