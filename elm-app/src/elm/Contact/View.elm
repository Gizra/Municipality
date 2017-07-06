module Contact.View exposing (..)

import App.Model exposing (BaseUrl)
import App.Types exposing (Language(..))
import Contact.Model exposing (Contact, ContactId, DictListContact, Model, Msg(..))
import Contact.Utils exposing (filterContacts)
import Date exposing (dayOfWeek)
import Debug exposing (log)
import DictList
import Html exposing (..)
import Html.Attributes exposing (alt, class, classList, href, id, placeholder, src, style, target, type_, value)
import Html.Events exposing (onClick, onInput)
import Json.Encode exposing (string)
import Translate exposing (TranslationId(..), translate)
import Utils.Html exposing (colorToString, divider, sectionDivider, showIf, showMaybe, formatReceptionDays)


view : BaseUrl -> Language -> Bool -> Model -> Html Msg
view baseUrl language showAsBlock model =
    div
        []
        [ showIf (not showAsBlock) <| viewContactFilter language model.filterString
        , showIf (not showAsBlock) <| div [ class "divider" ] [ text <| translate language MatchingResults ]
        , viewContacts baseUrl language showAsBlock model
        , showIf showAsBlock <| a [ class "btn btn-default btn-show-all", href (baseUrl.path ++ "/contacts?" ++ baseUrl.query) ] [ text <| translate language ShowAll ]
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
viewContacts : BaseUrl -> Language -> Bool -> Model -> Html msg
viewContacts baseUrl language showAsBlock { contacts, filterString } =
    let
        filteredContacts =
            filterContacts contacts filterString
    in
        if DictList.isEmpty filteredContacts then
            div [] [ text <| translate language ContactsNotFound ]
        else
            ul
                [ class "list list-primary list-borders" ]
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


{-| View a single contact.
-}
viewContact : BaseUrl -> Language -> ( ContactId, Contact ) -> Html msg
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
                                            [ href (baseUrl.path ++ "/taxonomy/term/" ++ topic.id ++ "?" ++ baseUrl.query)
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
                                                            [ text <| translate language (DayTranslation day) ]
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
viewContactAsBlock : BaseUrl -> Language -> ( ContactId, Contact ) -> Html msg
viewContactAsBlock baseUrl language ( contactId, contact ) =
    li
        [ class "post-author clearfix" ]
        [ showMaybe <|
            Maybe.map
                (\imageUrl ->
                    div
                        [ class "img-thumbnail" ]
                        [ a
                            [ href (baseUrl.path ++ "/node/" ++ contactId ++ "?" ++ baseUrl.query) ]
                            [ img
                                [ src imageUrl, alt "" ]
                                []
                            ]
                        ]
                )
                contact.imageUrl
        , p
            []
            [ strong
                [ class "name" ]
                [ a
                    [ href (baseUrl.path ++ "/node/" ++ contactId ++ "?" ++ baseUrl.query) ]
                    [ text contact.name ]
                ]
            ]
        , p []
            [ div
                []
                [ showMaybe <|
                    Maybe.map
                        (\email ->
                            p
                                [ class "email-wrapper" ]
                                [ i
                                    [ class "fa fa-envelope" ]
                                    []
                                , a [ href ("mailto:" ++ email), target "_blank" ]
                                    [ text email ]
                                ]
                        )
                        contact.email
                , showMaybe <|
                    Maybe.map
                        (\phone ->
                            p
                                [ class "phone-wrapper" ]
                                [ i
                                    [ class "fa fa-phone" ]
                                    []
                                , a [ href ("tel:" ++ phone), target "_blank" ]
                                    [ text phone ]
                                ]
                        )
                        contact.phone
                , showMaybe <|
                    Maybe.map
                        (\fax ->
                            p
                                []
                                [ i
                                    [ class "fa fa-fax" ]
                                    []
                                , text fax
                                ]
                        )
                        contact.fax
                ]
            ]
        , p
            []
            [ span
                []
                [ showMaybe <|
                    Maybe.map
                        (\receptionTimes ->
                            div [ class "reception-times-wrapper" ]
                                [ i [ class "fa fa-calendar" ]
                                    []
                                , span []
                                    (List.map
                                        (\{ days, hours, daysDelimiter } ->
                                            span [ class "mr-xs" ]
                                                [ span
                                                    [ class "reception-days" ]
                                                    [ text <| formatReceptionDays language days daysDelimiter ]
                                                , span [ class "reception-hours" ]
                                                    [ text hours ]
                                                ]
                                        )
                                        receptionTimes
                                    )
                                ]
                        )
                        contact.receptionTimes
                ]
            ]
        ]
