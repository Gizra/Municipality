module Event.Test exposing (all)

import App.Model exposing (BaseUrl)
import App.Types exposing (Language(..))
import Date exposing (Date)
import Date.Format
import DictList
import Event.Model exposing (..)
import Event.View exposing (view)
import Expect
import Html
import Html.Attributes exposing (class)
import Test exposing (Test, describe, test)
import Test.Html.Query as Query
import Test.Html.Selector as Selector exposing (attribute, class, tag, text)


viewTest : Test
viewTest =
    describe "view event page"
        [ test "Event without Image" <|
            \() ->
                view baseUrl English event1
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "img-thumbnail" ]
        , test "Event without Description" <|
            \() ->
                view baseUrl English event1
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "description" ]
        , test "Event without endDate" <|
            \() ->
                view baseUrl English event1
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "event-date" ]
                    |> Query.children [ tag "span" ]
                    |> Query.first
                    |> Query.has [ text "Thu, 01/01/1970" ]
        , test "Event with the same Date and different Time" <|
            \() ->
                view baseUrl English event2
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "event-date" ]
                    |> Query.children [ tag "span" ]
                    |> Query.first
                    |> Expect.all
                        [ Query.has [ text "Sat, 20/10/1973" ]
                        , Query.hasNot [ text "- 20/10/1973" ]
                        ]
        , test "Event with the different Date and different Time" <|
            \() ->
                view baseUrl English event3
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "event-date" ]
                    |> Query.children [ tag "span" ]
                    |> Query.first
                    |> Expect.all
                        [ Query.has [ text "Thu, 01/01/1970" ]
                        , Query.has [ text "- 20/10/1973" ]
                        ]
        , test "Event without Weekly Recurring" <|
            \() ->
                view baseUrl English event2
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "recurring-weekly" ]
        , test "Event without Edit link" <|
            \() ->
                view baseUrl English event2
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "btn-edit" ]
        , test "Event without Price" <|
            \() ->
                view baseUrl English event1
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "ticket-price" ]
        , test "Event without Location" <|
            \() ->
                view baseUrl English event1
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "location-wrapper" ]
        , test "Event with Image" <|
            \() ->
                view baseUrl English event2
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "img-thumbnail" ]
                    |> Query.children [ tag "img" ]
                    |> Query.each (Query.has [ attribute "src" "https://placeholdit.imgix.net/~text?w=350&h=150" ])
        , test "Event with Description" <|
            \() ->
                view baseUrl English event2
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "description" ]
                    |> Query.has [ attribute "innerHTML" "Afternoon event description" ]
        , test "Event with Weekly Recurring" <|
            \() ->
                view baseUrl English event3
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "recurring-weekly" ]
                    |> Query.has [ text "Weekly event" ]
        , test "Event with Price" <|
            \() ->
                view baseUrl English event3
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "ticket-price" ]
                    |> Query.has [ text "Price: 180 NIS" ]
        , test "Event with Location" <|
            \() ->
                view baseUrl English event3
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "location-wrapper" ]
                    |> Query.findAll [ tag "a" ]
                    |> Query.first
                    |> Query.has
                        [ attribute "href" "http://maps.google.com/test2"
                        , attribute "target" "_blank"
                        , text "Where: Test location 2"
                        ]
        ]


all : Test
all =
    describe "Event page tests"
        [ viewTest
        ]


baseUrl : BaseUrl
baseUrl =
    { path = "http://base-url"
    , query = "language=en"
    }



-- FIXTURES


event1 : Event
event1 =
    { name = "Morning event"
    , imageUrl = Nothing
    , description = Nothing
    , date = Date.fromTime 0
    , endDate = Nothing
    , recurringWeekly = False
    , ticketPrice = Nothing
    , location = Nothing
    , showEditLink = False
    }


event2 : Event
event2 =
    { name = "Afternoon event"
    , imageUrl = Just "https://placeholdit.imgix.net/~text?w=350&h=150"
    , description = Just "Afternoon event description"
    , date = Date.fromTime 120000000000
    , endDate = Just (Date.fromTime 120000000100)
    , recurringWeekly = False
    , ticketPrice = Just <| Price 120
    , location =
        Just
            { title = "Test location"
            , url = "http://maps.google.com/test"
            }
    , showEditLink = False
    }


event3 : Event
event3 =
    { name = "Evening event"
    , imageUrl = Just "https://placeholdit.imgix.net/~text?w=350&h=150"
    , description = Just "Evening event description"
    , date = Date.fromTime 0
    , endDate = Just (Date.fromTime 120000000000)
    , recurringWeekly = True
    , ticketPrice = Just <| Price 180
    , location =
        Just
            { title = "Test location 2"
            , url = "http://maps.google.com/test2"
            }
    , showEditLink = True
    }
