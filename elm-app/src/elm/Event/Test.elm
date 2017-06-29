module Event.Test exposing (all)

import App.Model exposing (BaseUrl)
import App.Types exposing (Language(..))
import Date exposing (Date)
import Date.Format
import DictList
import Event.Model exposing (..)
import Event.Utils exposing (filterEvents)
import Event.View exposing (viewEvent)
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
        , test "should return no matching events if filter string does not match any events' names" <|
            \() ->
                Expect.equal (filterEvents events "foo") DictList.empty
        , test "should return events that has name matching the filter" <|
            \() ->
                Expect.equal (filterEvents events "o")
                    (DictList.fromList
                        [ event1
                        , event2
                        ]
                    )
        , test "should return events that has name matching the filter" <|
            \() ->
                Expect.equal (filterEvents events "evening")
                    (DictList.fromList
                        [ event3 ]
                    )
        ]


viewEventTest : Test
viewEventTest =
    describe "view single event"
        [ test "Event without Image" <|
            \() ->
                viewEvent baseUrl English event1
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "image" ]
        , test "Event without Description" <|
            \() ->
                viewEvent baseUrl English event1
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "description" ]
        , test "Event without endDate" <|
            \() ->
                viewEvent baseUrl English event1
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "event-date" ]
                    |> Query.children [ tag "span" ]
                    |> Query.first
                    |> Query.has [ text "Thu, 01/01/1970" ]
        , test "Event with the same Date and different Time" <|
            \() ->
                viewEvent baseUrl English event2
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
                viewEvent baseUrl English event3
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
                viewEvent baseUrl English event2
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "recurring-weekly" ]
        , test "Event without Price" <|
            \() ->
                viewEvent baseUrl English event1
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "ticket-price" ]
        , test "Event with Image" <|
            \() ->
                viewEvent baseUrl English event2
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "image" ]
                    |> Query.children [ tag "img" ]
                    |> Query.each (Query.has [ attribute "src" "https://placeholdit.imgix.net/~text?w=350&h=150" ])
        , test "Event with Description" <|
            \() ->
                viewEvent baseUrl English event2
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "description" ]
                    |> Query.has [ attribute "innerHTML" "Afternoon event description" ]
        , test "Event with Weekly Recurring" <|
            \() ->
                viewEvent baseUrl English event3
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "recurring-weekly" ]
                    |> Query.has [ text "Weekly event" ]
        , test "Event with Price" <|
            \() ->
                viewEvent baseUrl English event3
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "ticket-price" ]
                    |> Query.has [ text "Price: 180" ]
        ]


all : Test
all =
    describe "Events tests"
        [ filterEventsTest
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
      , ticketPrice = Just "120"
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
      , ticketPrice = Just "180"
      }
    )


events : DictListEvent
events =
    DictList.fromList
        [ event1
        , event2
        , event3
        ]
