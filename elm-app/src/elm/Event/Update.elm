port module Event.Update
    exposing
        ( subscriptions
        , update
        )

import Event.Decoder exposing (decodeEvent)
import Event.Model exposing (Model, Msg(..))
import Json.Decode exposing (Value, decodeValue)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        HandleEvent (Ok event) ->
            { model | event = event } ! []

        HandleEvent (Err err) ->
            let
                _ =
                    Debug.log "HandleEvent" err
            in
            model ! []


subscriptions : Sub Msg
subscriptions =
    event (decodeValue decodeEvent >> HandleEvent)



-- PORTS


port event : (Value -> msg) -> Sub msg
