module Event.Decoder exposing (decodeEvent)

import Event.Model exposing (Event, Location, Price)
import Json.Decode exposing (Decoder, bool, fail, float, index, nullable, string)
import Json.Decode.Pipeline exposing (decode, optional, required)
import Utils.Json exposing (decodeDate, decodeInt)


decodeEvent : Decoder Event
decodeEvent =
    decode Event
        |> required "name" string
        |> optional "image_url" (nullable string) Nothing
        |> optional "description" (nullable string) Nothing
        |> required "date" decodeDate
        |> optional "end_date" (nullable decodeDate) Nothing
        |> required "recurring_weekly" bool
        |> optional "ticket_price" (nullable decodePrice) Nothing
        |> optional "location" (nullable decodeLocation) Nothing
        |> required "showEditLink" bool


decodeLocation : Decoder Location
decodeLocation =
    decode Location
        |> required "title" string
        |> required "url" string


decodePrice : Decoder Price
decodePrice =
    Json.Decode.map Event.Model.Price <|
        decodeInt
