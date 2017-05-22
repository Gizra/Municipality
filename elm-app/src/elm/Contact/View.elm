module Contact.View exposing (..)

import App.Types exposing (Language(..))
import Contact.Model exposing (Contact, ContactId, DictListContact, Model, Msg(..))
import Contact.Utils exposing (filterContacts)
import DictList
import Html exposing (..)
import Html.Attributes exposing (alt, class, classList, href, placeholder, src, style, target, type_, value)
import Html.Events exposing (onClick, onInput)
import Translate exposing (TranslationId(..), translate)
import Utils.Html exposing (showIf, showMaybe)


view : Language -> Model -> Html Msg
view language model =
    div []
        [ viewContactFilter language model.filterString
        , div [ class "ui horizontal divider" ]
            [ text "תוצאות מתאימות" ]
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
        [ div [ class "image" ]
            [ img [ src "http://lorempixel.com/output/nightlife-q-c-290-290-1.jpg" ]
                []
            ]
        , div [ class "content" ]
            [ div [ class "header" ]
                [ text <| contact.name ]
            , div [ class "meta" ]
                [ a []
                    [ text "לשכת ראש העירייה" ]
                ]
            , div [ class "description" ]
                [ text "עוזר ראש העיר"
                , h4 [ class "ui horizontal divider" ]
                    []
                , div [ class "ui blue small labels" ]
                    [ a [ class "ui label" ]
                        [ text "מדיניות" ]
                    , a [ class "ui label" ]
                        [ text "תכנון ובניה" ]
                    , a [ class "ui label" ]
                        [ text "עסקים" ]
                    ]
                ]
            , h4 [ class "ui section divider" ]
                []
            , div [ class "contact-details center aligned" ]
                [ span []
                    [ i [ class "mail icon" ] []
                    , showMaybe <| Maybe.map (\email -> a [ href ("mailto:" ++ email) ] [ text email ]) contact.email
                    ]
                , span []
                    [ i [ class "phone icon" ] []
                    , showMaybe <| Maybe.map (\phone -> a [ href ("tel:" ++ phone) ] [ text phone ]) contact.phone
                    ]
                , span []
                    [ h4 [ class "ui horizontal divider" ]
                        []
                    , a [ href "#" ]
                        [ text "בניין העיריה, חדר 421" ]
                    ]
                , br []
                    []
                , span []
                    [ i [ class "add to calendar icon" ]
                        []
                    , b []
                        [ text "ימים א׳, ב׳, ג׳" ]
                    , b []
                        [ text "שעות 10:00 - 12:00" ]
                    ]
                ]
            , h4 [ class "ui horizontal divider" ]
                []
            , div [ class "ui red horizontal label" ]
                [ text "מחוץ למשרד: 3-4/4/17" ]
            ]
        ]
