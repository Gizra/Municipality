module Event.View exposing (..)

import App.Types exposing (Language(..))
import DictList
import Event.Model exposing (DictListEvent, Event, EventId, Model, Msg(..))
import Event.Utils exposing (filterEvents)
import Html exposing (..)
import Html.Attributes exposing (alt, class, classList, href, id, placeholder, property, src, style, target, type_, value)
import Html.Events exposing (onClick, onInput)
import Json.Encode exposing (string)
import Translate exposing (TranslationId(..), translate)
import Utils.Html exposing (divider, sectionDivider, showIf, showMaybe)


view : Language -> Bool -> String -> Model -> Html Msg
view language showAsBlock baseUrl model =
    div
        []
        [ showIf (not showAsBlock) <| viewEventFilter language model.filterString
        , showIf (not showAsBlock) <| div [ class "divider" ] [ text <| translate language MatchingResults ]
        , div [ class "ui container center aligned" ] [ viewEvents language showAsBlock baseUrl model ]
        , showIf showAsBlock <| a [ class "btn btn-default", href (baseUrl ++ "/events") ] [ text <| translate language SeeAll ]
        ]


viewEventFilter : Language -> String -> Html Msg
viewEventFilter language filterString =
    div [ class "ui icon input" ]
        [ input
            [ value filterString
            , type_ "search"
            , id "search-events"
            , placeholder <| translate language FilterEventsPlaceholder
            , onInput SetFilter
            ]
            []
        , i [ class "search icon" ] []
        ]


{-| View all events.
-}
viewEvents : Language -> Bool -> String -> Model -> Html msg
viewEvents language showAsBlock baseUrl { events, filterString } =
    let
        filteredEvents =
            filterEvents events filterString
    in
        if DictList.isEmpty filteredEvents then
            div [] [ text <| translate language EventsNotFound ]
        else
            div [ class "row" ]
                (filteredEvents
                    |> DictList.map
                        (\eventId event ->
                            if showAsBlock then
                                viewEventAsBlock language baseUrl ( eventId, event )
                            else
                                viewEvent language baseUrl ( eventId, event )
                        )
                    |> DictList.values
                )


{-| View a single event.
-}
viewEvent : Language -> String -> ( EventId, Event ) -> Html msg
viewEvent language baseUrl ( eventId, event ) =
    div
        [ class "card" ]
        [ showMaybe <|
            Maybe.map
                (\imageUrl ->
                    div [ class "image" ]
                        [ img [ src imageUrl ]
                            []
                        ]
                )
                event.imageUrl
        , div
            [ class "content" ]
            [ div
                [ class "header" ]
                [ text event.name ]
            , showMaybe <|
                Maybe.map
                    (\description ->
                        div
                            [ class "description"
                            , property "innerHTML" <| string description
                            ]
                            []
                    )
                    event.description
            , sectionDivider
            , div
                [ class "ui row" ]
                [ div
                    [ class "ui four wide column event-date" ]
                    [ span
                        []
                        [ i
                            [ class "calendar icon" ]
                            []
                        , text <| translate language (DayAndDate event.date event.endDate)
                        ]
                    , showIf event.recurringWeekly <|
                        span
                            [ class "recurring-weekly" ]
                            [ i
                                [ class "refresh icon" ]
                                []
                            , text <| translate language EventRecurringWeekly
                            ]
                    ]
                , div
                    [ class "ui four wide column" ]
                    [ a
                        [ href "event.location_mapLink", target "_blank" ]
                        [ i
                            [ class "map icon" ]
                            []
                        , text "איפה: event.location"
                        ]
                    ]
                , showMaybe <|
                    Maybe.map
                        (\ticketPrice ->
                            div
                                [ class "ui four wide column ticket-price" ]
                                [ i
                                    [ class "shekel icon" ]
                                    []
                                , text <| translate language PriceText ++ ": " ++ ticketPrice
                                ]
                        )
                        event.ticketPrice
                , sectionDivider
                , div
                    [ class "ui four wide column center aligned" ]
                    [ a
                        [ class "ui button primary basic middle aligned", target "_blank", href (baseUrl ++ "/node/" ++ eventId) ]
                        [ i
                            [ class "add icon" ]
                            []
                        , text <| translate language MoreDetailsText
                        ]
                    ]
                ]
            ]
        ]


{-| View a single event that will appear in a block (i.e. with less information).
-}
viewEventAsBlock : Language -> String -> ( EventId, Event ) -> Html msg
viewEventAsBlock language baseUrl ( eventId, event ) =
    div [ class "col-md-4" ]
        [ a
            [ class "card", target "_blank", href (baseUrl ++ "/node/" ++ eventId) ]
            [ showMaybe <|
                Maybe.map
                    (\imageUrl ->
                        div [ class "card-img-top" ]
                            [ img [ src imageUrl ]
                                []
                            ]
                    )
                    event.imageUrl
            , div
                [ class "card-block" ]
                [ div
                    [ class "card-title" ]
                    [ text event.name ]
                ]
            , div
                [ class "card-text" ]
                [ div
                    [ class "ui four wide column event-date" ]
                    [ span
                        []
                        [ i
                            [ class "calendar icon" ]
                            []
                        , text <| translate language (DayAndDate event.date event.endDate)
                        ]
                    , showIf event.recurringWeekly <|
                        span
                            [ class "recurring-weekly" ]
                            [ i
                                [ class "refresh icon" ]
                                []
                            , text <| translate language EventRecurringWeekly
                            ]
                    ]
                ]
            ]
        ]
