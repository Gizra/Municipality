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
                    |> Query.hasNot [ Selector.class "email-wrapper" ]
        , test "Contact without Phone" <|
            \() ->
                viewContact English contact1
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "phone-wrapper" ]
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
      , jobTitle = Nothing
      , imageUrl = Nothing
      , topics = Nothing
      , phone = Nothing
      , fax = Nothing
      , email = Nothing
      , address = Nothing
      , receptionTimes = Nothing
      }
    )


contact2 : ( ContactId, Contact )
contact2 =
    ( "200"
    , { name = "carl"
      , jobTitle = Just "director"
      , imageUrl = Just "https://placeholdit.imgix.net/~text?w=350&h=150"
      , topics =
            Just
                [ { id = "1"
                  , name = "arnona"
                  }
                , { id = "2"
                  , name = "garbage"
                  }
                ]
      , phone = Just "1234"
      , fax = Just "5678"
      , email = Just "carl@example.com"
      , address = Just "220b Baker Street, London"
      , receptionTimes =
            Just
                [ { days = "Mon-Fri"
                  , hours = "8:00-19:00"
                  }
                , { days = "Sat"
                  , hours = "8:00-12:00"
                  }
                ]
      }
    )


contact3 : ( ContactId, Contact )
contact3 =
    ( "300"
    , { name = "john"
      , jobTitle = Just "assistant"
      , imageUrl = Nothing
      , topics =
            Just
                [ { id = "1"
                  , name = "arnona"
                  }
                , { id = "2"
                  , name = "garbage"
                  }
                ]
      , phone = Just "9012"
      , fax = Just "9013"
      , email = Just "john@example.com"
      , address = Just "221b Baker Street, London"
      , receptionTimes =
            Just
                [ { days = "Mon-Fri"
                  , hours = "8:00-14:00"
                  }
                ]
      }
    )


contacts : DictListContact
contacts =
    DictList.fromList
        [ contact1
        , contact2
        , contact3
        ]
