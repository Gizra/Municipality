module Event.View exposing (..)

import App.Types exposing (Language(..))
import DictList
import Event.Model exposing (DictListEvent, Event, EventId, Model, Msg(..))
import Event.Utils exposing (filterEvents)
import Html exposing (..)
import Html.Attributes exposing (alt, class, classList, href, placeholder, src, style, target, type_, value)
import Html.Events exposing (onClick, onInput)
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
        , pre [] [ text (toString model) ]
        ]


viewEventFilter : Language -> String -> Html Msg
viewEventFilter language filter =
    div [ class "ui icon input" ]
        [ input
            [ value filter
            , type_ "search"
            , placeholder <| translate language FilterEventsPlaceholder
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
    div [ class "card" ]
        [ h3 [] [ text <| event.name ] ]
