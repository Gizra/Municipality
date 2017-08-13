module Utils.Test exposing (all)

import Utils.Html exposing (..)
import Expect
import Html exposing (..)
import Html.Attributes exposing (class)
import Test exposing (Test, describe, test)
import Test.Html.Query as Query
import Test.Html.Selector as Selector exposing (attribute, class, tag, text)


renderBootstrapGridTest : Test
renderBootstrapGridTest =
    describe "render bootstrap grid"
        [ test "Grid with one column and one row" <|
            \() ->
                renderBootstrapGrid 1 oneColumn
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "row" ]
                    |> Query.has [ Selector.class "col-md-12" ]
        , test "Grid with two columns and one row" <|
            \() ->
                renderBootstrapGrid 2 twoColumns
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "row" ]
                    |> Query.children [ tag "div" ]
                    |> Query.each (Query.has [ Selector.class "col-md-6" ])
        , test "Grid with three columns and one row" <|
            \() ->
                renderBootstrapGrid 3 threeColumns
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "row" ]
                    |> Query.children [ tag "div" ]
                    |> Query.each (Query.has [ Selector.class "col-md-4" ])
        , test "Grid with two columns and two row (count rows)" <|
            \() ->
                renderBootstrapGrid 2 threeColumns
                    |> Query.fromHtml
                    |> Query.findAll [ Selector.class "row" ]
                    |> Query.count (Expect.equal 2)
        , test "Grid with two columns and two row (count columns)" <|
            \() ->
                renderBootstrapGrid 2 threeColumns
                    |> Query.fromHtml
                    |> Query.findAll [ Selector.class "row" ]
                    |> Query.index 1
                    |> Query.children [ Selector.class "col-md-6" ]
                    |> Query.count (Expect.equal 1)
        ]


all : Test
all =
    describe "Grid rendering tests"
        [ renderBootstrapGridTest ]



-- FIXTURES


oneColumn : List (Html msg)
oneColumn =
    [ div [] [] ]


twoColumns : List (Html msg)
twoColumns =
    [ div [] []
    , div [] []
    ]


threeColumns : List (Html msg)
threeColumns =
    [ div [] []
    , div [] []
    , div [] []
    ]
