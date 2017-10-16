module Utils.BootstrapGrid exposing (renderBootstrapGrid)

{-| Splits a list into sub lists containing a given number of children.
-}

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import List exposing (drop, map, take)


split : Int -> List a -> List (List a)
split numberOfChildren list =
    if List.isEmpty list then
        []
    else
        take numberOfChildren list :: split numberOfChildren (drop numberOfChildren list)


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


{-| Renders rows to a given number of columns. Gives the ability to wrap a list
of Html msg with columns and rows:

    renderBootstrapGrid 2 List (div [] [], div [] [])

This will give classes for mobile and tablet, mobile will allways have one
element per row and tablet will have half (or close to it with odd numbers) the
number of elements given for desktop.

-}
renderBootstrapGrid : Int -> List (Html msg) -> Html msg
renderBootstrapGrid columnsInOneRow colHtmlMsgList =
    let
        listOfRows =
            split columnsInOneRow colHtmlMsgList

        columnClass =
            "col-md-"
                ++ (toString <| 12 // columnsInOneRow)
                ++ " col-sm-"
                ++ (toString <| 12 // (columnsInOneRow - (columnsInOneRow // 2)))
                ++ " col-xs-12"
    in
    div [] (map (renderRow columnClass) <| listOfRows)
