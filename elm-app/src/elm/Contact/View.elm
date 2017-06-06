module Contact.View exposing (..)

import App.Types exposing (Language(..))
import Contact.Model exposing (Contact, ContactId, DictListContact, Model, Msg(..))
import Contact.Utils exposing (filterContacts)
import Date exposing (dayOfWeek)
import Debug exposing (log)
import DictList
import Html exposing (..)
import Html.Attributes exposing (alt, class, classList, href, placeholder, src, style, target, type_, value)
import Html.Events exposing (onClick, onInput)
import Json.Encode exposing (string)
import Translate exposing (TranslationId(..), translate)
import Utils.Html exposing (colorToString, divider, sectionDivider, showIf, showMaybe)


view : Language -> Model -> Html Msg
view language model =
    div
        []
        [ viewContactFilter language model.filterString
        , div [ class "ui horizontal divider" ]
            [ text <| translate language MatchingResults ]
        , div [ class "ui container center aligned" ]
            [ viewContacts language model ]
        , divider
        ]


viewContactFilter : Language -> String -> Html Msg
viewContactFilter language filterString =
    div [ class "ui icon input" ]
        [ input
            [ value filterString
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
                [ h3 [] [ text <| contact.name ] ]
            , div [ class "description" ]
                [ showMaybe <| Maybe.map text contact.jobTitle
                , divider
                , showMaybe <|
                    Maybe.map
                        (\topics ->
                            div [ class "ui small labels topic-wrapper" ]
                                (List.map
                                    (\topic ->
                                        a
                                            [ href ("taxonomy/term/" ++ topic.id)
                                            , class ("ui label " ++ colorToString topic.color)
                                            ]
                                            [ text topic.name ]
                                    )
                                    topics
                                )
                        )
                        contact.topics
                ]
            , sectionDivider
            , div [ class "contact-details center aligned" ]
                [ showMaybe <|
                    Maybe.map
                        (\email ->
                            p [ class "email-wrapper" ]
                                [ i [ class "mail icon" ] []
                                , a [ href ("mailto:" ++ email), target "_blank" ] [ text email ]
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
                                , span [] [ text fax ]
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
                , showMaybe <|
                    Maybe.map
                        (\receptionTimes ->
                            div [ class "reception-times-wrapper" ]
                                (List.map
                                    (\{ days, hours } ->
                                        div []
                                            [ i [ class "add to calendar icon" ]
                                                []
                                            , span
                                                [ class "reception-days" ]
                                                (List.map
                                                    (\day ->
                                                        span []
                                                            [ text <| translate language (DayTranslation day) ++ ", " ]
                                                    )
                                                    days
                                                )
                                            , span [ class "reception-hours" ]
                                                [ text hours ]
                                            ]
                                    )
                                    receptionTimes
                                )
                        )
                        contact.receptionTimes
                ]
            , sectionDivider
            ]
        ]
