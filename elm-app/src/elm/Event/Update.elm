port module Event.Update
    exposing
        ( subscriptions
        , update
        )

import Event.Decoder exposing (decodeEvent, decodeEvents)
import Event.Model exposing (Model, Msg(..))
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

        HandleEvent (Ok event) ->
            { model | singleEvent = event } ! []

        HandleEvent (Err err) ->
            let
                _ =
                    Debug.log "HandleEvent" err
            in
                model ! []

        SetFilter filterString ->
            { model | filterString = filterString } ! []


subscriptions : Sub Msg
subscriptions =
    Sub.batch
        [ events (decodeValue decodeEvents >> HandleEvents)
        , event (decodeValue decodeEvent >> HandleEvent)
        ]



-- PORTS


port event : (Value -> msg) -> Sub msg


port events : (Value -> msg) -> Sub msg
