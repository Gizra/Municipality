module Utils.Html
    exposing
        ( colorToString
        , divider
        , emptyNode
        , formatDateAndDayWithLabel
        , formatReceptionDays
        , sectionDivider
        , showIf
        , showMaybe
        )

import App.Types exposing (Language(..))
import Contact.Model exposing (Color)
import Date exposing (Date, Day, dayOfWeek)
import Date.Format exposing (format)
import Html exposing (Html, div, text)
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
        String.join ", "
            (List.map
                (\day ->
                    translate language (DayTranslation day)
                )
                days
            )
            ++ ", "


formatDateAndDayWithLabel : Language -> Date -> Maybe Date -> String
formatDateAndDayWithLabel language date mEndDate =
    let
        labelTranslated =
            translate language <| DateLabelTranslation

        dayTranslated =
            translate language <| DayTranslation (dayOfWeek date)

        formater =
            format "%d/%m/%Y, %H:%M"

        compareFormater =
            format "%d/%m/%Y"

        dateFormated =
            formater date

        timeFormater =
            format "%H:%M"

        allDatesFormated =
            Maybe.map
                (\endDate ->
                    if compareFormater date == compareFormater endDate then
                        dateFormated ++ " - " ++ timeFormater endDate
                    else
                        dateFormated ++ " - " ++ formater endDate
                )
                mEndDate
                |> Maybe.withDefault dateFormated
    in
    labelTranslated ++ ": " ++ dayTranslated ++ ", " ++ allDatesFormated
