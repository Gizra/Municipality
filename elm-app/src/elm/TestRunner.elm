port module Main exposing (..)

import Contact.Test
import Event.Test
import Events.Test
import Json.Encode exposing (Value)
import Test exposing (Test, describe)
import Test.Runner.Node exposing (TestProgram, run)
import Utils.Test


allTests : Test
allTests =
    describe "All tests"
        [ Contact.Test.all
        , Event.Test.all
        , Events.Test.all
        , Utils.Test.all
        ]


main : TestProgram
main =
    run emit allTests


port emit : ( String, Value ) -> Cmd msg
