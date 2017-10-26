module Events.Test exposing (all)

import App.Model exposing (BaseUrl)
import App.Types exposing (Language(..))
import Date exposing (Date)
import Date.Format
import DictList
import Event.Model exposing (..)
import Events.Model exposing (..)
import Events.Utils exposing (filterEvents)
import Events.View exposing (view, viewEvent)
import Expect
import Html
import Html.Attributes exposing (class)
import Test exposing (Test, describe, test)
import Test.Html.Query as Query
import Test.Html.Selector as Selector exposing (attribute, class, tag, text)


filterEventsTest : Test
filterEventsTest =
    describe "filter events"
        [ test "should return all events if filter string is empty" <|
            \() ->
                Expect.equal (filterEvents events "") events
        , test "should return no matching events if filter string does not match any events' names/description/location" <|
            \() ->
                Expect.equal (filterEvents events "foo") DictList.empty
        , test "should return events that has description matching the filter" <|
            \() ->
                Expect.equal (filterEvents events "description")
                    (DictList.fromList
                        [ event2
                        , event3
                        ]
                    )
        , test "should return events that has names matching the filter" <|
            \() ->
                Expect.equal (filterEvents events "evening")
                    (DictList.fromList
                        [ event3 ]
                    )
        , test "should return events that has location matching the filter" <|
            \() ->
                Expect.equal (filterEvents events "location 2")
                    (DictList.fromList
                        [ event3 ]
                    )
        ]


viewAddEventLinkTest : Test
viewAddEventLinkTest =
    describe "view add event link"
        [ test "should not see the add events link without permissions" <|
            \() ->
                view baseUrl English False False Events.Model.emptyModel
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "add-new-event" ]
        , test "should not see the add events link in block" <|
            \() ->
                view baseUrl English True True Events.Model.emptyModel
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "add-new-event" ]
        , test "should see the add events link with permissions" <|
            \() ->
                view baseUrl English False True Events.Model.emptyModel
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "add-new-event" ]
                    |> Query.find [ Selector.tag "button" ]
                    |> Query.has [ Selector.text "Add new event" ]
        ]


viewEventTest : Test
viewEventTest =
    describe "view single event card"
        [ test "Event without Image" <|
            \() ->
                viewEvent baseUrl English event1 False
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "image" ]
        , test "Event without Description" <|
            \() ->
                viewEvent baseUrl English event1 False
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "description" ]
        , test "Event without endDate" <|
            \() ->
                viewEvent baseUrl English event1 False
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "event-date" ]
                    |> Query.children [ tag "span" ]
                    |> Query.first
                    |> Query.has [ text "Thu, 01/01/1970" ]
        , test "Event with the same Date and different Time" <|
            \() ->
                viewEvent baseUrl English event2 False
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
                viewEvent baseUrl English event3 False
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
                viewEvent baseUrl English event2 False
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "recurring-weekly" ]
        , test "Event without Edit link" <|
            \() ->
                viewEvent baseUrl English event2 False
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "btn-edit" ]
        , test "Event without Price" <|
            \() ->
                viewEvent baseUrl English event1 False
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "ticket-price" ]
        , test "Event without Location" <|
            \() ->
                viewEvent baseUrl English event1 False
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "location-wrapper" ]
        , test "Event with Image" <|
            \() ->
                viewEvent baseUrl English event2 False
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "card-img-top" ]
                    |> Query.children [ tag "img" ]
                    |> Query.each (Query.has [ attribute "src" "https://placeholdit.imgix.net/~text?w=350&h=150" ])
        , test "Event with Description" <|
            \() ->
                viewEvent baseUrl English event2 False
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "description" ]
                    |> Query.has [ attribute "innerHTML" "Afternoon event description" ]
        , test "Event with Weekly Recurring" <|
            \() ->
                viewEvent baseUrl English event3 False
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "recurring-weekly" ]
                    |> Query.has [ text "Weekly event" ]
        , test "Event with Price" <|
            \() ->
                viewEvent baseUrl English event3 False
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "ticket-price" ]
                    |> Query.has [ text "Price: 180 NIS" ]
        , test "Event with Location" <|
            \() ->
                viewEvent baseUrl English event3 False
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "location-wrapper" ]
                    |> Query.findAll [ tag "a" ]
                    |> Query.first
                    |> Query.has
                        [ attribute "href" "http://maps.google.com/test2"
                        , attribute "target" "_blank"
                        , text "Where: Test location 2"
                        ]
        , test "Event with Edit link" <|
            \() ->
                viewEvent baseUrl English event3 False
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "btn-edit" ]
                    |> Query.has [ text "Edit" ]
        ]


all : Test
all =
    describe "Events tests"
        [ filterEventsTest
        , viewAddEventLinkTest
        , viewEventTest
        ]


baseUrl : BaseUrl
baseUrl =
    { path = "http://base-url"
    , query = "language=en"
    }



-- FIXTURES


event1 : ( EventId, Event )
event1 =
    ( "100"
    , { name = "Morning event"
      , imageUrl = Nothing
      , description = Nothing
      , date = Date.fromTime 0
      , endDate = Nothing
      , recurringWeekly = False
      , ticketPrice = Nothing
      , location = Nothing
      , showEditLink = False
      }
    )


event2 : ( EventId, Event )
event2 =
    ( "200"
    , { name = "Afternoon event"
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
    )


event3 : ( EventId, Event )
event3 =
    ( "300"
    , { name = "Evening event"
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
    )


events : DictListEvent
events =
    DictList.fromList
        [ event1
        , event2
        , event3
        ]
