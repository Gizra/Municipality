module Contact.Test exposing (all)

import Contact.Model exposing (..)
import Contact.Utils exposing (filterContacts)
import DictList
import Expect
import Test exposing (Test, describe, test)


filterContactsTest : Test
filterContactsTest =
    describe "filter contacts"
        [ test "should return all contacts if filter string is empty" <|
            \() ->
                Expect.equal (filterContacts contacts "") contacts
        ]


all : Test
all =
    describe "Contacts tests"
        [ filterContactsTest
        ]



-- FIXTURES


contact1 : Contact
contact1 =
    { name = "alice"
    , phone = Nothing
    }


contact2 : Contact
contact2 =
    { name = "carl"
    , phone = Just "1234"
    }


contact3 : Contact
contact3 =
    { name = "john"
    , phone = Just "5678"
    }


contacts : DictListContact
contacts =
    DictList.fromList
        [ ( "100", contact1 )
        , ( "200", contact2 )
        , ( "300", contact3 )
        ]
