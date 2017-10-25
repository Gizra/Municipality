module Contact.Test exposing (all)

import App.Model exposing (BaseUrl)
import App.Types exposing (Language(..))
import Contact.Model exposing (..)
import Contact.Utils exposing (filterContacts)
import Contact.View exposing (view, viewContact, viewContactAsBlock)
import Date
import DictList
import Expect
import Html
import Test exposing (Test, describe, test)
import Test.Html.Query as Query
import Test.Html.Selector as Selector exposing (attribute, class, tag, text)


filterContactsTest : Test
filterContactsTest =
    describe "filter contacts"
        [ test "should return all contacts if filter string is empty" <|
            \() ->
                Expect.equal (filterContacts contacts "") contacts
        , test "should return no matching contacts if filter string is filled" <|
            \() ->
                Expect.equal (filterContacts contacts "foo") DictList.empty
        , test "should return all contacts if filter string has a letter which exist in all of the contacts" <|
            \() ->
                Expect.equal (filterContacts contacts "a") contacts
        , test "should return second contact if filter string matches the contcat's job title" <|
            \() ->
                Expect.equal (filterContacts contacts "director")
                    (DictList.fromList
                        [ contact2 ]
                    )
        , test "should return third contact if filter string matches one of the contact's topics" <|
            \() ->
                Expect.equal (filterContacts contacts "garbage")
                    (DictList.fromList
                        [ contact3 ]
                    )
        , test "should return 2 contacts if filter string matches the contacts' department" <|
            \() ->
                Expect.equal (filterContacts contacts "Budget")
                    (DictList.fromList
                        [ contact2
                        , contact3
                        ]
                    )
        ]


viewAddContactLinkTest : Test
viewAddContactLinkTest =
    describe "view add contact link"
        [ test "should not see the add contacts link without permissions" <|
            \() ->
                view baseUrl English False False Contact.Model.emptyModel
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "add-new-contact" ]
        , test "should not see the add contacts link in block" <|
            \() ->
                view baseUrl English True True Contact.Model.emptyModel
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "add-new-contact" ]
        , test "should see the add contacts link with permissions" <|
            \() ->
                view baseUrl English False True Contact.Model.emptyModel
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "add-new-contact" ]
                    |> Query.find [ Selector.tag "button" ]
                    |> Query.has [ Selector.text "Add new contact" ]
        ]


viewContactTest : Test
viewContactTest =
    describe "view single contact"
        [ test "Contact without Email" <|
            \() ->
                viewContact baseUrl English contact1
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "email-wrapper" ]
        , test "Contact without Edit link" <|
            \() ->
                viewContact baseUrl English contact2
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "btn-edit" ]
        , test "Contact without Department" <|
            \() ->
                viewContact baseUrl English contact1
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "caption" ]
                    |> Query.children [ tag "p" ]
                    |> Query.each (Query.hasNot [ text "Budget" ])
        , test "Contact without Phone" <|
            \() ->
                viewContact baseUrl English contact1
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "phone-wrapper" ]
        , test "Contact without Topics" <|
            \() ->
                viewContact baseUrl English contact1
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "topic-wrapper" ]
        , test "Contact without ReceptionTimes" <|
            \() ->
                viewContact baseUrl English contact1
                    |> Query.fromHtml
                    |> Query.hasNot [ Selector.class "reception-times-wrapper" ]
        , test "Contact with Email" <|
            \() ->
                viewContact baseUrl English contact2
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "email-wrapper" ]
                    |> Query.children [ tag "a" ]
                    |> Query.each (Query.has [ text "carl@example.com" ])
        , test "Contact with Edit link" <|
            \() ->
                viewContact baseUrl English contact3
                    |> Query.fromHtml
                    |> Query.has [ Selector.class "btn-edit" ]
        , test "Contact with Department" <|
            \() ->
                viewContact baseUrl English contact2
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "caption" ]
                    |> Query.findAll [ tag "p" ]
                    |> Query.first
                    |> Query.has [ text "Budget" ]
        , test "Contact with Phone" <|
            \() ->
                viewContact baseUrl English contact2
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "phone-wrapper" ]
                    |> Query.children [ tag "a" ]
                    |> Query.each (Query.has [ text "1234" ])
        , test "Contact with Topics" <|
            \() ->
                viewContact baseUrl English contact2
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "topic-wrapper" ]
                    |> Query.children []
                    |> Query.each (Query.has [ tag "a" ])
        , test "Contact with ReceptionTimes and specific days" <|
            \() ->
                viewContact baseUrl English contact2
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "reception-times-wrapper" ]
                    |> Query.findAll [ Selector.class "reception-days" ]
                    |> Query.first
                    |> Query.has [ text "Mon, Tue," ]
        , test "Contact with ReceptionTimes and multiple days" <|
            \() ->
                viewContact baseUrl English contact3
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "reception-times-wrapper" ]
                    |> Query.findAll [ Selector.class "reception-days" ]
                    |> Query.first
                    |> Query.has [ text "Mon - Fri," ]
        , test "Contact block with phone" <|
            \() ->
                viewContactAsBlock baseUrl English contact2
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "phone-wrapper" ]
                    |> Query.children [ tag "a" ]
                    |> Query.each (Query.has [ attribute "href" "tel:1234" ])
        , test "Contact block with email" <|
            \() ->
                viewContactAsBlock baseUrl English contact2
                    |> Query.fromHtml
                    |> Query.find [ Selector.class "email-wrapper" ]
                    |> Query.children [ tag "a" ]
                    |> Query.each (Query.has [ attribute "href" "mailto:carl@example.com" ])
        ]


all : Test
all =
    describe "Contacts tests"
        [ filterContactsTest
        , viewAddContactLinkTest
        , viewContactTest
        ]


baseUrl : BaseUrl
baseUrl =
    { path = "http://base-url"
    , query = "language=en"
    }



-- FIXTURES


contact1 : ( ContactId, Contact )
contact1 =
    ( "100"
    , { name = "alice"
      , department = Nothing
      , jobTitle = Nothing
      , imageUrl = Nothing
      , topics = Nothing
      , phone = Nothing
      , fax = Nothing
      , email = Nothing
      , address = Nothing
      , receptionTimes = Nothing
      , edit = False
      }
    )


contact2 : ( ContactId, Contact )
contact2 =
    ( "200"
    , { name = "carl"
      , department = Just "Budget"
      , jobTitle = Just "director"
      , imageUrl = Just "https://placeholdit.imgix.net/~text?w=350&h=150"
      , topics =
            Just
                [ { id = "1"
                  , name = "arnona"
                  , color = Secondary
                  }
                , { id = "2"
                  , name = "mayor"
                  , color = Info
                  }
                ]
      , phone = Just "1234"
      , fax = Just "5678"
      , email = Just "carl@example.com"
      , address = Just "220b Baker Street, London"
      , receptionTimes =
            Just
                [ { days = [ Date.Mon, Date.Tue ]
                  , hours = "8:00-19:00"
                  , multipleDays = False
                  }
                , { days = [ Date.Sat ]
                  , hours = "8:00-12:00"
                  , multipleDays = False
                  }
                ]
      , edit = False
      }
    )


contact3 : ( ContactId, Contact )
contact3 =
    ( "300"
    , { name = "john"
      , department = Just "Budget"
      , jobTitle = Just "assistant"
      , imageUrl = Nothing
      , topics =
            Just
                [ { id = "1"
                  , name = "arnona"
                  , color = Secondary
                  }
                , { id = "2"
                  , name = "garbage"
                  , color = Info
                  }
                ]
      , phone = Just "9012"
      , fax = Just "9013"
      , email = Just "john@example.com"
      , address = Just "221b Baker Street, London"
      , receptionTimes =
            Just
                [ { days = [ Date.Mon, Date.Fri ]
                  , hours = "8:00-14:00"
                  , multipleDays = True
                  }
                ]
      , edit = True
      }
    )


contacts : DictListContact
contacts =
    DictList.fromList
        [ contact1
        , contact2
        , contact3
        ]
