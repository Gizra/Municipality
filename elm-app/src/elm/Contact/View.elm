module Contact.View exposing (..)

import App.Types exposing (Language(..))
import Contact.Model exposing (Contact, ContactId, DictListContact, Model, Msg(..))
import Contact.Utils exposing (filterContacts)
import Debug exposing (log)
import DictList
import Html exposing (..)
import Html.Attributes exposing (alt, class, classList, href, placeholder, src, style, target, type_, value)
import Html.Events exposing (onClick, onInput)
import Translate exposing (TranslationId(..), translate)
import Utils.Html exposing (divider, sectionDivider, showIf, showMaybe)


view : Language -> Model -> Html Msg
view language model =
    div
        []
        [ viewContactFilter language model.filterString
        , div [ class "ui horizontal divider" ]
            [ text <| translate language MatchingResults ]
        , div [ class "ui container center aligned" ]
            [ viewContacts language model ]
        ]


viewContactFilter : Language -> String -> Html Msg
viewContactFilter language filter =
    div [ class "ui icon input" ]
        [ input
            [ value filter
            , type_ "search"
            , placeholder <| translate language FilterContactsPlaceholder
            , onInput SetFilter
            ]
            []
        , i [ class "search icon" ] []
        ]


{-| View all contacts.
-}
viewContacts : Language -> Model -> Html msg
viewContacts language { contacts, filterString } =
    let
        filteredContacts =
            filterContacts contacts filterString
    in
        if DictList.isEmpty filteredContacts then
            div [] [ text <| translate language ContactsNotFound ]
        else
            div [ class "ui link cards" ]
                (filteredContacts
                    |> DictList.map
                        (\contactId contact ->
                            viewContact language ( contactId, contact )
                        )
                    |> DictList.values
                )


{-| View a single contact.
-}
viewContact : Language -> ( ContactId, Contact ) -> Html msg
viewContact language ( contactId, contact ) =
    div [ class "card" ]
        [ showMaybe <|
            Maybe.map
                (\imageUrl ->
                    div [ class "image" ]
                        [ img [ src imageUrl ]
                            []
                        ]
                )
                contact.imageUrl
        , div [ class "content" ]
            [ div [ class "header" ]
                [ text <| contact.name ]
            , div [ class "description" ]
                [ showMaybe <| Maybe.map (\jobTitle -> text jobTitle) contact.jobTitle
                , divider
                , div [ class "ui blue small labels" ]
                    [-- showMaybe <|
                     --     Maybe.map
                     --         (\{ id, name } ->
                     --             a [ class "ui label" ]
                     --                 [ text name ]
                     --         )
                     --         contact.topics
                    ]
                ]
            , sectionDivider
            , div [ class "contact-details center aligned" ]
                [ showMaybe <|
                    Maybe.map
                        (\email ->
                            p [ class "email-wrapper" ]
                                [ i [ class "mail icon" ] []
                                , a [ href ("mailto:" ++ email) ] [ text email ]
                                ]
                        )
                        contact.email
                , showMaybe <|
                    Maybe.map
                        (\phone ->
                            p [ class "phone-wrapper" ]
                                [ i [ class "phone icon" ] []
                                , a [ href ("tel:" ++ phone) ] [ text phone ]
                                ]
                        )
                        contact.phone
                , showMaybe <|
                    Maybe.map
                        (\fax ->
                            p [ class "fax-wrapper" ]
                                [ i [ class "fax icon" ] []
                                , a [ href ("fax:" ++ fax) ] [ text fax ]
                                ]
                        )
                        contact.fax
                , div []
                    [ sectionDivider
                    , showMaybe <|
                        Maybe.map
                            (\address ->
                                p [ class "address-wrapper" ]
                                    [ text address ]
                            )
                            contact.address
                    ]
                , span []
                    [ i [ class "add to calendar icon" ]
                        []
                    , b []
                        [ text "ימים א׳, ב׳, ג׳" ]
                    , b []
                        [ text "שעות 10:00 - 12:00" ]
                    ]
                ]
            , sectionDivider
            ]
        ]
