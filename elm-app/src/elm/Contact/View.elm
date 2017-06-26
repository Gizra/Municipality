module Contact.View exposing (..)

import App.Types exposing (Language(..))
import Contact.Model exposing (Contact, ContactId, DictListContact, Model, Msg(..))
import Contact.Utils exposing (filterContacts)
import Date exposing (dayOfWeek)
import Debug exposing (log)
import DictList
import Html exposing (..)
import Html.Attributes exposing (alt, id, class, classList, href, placeholder, src, style, target, type_, value)
import Html.Events exposing (onClick, onInput)
import Json.Encode exposing (string)
import Translate exposing (TranslationId(..), translate)
import Utils.Html exposing (colorToString, divider, sectionDivider, showIf, showMaybe)


view : String -> Language -> Bool -> Model -> Html Msg
view baseUrl language showAsBlock model =
    div
        []
        [ showIf (not showAsBlock) <| viewContactFilter language model.filterString
        , showIf (not showAsBlock) <| div [ class "divider" ] [ text <| translate language MatchingResults ]
        , div [ class "ui container center aligned" ]
            [ viewContacts baseUrl language showAsBlock model ]
        , showIf showAsBlock <| a [ class "btn btn-default btn-show-all", href (baseUrl ++ "/contacts") ] [ text <| translate language ShowAll ]
        ]


viewContactFilter : Language -> String -> Html Msg
viewContactFilter language filterString =
    div [ class "row" ]
        [ div [ class "col-md-4 col-xs-12" ]
            [ div [ class "input-group" ]
                [ input
                    [ value filterString
                    , id "search-contacts"
                    , class "form-control"
                    , type_ "search"
                    , placeholder <| translate language FilterContactsPlaceholder
                    , onInput SetFilter
                    ]
                    []
                , span
                    [ class "input-group-btn" ]
                    [ button
                        [ class "btn btn-default" ]
                        [ i
                            [ class "fa fa-search" ]
                            []
                        ]
                    ]
                ]
            ]
        ]


{-| View all contacts.
-}
viewContacts : String -> Language -> Bool -> Model -> Html msg
viewContacts baseUrl language showAsBlock { contacts, filterString } =
    let
        filteredContacts =
            filterContacts contacts filterString
    in
        if DictList.isEmpty filteredContacts then
            div [] [ text <| translate language ContactsNotFound ]
        else
            div
                [ class "sort-destination-loader sort-destination-loader-loaded" ]
                [ ul
                    [ class "team-list sort-destination" ]
                    (filteredContacts
                        |> DictList.map
                            (\contactId contact ->
                                if showAsBlock then
                                    viewContactAsBlock baseUrl language ( contactId, contact )
                                else
                                    viewContact baseUrl language ( contactId, contact )
                            )
                        |> DictList.values
                    )
                ]


{-| View a single contact.
-}
viewContact : String -> Language -> ( ContactId, Contact ) -> Html msg
viewContact baseUrl language ( contactId, contact ) =
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
                                            [ href (baseUrl ++ "/taxonomy/term/" ++ topic.id)
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


{-| View a single event that will appear in a block (i.e. with less information).
-}
viewContactAsBlock : String -> Language -> ( ContactId, Contact ) -> Html msg
viewContactAsBlock baseUrl language ( contactId, contact ) =
    li [ class "col-md-3 col-sm-6 col-xs-12 isotope-item leadership" ]
        [ span
            [ class "thumb-info thumb-info-hide-wrapper-bg mb-xlg" ]
            [ span
                [ class "thumb-info-wrapper" ]
                [ a
                    [ href (baseUrl ++ "/node/" ++ contactId) ]
                    [ showMaybe <|
                        Maybe.map
                            (\imageUrl ->
                                div [ class "img-responsive" ]
                                    [ img [ src imageUrl ]
                                        []
                                    ]
                            )
                            contact.imageUrl
                    , span
                        [ class "thumb-info-title" ]
                        [ span
                            [ class "thumb-info-inner" ]
                            [ text contact.name ]
                        , showMaybe <|
                            Maybe.map
                                (\jobTitle ->
                                    span
                                        [ class "thumb-info-type" ]
                                        [ text jobTitle ]
                                )
                                contact.jobTitle
                        ]
                    ]
                ]
            , span
                [ class "thumb-info-caption" ]
                [ span
                    [ class "thumb-info-caption-text" ]
                    [ showMaybe <|
                        Maybe.map
                            (\receptionTimes ->
                                div [ class "reception-times-wrapper" ]
                                    (List.map
                                        (\{ days, hours } ->
                                            div []
                                                [ i [ class "fa fa-calendar" ]
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
                , span
                    [ class "thumb-info-social-icons" ]
                    [ showMaybe <|
                        Maybe.map
                            (\email ->
                                a [ href ("mailto:" ++ email), target "_blank" ]
                                    [ i [ class "fa fa-envelope" ] []
                                    , span [] [ text email ]
                                    ]
                            )
                            contact.email
                    , showMaybe <|
                        Maybe.map
                            (\phone ->
                                a [ href ("tel:" ++ phone), target "_blank" ]
                                    [ i [ class "fa fa-phone" ] []
                                    , span [] [ text phone ]
                                    ]
                            )
                            contact.phone
                    , showMaybe <|
                        Maybe.map
                            (\fax ->
                                a [ href ("tel:" ++ fax), target "_blank" ]
                                    [ i [ class "fa fa-fax" ] []
                                    , span [] [ text fax ]
                                    ]
                            )
                            contact.fax
                    ]
                ]
            ]
        ]
