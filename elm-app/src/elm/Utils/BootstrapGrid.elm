module Utils.BootstrapGrid exposing (renderBootstrapGrid)

{-| Splits a list into sub lists containing a given number of children.
-}

import List exposing (map, drop, take)
import Html exposing (Html, div)
import Html.Attributes exposing (class)


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


{-| Renders rows to a given number of columns. Gives the ability to wrap a list
of Html msg with columns and rows:

    renderBootstrapGrid 2 List (div [] [], div [] [])

-}
renderBootstrapGrid : Int -> List (Html msg) -> Html msg
renderBootstrapGrid columnsInOneRow colHtmlMsgList =
    let
        listOfRows =
            split columnsInOneRow colHtmlMsgList

        columnClass =
            "col-md-" ++ (toString <| 12 // columnsInOneRow)
    in
        div [] (map (renderRow columnClass) <| listOfRows)
