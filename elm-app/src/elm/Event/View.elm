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
import Utils.Html exposing (renderBootstrapGrid, sectionDivider, showIf, showMaybe)


view : BaseUrl -> Language -> Bool -> Model -> Html Msg
view baseUrl language showAsBlock model =
    div []
        [ showIf (not showAsBlock) <| viewEventsHeader language
        , showIf (not showAsBlock) <| viewEventFilter language model.filterString
        , showIf (not showAsBlock) <| div [ class "divider" ] [ text <| translate language MatchingResults ]
        , viewEvents baseUrl language showAsBlock model
        , showIf showAsBlock <|
            a
                [ class "btn btn-default btn-show-all", href (baseUrl.path ++ "/events?" ++ baseUrl.query) ]
                [ text <| translate language ShowAll ]
        ]


viewEventsHeader : Language -> Html Msg
viewEventsHeader language =
    div [ class "row" ]
        [ div [ class "col-xs-12" ]
            [ h1 [ class "center" ]
                [ text <| translate language EventsHeaderText ]
            ]
        ]


viewEventFilter : Language -> String -> Html Msg
viewEventFilter language filterString =
    div [ class "row" ]
        [ div [ class "col-sm-4 col-sm-push-4 col-sm-pull-4 col-xs-12" ]
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
                ( itemsInOneRow, columnClass ) =
                    if showAsBlock then
                        ( 2
                        , "col-md-6"
                        )
                    else
                        ( 3
                        , "col-md-4"
                        )
            in
                renderBootstrapGrid
                    itemsInOneRow
                    columnClass
                    (filteredEvents
                        |> DictList.map
                            (\eventId event ->
                                viewEvent showAsBlock baseUrl language ( eventId, event )
                            )
                        |> DictList.values
                    )


{-| View a single event.
-}
viewEvent : Bool -> BaseUrl -> Language -> ( EventId, Event ) -> Html msg
viewEvent showAsBlock baseUrl language ( eventId, event ) =
    let
        ( titleElement, editEvent ) =
            if showAsBlock then
                ( a
                    [ href (baseUrl.path ++ "/node/" ++ eventId ++ "?" ++ baseUrl.query) ]
                    [ h4
                        [ class "card-title" ]
                        [ text event.name ]
                    ]
                , Nothing
                )
            else
                ( h4
                    [ class "card-title" ]
                    [ text event.name ]
                , Just <|
                    showIf event.edit <|
                        a
                            [ class "btn btn-xs btn-primary pull-right btn-edit"
                            , href (baseUrl.path ++ "/node/" ++ eventId ++ "/edit" ++ "?" ++ baseUrl.query)
                            ]
                            [ text <| translate language EditText ]
                )
    in
        div [ class "thumbnail search-results" ]
            [ showMaybe <| editEvent
            , showMaybe <|
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
                [ titleElement
                , showIf (not showAsBlock) <|
                    showMaybe <|
                        Maybe.map
                            (\description ->
                                div
                                    [ class "description"
                                    , property "innerHTML" <| string description
                                    ]
                                    []
                            )
                            event.description
                , showIf (not showAsBlock) <| sectionDivider
                , div
                    [ class "event-date" ]
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
                , showIf (not showAsBlock) <|
                    showMaybe <|
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
                , showIf (not showAsBlock) <| sectionDivider
                , showIf (not showAsBlock) <|
                    div
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
