module Utils.Html
    exposing
        ( colorToString
        , divider
        , emptyNode
        , renderBootstrapGrid
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
import List exposing (..)


{-| Produces an empty text node in the DOM.
-}
emptyNode : Html msg
emptyNode =
    text ""


{-| Splits a list into sub lists containing a given number of children.
-}
split : Int -> List a -> List (List a)
split numberOfChildren list =
    case take numberOfChildren list of
        [] ->
            []

        listHead ->
            listHead :: split numberOfChildren (drop numberOfChildren list)


{-| Render the column with a given class.
-}
renderColumn : String -> Html msg -> Html msg
renderColumn columnClass column =
    div [ class columnClass ] [ column ]


{-| Render the row with a list of columns.
-}
renderRow : String -> List (Html msg) -> Html msg
renderRow columnClass row =
    div [ class "row" ] (List.map (renderColumn columnClass) <| row)


{-| Renders rows to a given number of columns. Gives the ability to wrap a list og
Html msg with columns and rows:

    renderBootstrapGrid 2 "col-md-6" List (div [] [], div [] [])

-}
renderBootstrapGrid : Int -> String -> List (Html msg) -> Html msg
renderBootstrapGrid columnsInRow columnClass colHtmlMsgList =
    let
        listOfRows =
            split columnsInRow colHtmlMsgList
    in
        div [] (map (renderRow columnClass) <| listOfRows)


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
        (String.join ", "
            (List.map
                (\day ->
                    translate language (DayTranslation day)
                )
                days
            )
        )
            ++ ", "
