module Contact.Test exposing (all)

import App.Types exposing (Language(..))
import Contact.Model exposing (..)
import Contact.Utils exposing (filterContacts)
import Contact.View exposing (viewContact)
import DictList
import Expect
import Html
import Html.Attributes exposing (class)
import Test exposing (Test, describe, test)
import Test.Html.Query as Query
import Test.Html.Selector as Selector exposing (class, text, tag)


filterContactsTest : Test
filterContactsTest =
    describe "filter contacts"
        [ test "should return all contacts if filter string is empty" <|
            \() ->
                Expect.equal (filterContacts contacts "") contacts
        , test "should return no matching contacts if filter string is filled" <|
            \() ->
                Expect.equal (filterContacts contacts "foo") DictList.empty
        , test "should return no contacts if filter string has other names" <|
            \() ->
                Expect.equal (filterContacts contacts "a")
                    (DictList.fromList
                        [ contact1
                        , contact2
                        ]
                    )
        ]


viewContactTest : Test
viewContactTest =
    describe "view single contact"
        [ test "Contact without Email" <|
            \() ->
                viewContact English contact1
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "email" ]
        , test "Contact without Phone" <|
            \() ->
                viewContact English contact1
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "phone" ]
        , test "Contact with Email" <|
            \() ->
                viewContact English contact2
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "email-wrapper" ]
                    |> Query.children [ tag "a" ]
                    |> Query.each (Query.has [ text "carl@example.com" ])
        , test "Contact with Phone" <|
            \() ->
                viewContact English contact2
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "phone-wrapper" ]
                    |> Query.children [ tag "a" ]
                    |> Query.each (Query.has [ text "1234" ])
        ]


all : Test
all =
    describe "Contacts tests"
        [ filterContactsTest
        , viewContactTest
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
