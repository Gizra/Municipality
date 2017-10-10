module Event.View exposing (view)

import App.Model exposing (BaseUrl)
import App.Types exposing (Language(..))
import Event.Model exposing (Event, EventId, Model, Msg(..))
import Html exposing (..)
import Html.Attributes exposing (alt, class, href, id, property, src, target)
import Json.Encode exposing (string)
import Translate exposing (TranslationId(..), translate)
import Utils.Html exposing (formatDateAndDayWithLabel, sectionDivider, showIf, showMaybe)


view : BaseUrl -> Language -> Event -> Html Msg
view baseUrl language event =
    div [ class "event-page" ]
        [ div
            [ class "row text-center" ]
            [ div
                [ class "col-xs-12" ]
                [ h2
                    [ class "page-title" ]
                    [ text <| translate language EventsHeaderText ]
                ]
            ]
        , div
            [ class "row panel panel-default" ]
            [ div
                [ class "col-xs-12 text-center" ]
                [ div
                    [ class "heading heading-primary heading-border heading-bottom-border" ]
                    [ h1
                        [ class "heading-primary" ]
                        [ text event.name ]
                    ]
                ]
            , div
                [ class "col-xs-12" ]
                [ div
                    [ class "row text-center" ]
                    [ div
                        [ class "col-md-4 event-date" ]
                        [ span
                            []
                            [ i
                                [ class "fa fa-calendar" ]
                                []
                            , text <| formatDateAndDayWithLabel language event.date event.endDate
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
                    , div
                        [ class "col-md-4" ]
                        [ showMaybe <|
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
                        ]
                    , div
                        [ class "col-md-4" ]
                        [ showMaybe <|
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
                        ]
                    ]
                , div
                    [ class "row panel-body text-center" ]
                    [ div [ class "col-xs-12" ]
                        [ showMaybe <|
                            Maybe.map
                                (\imageUrl ->
                                    span
                                        [ class "img-thumbnail" ]
                                        [ img
                                            [ class "img-responsive"
                                            , src imageUrl
                                            , alt event.name
                                            ]
                                            []
                                        ]
                                )
                                event.imageUrl
                        ]
                    ]
                , sectionDivider
                , div [ class "row" ]
                    [ div [ class "col-xs-12" ]
                        [ showMaybe <|
                            Maybe.map
                                (\description ->
                                    div
                                        [ class "description"
                                        , property "innerHTML" <| string description
                                        ]
                                        []
                                )
                                event.description
                        ]
                    ]
                ]
            ]
        ]
