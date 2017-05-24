module Contact.Test exposing (all)

import Contact.Model exposing (..)
import Contact.Utils exposing (filterContacts)
import DictList
import Expect
import Test exposing (Test, describe, test)


filterContactsTest : Test
filterContactsTest =
    describe "filter contacts"
        [ test "should return all contacts if filter string is empty"
            <| \() ->
                Expect.equal (filterContacts contacts "") contacts
        , test "should return no matching contacts if filter string is filled"
            <| \() ->
                Expect.equal (filterContacts contacts "foo") DictList.empty
        , test "should return no contacts if filter string has other names"
            <| \() ->
                Expect.equal (filterContacts contacts "a")
                    (DictList.fromList
                        [ contact1
                        , contact2
                        ]
                    )
        ]


all : Test
all =
    describe "Contacts tests"
        [ filterContactsTest
        ]



-- FIXTURES


contact1 : ( ContactId, Contact )
contact1 =
    ( "100"
    , { name = "alice"
      , phone = Nothing
      , email = Nothing
      }
    )


contact2 : ( ContactId, Contact )
contact2 =
    ( "200"
    , { name = "carl"
      , phone = Just "1234"
      , email = Just "carl@example.com"
      }
    )


contact3 : ( ContactId, Contact )
contact3 =
    ( "300"
    , { name = "john"
      , phone = Just "5678"
      , email = Just "john@example.com"
      }
    )


contacts : DictListContact
contacts =
    DictList.fromList
        [ contact1
        , contact2
        , contact3
        ]
