module Contact.Test exposing (all)

import Contact.Model exposing (..)
import Expect
import Test exposing (Test, describe, test)


filterContactsTest : Test
filterContactsTest =
    describe "filter contacts"
        [ test "should return all contacts if filter string is empty" <|
            \() ->
                Expect.equal True True
        ]


all : Test
all =
    describe "Contacts tests"
        [ filterContactsTest
        ]
