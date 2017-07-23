module Event.View exposing (..)

import App.Model exposing (BaseUrl)
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


view : BaseUrl -> Language -> Bool -> Model -> Html Msg
view baseUrl language showAsBlock model =
    div []
        [ showIf (not showAsBlock) <| viewEventFilter language model.filterString
        , showIf (not showAsBlock) <| div [ class "divider" ] [ text <| translate language MatchingResults ]
        , div [] [ viewEvents baseUrl language showAsBlock model ]
        , showIf showAsBlock <| a [ class "btn btn-default btn-show-all", href (baseUrl.path ++ "/events?" ++ baseUrl.query) ] [ text <| translate language ShowAll ]
        ]


viewEventFilter : Language -> String -> Html Msg
viewEventFilter language filterString =
    div [ class "row" ]
        [ div [ class "col-md-4 col-xs-12" ]
            [ div [ class "input-group" ]
                [ input
                    [ value filterString
                    , type_ "search"
                    , id "search-events"
                    , class "form-control"
                    , placeholder <| translate language FilterEventsPlaceholder
                    , onInput SetFilter
                    ]
                    []
                , span
                    [ class "input-group-btn" ]
                    [ button
                        [ class "btn btn-default" ]
                        [ i
                            [ class "fa fa-search" ]
                            []
                        ]
                    ]
                ]
            ]
        ]


{-| View all events.
-}
viewEvents : BaseUrl -> Language -> Bool -> Model -> Html msg
viewEvents baseUrl language showAsBlock { events, filterString } =
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
                                viewEventAsBlock baseUrl language ( eventId, event )
                            else
                                viewEvent baseUrl language ( eventId, event )
                        )
                    |> DictList.values
                )


{-| View a single event.
-}
viewEvent : BaseUrl -> Language -> ( EventId, Event ) -> Html msg
viewEvent baseUrl language ( eventId, event ) =
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
                , showMaybe <|
                    Maybe.map
                        (\location ->
                            div
                                [ class "ui four wide column" ]
                                [ a
                                    [ href <| Maybe.withDefault "" location.url, target "_blank" ]
                                    [ i
                                        [ class "map icon" ]
                                        []
                                    , text <| translate language WhereText ++ ": " ++ location.title
                                    ]
                                ]
                        )
                        event.location
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
                        [ class "ui button primary basic middle aligned", target "_blank", href (baseUrl.path ++ "/node/" ++ eventId ++ "?" ++ baseUrl.query) ]
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
viewEventAsBlock : BaseUrl -> Language -> ( EventId, Event ) -> Html msg
viewEventAsBlock baseUrl language ( eventId, event ) =
    div [ class "col-md-6" ]
        [ a
            [ class "thumbnail search-results", href (baseUrl.path ++ "/node/" ++ eventId ++ "?" ++ baseUrl.query) ]
            [ showMaybe <|
                Maybe.map
                    (\imageUrl ->
                        div [ class "card-img-top center" ]
                            [ img [ class "img-responsive", src imageUrl ]
                                []
                            ]
                    )
                    event.imageUrl
            , div
                [ class "caption" ]
                [ h4
                    [ class "card-title" ]
                    [ text event.name ]
                , div
                    []
                    [ span
                        []
                        [ i
                            [ class "fa fa-calendar" ]
                            []
                        , text <| translate language (DayAndDate event.date event.endDate)
                        ]
                    , showIf event.recurringWeekly <|
                        div
                            [ class "recurring-weekly" ]
                            [ i
                                [ class "fa fa-refresh" ]
                                []
                            , text <| translate language EventRecurringWeekly
                            ]
                    ]
                ]
            ]
        ]
