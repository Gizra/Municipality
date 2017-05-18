port module Contact.Update
    exposing
        ( update
        )

import Contact.Decoder exposing (decodeContacts)
import Contact.Model exposing (Model, Msg(..))
import Json.Decode exposing (Value, decodeValue)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        HandleContacts (Ok values) ->
            model ! []

        HandleContacts (Err err) ->
            let
                _ =
                    Debug.log "HandleContacts" err
            in
                model ! []


subscriptions : Sub Msg
subscriptions =
    contacts (decodeValue decodeContacts >> HandleContacts)



-- PORTS
--
--
-- subscriptions : Sub Msg
-- subscriptions model =
--     let
--         -- These are the subscriptions that are active for a given page.
--         activePageSubscriptions =
--             case model.activePage of
--                 MailAuction _ ->
--                     Sub.map MsgPagesMailAuction <| Pages.MailAuction.Update.subscriptions model.pageMailAuction model.activePage
--
--                 _ ->
--                     Sub.none
--
--         -- Subscribe to pusher events.
--         pusherSubs =
--             case model.activePage of
--                 Sale _ ->
--                     Sub.map MsgPagesSale <| Ports.pusherSaleMessages <| Pages.Sale.Model.HandlePusherEvent << decodeValue decodePusherEvent
--
--                 SaleClerk _ ->
--                     Sub.map MsgPagesClerk <| Ports.pusherSaleMessages <| Pages.Clerk.Model.HandlePusherEvent << decodeValue decodePusherEvent
--
--                 _ ->
--                     Sub.none
--     in
--         Sub.batch
--             [ activePageSubscriptions
--             , Time.every minute Tick
--             , Ports.offline (decodeValue bool >> HandleOfflineEvent)
--             , pusherSubs
--             ]


port contacts : (Value -> msg) -> Sub msg
