module Utils.Html
    exposing
        ( colorToString
        , divider
        , emptyNode
        , sectionDivider
        , showIf
        , showMaybe
        , formatReceptionDays
        )

import App.Types exposing (Language(..))
import Contact.Model exposing (Color)
import Date exposing (Day)
import Html exposing (Html, div, h5, text)
import Html.Attributes exposing (class)
import String exposing (toLower)
import Translate exposing (TranslationId(..), translate)


{-| Produces an empty text node in the DOM.
-}
emptyNode : Html msg
emptyNode =
    text ""


{-| Conditionally show Html. A bit cleaner than using if expressions in middle
of an html block:

    showIf True <| text "I'm shown"
    showIf False <| text "I'm not shown"

-}
showIf : Bool -> Html msg -> Html msg
showIf condition html =
    if condition then
        html
    else
        emptyNode


{-| Show Maybe Html if Just, or empty node if Nothing.
-}
showMaybe : Maybe (Html msg) -> Html msg
showMaybe =
    Maybe.withDefault emptyNode


divider : Html msg
divider =
    div [ class "divider" ] []


sectionDivider : Html msg
sectionDivider =
    div [ class "section divider" ] []


colorToString : Color -> String
colorToString =
    toString >> toLower


formatReceptionDays : Language -> List Day -> String -> String
formatReceptionDays language days daysDelimiter =
    if daysDelimiter == "-" then
        -- Get the first and last day because the "daysDelimiter" tells us that
        -- the times for all the days are the same.
        let
            -- Need to use "case" because List.head returns a Maybe.
            firstDay =
                case List.head days of
                    Just val ->
                        val

                    Nothing ->
                        Debug.crash "error: contact reception days are corrupted."

            lastDay =
                case List.head <| List.reverse days of
                    Just val ->
                        val

                    Nothing ->
                        Debug.crash "error: contact reception days are corrupted."
        in
            translate language (DayTranslation firstDay) ++ " - " ++ translate language (DayTranslation lastDay) ++ ", "
    else
        -- Joing the days together but go through them first and convert from a
        -- list of Day to list of String, add a comma at the end.
        (String.join ", "
            (List.map
                (\day ->
                    translate language (DayTranslation day)
                )
                days
            )
        )
            ++ ", "
