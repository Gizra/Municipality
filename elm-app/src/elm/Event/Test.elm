module Event.Test exposing (all)

import App.Types exposing (Language(..))
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
        , test "should return events that has name matching the filter string 'o'" <|
            \() ->
                Expect.equal (filterEvents events "o")
                    (DictList.fromList
                        [ event1
                        , event2
                        ]
                    )
        , test "should return events that has name matching the filter string 'evening'" <|
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
                viewEvent English event1
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "image" ]
        , test "Event without Description" <|
            \() ->
                viewEvent English event1
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "description" ]
        , test "Event without End-Date" <|
            \() ->
                viewEvent English event1
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "end-date" ]
        , test "Event with Image" <|
            \() ->
                viewEvent English event2
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "image" ]
                    |> Query.children [ tag "img" ]
                    |> Query.each (Query.has [ attribute "src" "https://placeholdit.imgix.net/~text?w=350&h=150" ])
        , test "Event with Description" <|
            \() ->
                viewEvent English event2
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "description" ]
                    |> Query.has [ attribute "innerHTML" "Afternoon event description" ]
        , test "Event with End-Date" <|
            \() ->
                viewEvent English event2
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "end-date" ]
                    |> Query.has [ text "20.4.17 16:00" ]
        , test "Event with Weekly Recurring" <|
            \() ->
                viewEvent English event3
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "recurring-weekly" ]
                    |> Query.has [ text "Weekly event" ]
        , test "Event with Price" <|
            \() ->
                viewEvent English event3
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



-- FIXTURES


event1 : ( EventId, Event )
event1 =
    ( "100"
    , { name = "Morning event"
      , imageUrl = Nothing
      , description = Nothing
      , day = "Sunday"
      , date = "20.4.17 10:00"
      , endDate = Nothing
      , recurringWeekly = Nothing
      , ticketPrice = Nothing
      , moreDetailsText = "More details"
      }
    )


event2 : ( EventId, Event )
event2 =
    ( "200"
    , { name = "Afternoon event"
      , imageUrl = Just "https://placeholdit.imgix.net/~text?w=350&h=150"
      , description = Just "Afternoon event description"
      , day = "Sunday"
      , date = "20.4.17 14:00"
      , endDate = Just "20.4.17 16:00"
      , recurringWeekly = Just "Weekly event"
      , ticketPrice = Just "Price: 120"
      , moreDetailsText = "More details"
      }
    )


event3 : ( EventId, Event )
event3 =
    ( "300"
    , { name = "Evening event"
      , imageUrl = Just "https://placeholdit.imgix.net/~text?w=350&h=150"
      , description = Just "Evening event description"
      , day = "Sunday"
      , date = "20.4.17 20:00"
      , endDate = Just "20.4.17 22:00"
      , recurringWeekly = Just "Weekly event"
      , ticketPrice = Just "Price: 180"
      , moreDetailsText = "More details"
      }
    )


events : DictListEvent
events =
    DictList.fromList
        [ event1
        , event2
        , event3
        ]
