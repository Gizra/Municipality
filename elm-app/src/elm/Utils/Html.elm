module Utils.Html
    exposing
        ( colorToString
        , divider
        , emptyNode
        , sectionDivider
        , showIf
        , showIfWithDefault
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


{-| Conditionally show Html with a default Html if the condition doesn't pass
A bit cleaner than using if expressions in middle of an html block:

    showIfWithDefault True (text "I'm shown") (text "I'm default")

-}
showIfWithDefault : Bool -> Html msg -> Html msg -> Html msg
showIfWithDefault condition html defaultHtml =
    if condition then
        html
    else
        defaultHtml


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


formatReceptionDays : Language -> List Day -> Bool -> String
formatReceptionDays language days multipleDays =
    if multipleDays then
        -- Get the first and last day because the "multipleDays" means more than
        -- 2 days have the same hours and should be grouped together.
        let
            firstDay =
                Maybe.map identity (List.head days)
                    |> Maybe.withDefault Date.Sun

            lastDay =
                Maybe.map identity (List.head <| List.reverse days)
                    |> Maybe.withDefault Date.Sat
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
