port module Events.Update
    exposing
        ( subscriptions
        , update
        )

import Error.Model exposing (Error)
import Error.Utils exposing (noError, plainError)
import Events.Decoder exposing (decodeEvents)
import Events.Model exposing (Model, Msg(..))
import Http
import Json.Decode exposing (Value, decodeValue)


update : Msg -> Model -> ( Model, Cmd Msg, Maybe Error )
update msg model =
    case msg of
        HandleEvents (Ok values) ->
            ( { model | events = values }
            , Cmd.none
            , noError
            )

        HandleEvents (Err error) ->
            ( model
            , Cmd.none
            , plainError "Events.Update" "HandleEvents" error
            )

        SetFilter filterString ->
            ( { model | filterString = filterString }
            , Cmd.none
            , noError
            )


subscriptions : Sub Msg
subscriptions =
    events (decodeValue decodeEvents >> HandleEvents)



-- PORTS


port events : (Value -> msg) -> Sub msg
