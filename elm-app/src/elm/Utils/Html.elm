module Utils.Html
    exposing
        ( colorToString
        , divider
        , emptyNode
        , eventDateElement
        , formatReceptionDays
        , sectionDivider
        , showIf
        , showMaybe
        )

import App.Types exposing (Language(..))
import Contact.Model exposing (Color)
import Date exposing (Date, Day, dayOfWeek)
import Date.Format exposing (format)
import Html exposing (Html, div, span, text)
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


{-| Produces the event date element depending on the language and type of event.
(i.e. recurring or not)
-}
eventDateElement : Language -> Date -> Maybe Date -> Bool -> Html msg
eventDateElement language date mEndDate recurring =
    let
        labelTranslated =
            translate language <| DateLabelTranslation

        untilLabelTranslated =
            translate language <| UntilTranslation

        beginDayTranslated =
            translate language <| DayTranslation (dayOfWeek date)

        formater =
            format "%d/%m/%Y, %H:%M"

        compareFormater =
            format "%d/%m/%Y"

        dateFormated =
            formater date

        timeFormater =
            format "%H:%M"

        -- Date format depends on wether the event is "recurring" or not, if yes
        -- then we don't diaply the date, only the name of the day and the time.
        beginDateFormmated =
            if recurring then
                labelTranslated ++ ": " ++ beginDayTranslated ++ ", " ++ timeFormater date
            else
                labelTranslated ++ ": " ++ beginDayTranslated ++ ", " ++ dateFormated

        datesElement =
            Maybe.map
                (\endDate ->
                    let
                        endDayTranslated =
                            translate language <| DayTranslation (dayOfWeek endDate)

                        endDateFormmated =
                            -- Same logic for "recurring" end date.
                            if recurring then
                                untilLabelTranslated ++ ": " ++ endDayTranslated ++ ", " ++ timeFormater endDate
                            else
                                untilLabelTranslated ++ ": " ++ endDayTranslated ++ ", " ++ formater endDate
                    in
                    -- Event ends on the same day and therefore we don't display
                    -- the name of the ending day.
                    if compareFormater date == compareFormater endDate then
                        span []
                            [ span [ class "begin-date" ] [ text <| beginDateFormmated ++ " - " ]
                            , span [ class "end-date" ] [ text <| timeFormater endDate ]
                            ]
                    else
                        span []
                            [ span [ class "begin-date" ] [ text <| beginDateFormmated ]
                            , span [ class "different-end-date ml-lg" ] [ text endDateFormmated ]
                            ]
                )
                mEndDate
                |> Maybe.withDefault (span [ class "begin-date" ] [ text beginDateFormmated ])
    in
    datesElement
