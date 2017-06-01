module Event.View exposing (..)

import App.Types exposing (Language(..))
import DictList
import Event.Model exposing (DictListEvent, Event, EventId, Model, Msg(..))
import Event.Utils exposing (filterEvents)
import Html exposing (..)
import Html.Attributes exposing (alt, class, classList, href, id, placeholder, property, src, style, target, type_, value)
import Html.Events exposing (onClick, onInput)
import Json.Encode exposing (string)
import Svg.Attributes exposing (mode)
import Translate exposing (TranslationId(..), translate)
import Utils.Html exposing (divider, sectionDivider, showIf, showMaybe)


view : Language -> Model -> Html Msg
view language model =
    div
        []
        [ viewEventFilter language model.filterString
        , div [ class "ui horizontal divider" ]
            [ text <| translate language MatchingResults ]
        , div [ class "ui container center aligned" ]
            [ viewEvents language model ]
        , divider
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
viewEvents : Language -> Model -> Html msg
viewEvents language { events, filterString } =
    let
        filteredEvents =
            filterEvents events filterString
    in
        if DictList.isEmpty filteredEvents then
            div [] [ text <| translate language EventsNotFound ]
        else
            div [ class "ui link cards" ]
                (filteredEvents
                    |> DictList.map
                        (\eventId event ->
                            viewEvent language ( eventId, event )
                        )
                    |> DictList.values
                )


{-| View a single event.
-}
viewEvent : Language -> ( EventId, Event ) -> Html msg
viewEvent language ( eventId, event ) =
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
            , div
                [ class "divider" ]
                []
            , div
                [ class "ui row" ]
                [ div
                    [ class "ui four wide column" ]
                    [ span
                        []
                        [ i
                            [ class "calendar icon" ]
                            []
                        , text
                            "event.day event.date event.time"
                        ]
                    , span
                        []
                        [ text "- event.endDate" ]
                    , span
                        []
                        [ i
                            [ class "refresh icon" ]
                            []
                        , text
                            "(אירוע שבועי)"
                        ]
                    ]
                , div
                    [ class "ui four wide column" ]
                    [ a
                        [ href "event.location_mapLink", target "_blank" ]
                        [ i
                            [ class "map icon" ]
                            []
                        , text
                            "איפה: event.location"
                        ]
                    ]
                , div
                    [ class "ui four wide column" ]
                    [ i
                        [ class "shekel icon" ]
                        []
                    , text
                        "מחיר: event.price"
                    ]
                , div
                    [ class "ui four wide column center aligned" ]
                    [ a
                        [ class "ui button primary basic middle aligned", target "_blank", href "event.detailsLink" ]
                        [ i
                            [ class "add icon" ]
                            []
                        , text
                            "לפרטים נוספים"
                        ]
                    ]
                ]
            ]
        ]
