module Event.View exposing (..)

import App.Model exposing (BaseUrl)
import App.Types exposing (Language(..))
import DictList
import Event.Model exposing (Event, EventId, Model, Msg(..))
import Event.Utils exposing (filterEvents)
import Html exposing (..)
import Html.Attributes exposing (class, href, id, placeholder, property, src, target, type_, value)
import Html.Events exposing (onInput)
import Json.Encode exposing (string)
import Translate exposing (TranslationId(..), translate)
import Utils.Html exposing (sectionDivider, showIf, showMaybe)


view : BaseUrl -> Language -> Bool -> Model -> Html Msg
view baseUrl language showAsBlock model =
    div []
        [ showIf (not showAsBlock) <| viewEventFilter language model.filterString
        , showIf (not showAsBlock) <| div [ class "divider" ] [ text <| translate language MatchingResults ]
        , div [] [ viewEvents baseUrl language showAsBlock model ]
        , showIf showAsBlock <|
            a
                [ class "btn btn-default btn-show-all", href (baseUrl.path ++ "/events?" ++ baseUrl.query) ]
                [ text <| translate language ShowAll ]
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
            let
                viewFunction =
                    if showAsBlock then
                        viewEventAsBlock
                    else
                        viewEvent
            in
                div [ class "row" ]
                    (filteredEvents
                        |> DictList.map
                            (\eventId event ->
                                viewFunction baseUrl language ( eventId, event )
                            )
                        |> DictList.values
                    )


{-| View a single event.
-}
viewEvent : BaseUrl -> Language -> ( EventId, Event ) -> Html msg
viewEvent baseUrl language ( eventId, event ) =
    div [ class "col-md-4" ]
        [ div [ class "thumbnail search-results" ]
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
                , showMaybe <|
                    Maybe.map
                        (\location ->
                            div
                                [ class "location-wrapper" ]
                                [ a
                                    [ href location.url, target "_blank" ]
                                    [ i
                                        [ class "fa fa-map-marker" ]
                                        []
                                    , text <| translate language (LocationText location.title)
                                    ]
                                ]
                        )
                        event.location
                , showMaybe <|
                    Maybe.map
                        (\ticketPrice ->
                            div
                                [ class "ticket-price" ]
                                [ i
                                    [ class "fa fa-ils" ]
                                    []
                                , text <| translate language PriceText ++ ": " ++ ticketPrice
                                ]
                        )
                        event.ticketPrice
                , sectionDivider
                , div
                    [ class "center" ]
                    [ a
                        [ class "btn btn-primary middle"
                        , target "_blank"
                        , href (baseUrl.path ++ "/node/" ++ eventId ++ "?" ++ baseUrl.query)
                        ]
                        [ i
                            [ class "fa fa-plus" ]
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
            [ class "thumbnail search-results"
            , href (baseUrl.path ++ "/node/" ++ eventId ++ "?" ++ baseUrl.query)
            ]
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
