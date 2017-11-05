port module Event.Update
    exposing
        ( subscriptions
        , update
        )

import Error.Model exposing (Error)
import Error.Utils exposing (noError, plainError)
import Event.Decoder exposing (decodeEvent)
import Event.Model exposing (Model, Msg(..))
import Http
import Json.Decode exposing (Value, decodeValue)


update : Msg -> Model -> ( Model, Cmd Msg, Maybe Error )
update msg model =
    case msg of
        HandleEvent (Ok event) ->
            ( { model | event = event }
            , Cmd.none
            , noError
            )

        HandleEvent (Err error) ->
            ( model
            , Cmd.none
            , plainError "Event.Update" "HandleEvent" error
            )


subscriptions : Sub Msg
subscriptions =
    event (decodeValue decodeEvent >> HandleEvent)



-- PORTS


port event : (Value -> msg) -> Sub msg
