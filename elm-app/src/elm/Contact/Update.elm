port module Contact.Update
    exposing
        ( subscriptions
        , update
        )

import Contact.Decoder exposing (decodeContacts)
import Contact.Model exposing (Model, Msg(..))
import Json.Decode exposing (Value, decodeValue)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        HandleContacts (Ok values) ->
            { model | contacts = values } ! []

        HandleContacts (Err err) ->
            let
                _ =
                    Debug.log "HandleContacts" err
            in
                model ! []

        SetFilter filterString ->
            { model | filterString = filterString } ! []


subscriptions : Sub Msg
subscriptions =
    contacts (decodeValue decodeContacts >> HandleContacts)



-- PORTS


port contacts : (Value -> msg) -> Sub msg
