port module Contact.Update
    exposing
        ( subscriptions
        , update
        )

import Contact.Decoder exposing (decodeContacts)
import Contact.Model exposing (Model, Msg(..))
import Error.Model exposing (Error)
import Error.Utils exposing (noError, plainError)
import Http exposing (getString)
import Json.Decode exposing (Value, decodeValue)


update : Msg -> Model -> ( Model, Cmd Msg, Maybe Error )
update msg model =
    case msg of
        HandleContacts (Ok values) ->
            ( { model | contacts = values }
            , Cmd.none
            , noError
            )

        HandleContacts (Err error) ->
            ( model
            , Cmd.none
            , plainError "Contact.Update" "HandleContacts" error
            )

        SetFilter filterString ->
            ( { model | filterString = filterString }
            , Cmd.none
            , noError
            )


subscriptions : Sub Msg
subscriptions =
    contacts (decodeValue decodeContacts >> HandleContacts)



-- PORTS


port contacts : (Value -> msg) -> Sub msg
