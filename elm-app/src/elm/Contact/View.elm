module Contact.View exposing (..)

import App.Model exposing (BaseUrl)
import App.Types exposing (Language(..))
import Contact.Model exposing (Contact, ContactId, Model, Msg(..))
import Contact.Utils exposing (filterContacts)
import DictList
import Html exposing (..)
import Html.Attributes exposing (alt, class, href, id, placeholder, src, target, title, type_, value)
import Html.Events exposing (onInput)
import Translate exposing (TranslationId(..), translate)
import Utils.BootstrapGrid exposing (renderBootstrapGrid)
import Utils.Html exposing (colorToString, divider, formatReceptionDays, sectionDivider, showIf, showMaybe)


view : BaseUrl -> Language -> Bool -> Bool -> Model -> Html Msg
view baseUrl language showAsBlock editorPermissions model =
    let
        containerClass =
            if showAsBlock then
                "block-container"
            else
                "container"
    in
    div
        [ class containerClass ]
        [ showIf (not showAsBlock) <| viewContactsHeader language
        , showIf (not showAsBlock) <| viewContactFilter language model.filterString
        , showIf (not showAsBlock) <| div [ class "divider" ] [ text <| translate language MatchingResults ]
        , showIf (not showAsBlock && editorPermissions) <| viewAddnewContact baseUrl language
        , viewContacts baseUrl language showAsBlock model
        , showIf showAsBlock <|
            a
                [ class "btn btn-default btn-show-all", href (baseUrl.path ++ "/contacts?" ++ baseUrl.query) ]
                [ text <| translate language ShowAll ]
        ]


viewContactsHeader : Language -> Html Msg
viewContactsHeader language =
    div [ class "row" ]
        [ div [ class "col-xs-12" ]
            [ h1 [ class "center" ]
                [ text <| translate language ContactsHeaderText ]
            ]
        ]


viewContactFilter : Language -> String -> Html Msg
viewContactFilter language filterString =
    div [ class "row" ]
        [ div [ class "col-sm-4 col-sm-push-4 col-sm-pull-4 col-xs-12" ]
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


viewAddnewContact : BaseUrl -> Language -> Html Msg
viewAddnewContact baseUrl language =
    div [ class "row add-new-contact" ]
        [ div [ class "col-xs-12 align-right" ]
            [ a [ href <| baseUrl.path ++ "/node/add/contact?" ++ baseUrl.query ]
                [ button
                    [ class "btn btn-primary mr-xs mb-sm" ]
                    [ text <| translate language AddNewContactText ]
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
        let
            viewFunction =
                if showAsBlock then
                    viewContactAsBlock
                else
                    viewContact

            contactsHtmlList =
                filteredContacts
                    |> DictList.map
                        (\contactId contact ->
                            viewFunction
                                baseUrl
                                language
                                ( contactId, contact )
                        )
                    |> DictList.values
        in
        if showAsBlock then
            ul [ class "list list-primary list-borders" ]
                contactsHtmlList
        else
            renderBootstrapGrid 3 contactsHtmlList


{-| View a single contact.
-}
viewContact : BaseUrl -> Language -> ( ContactId, Contact ) -> Html msg
viewContact baseUrl language ( contactId, contact ) =
    div
        [ class "thumbnail search-results contact-search-result" ]
        [ showIf contact.edit <|
            a
                [ class "btn btn-xs btn-primary pull-right btn-edit"
                , href (baseUrl.path ++ "/node/" ++ contactId ++ "/edit" ++ "?" ++ baseUrl.query)
                ]
                [ text <| translate language EditLinkText ]
        , showMaybe <|
            Maybe.map
                (\imageUrl ->
                    div [ class "card-img-top center" ]
                        [ img [ class "img-responsive", src imageUrl ]
                            []
                        ]
                )
                contact.imageUrl
        , div
            [ class "caption center" ]
            [ h4
                [ class "card-title" ]
                [ text contact.name ]
            , p []
                [ showMaybe <| Maybe.map text contact.department ]
            , div
                []
                [ showMaybe <| Maybe.map text contact.jobTitle
                , divider
                , showMaybe <|
                    Maybe.map
                        (\topics ->
                            div [ class "labels topic-wrapper" ]
                                (List.map
                                    (\topic ->
                                        a [ href (baseUrl.path ++ "/taxonomy/term/" ++ topic.id ++ "?" ++ baseUrl.query), title topic.name ]
                                            [ button
                                                [ type_ "button"
                                                , class ("btn mr-xs btn-borders btn-sm btn-" ++ colorToString topic.color)
                                                ]
                                                [ text topic.name ]
                                            ]
                                    )
                                    topics
                                )
                        )
                        contact.topics
                , sectionDivider
                , div [ class "contact-details center" ]
                    [ showMaybe <|
                        Maybe.map
                            (\email ->
                                p [ class "email-wrapper" ]
                                    [ i [ class "fa fa-envelope" ] []
                                    , a [ href ("mailto:" ++ email), target "_blank" ] [ text email ]
                                    ]
                            )
                            contact.email
                    , showMaybe <|
                        Maybe.map
                            (\phone ->
                                p [ class "phone-wrapper" ]
                                    [ i [ class "fa fa-phone" ] []
                                    , a [ href ("tel:" ++ phone) ] [ text phone ]
                                    ]
                            )
                            contact.phone
                    , showMaybe <|
                        Maybe.map
                            (\fax ->
                                p [ class "fax-wrapper" ]
                                    [ i [ class "fa fa-fax" ] []
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
                    , p
                        []
                        [ span
                            []
                            [ showMaybe <|
                                Maybe.map
                                    (\receptionTimes ->
                                        div [ class "reception-times-wrapper" ]
                                            [ text <| translate language ReceptionText
                                            , span []
                                                (List.map
                                                    (\{ days, hours, multipleDays } ->
                                                        div [ class "mr-xs" ]
                                                            [ i [ class "fa fa-calendar" ]
                                                                []
                                                            , span
                                                                [ class "reception-days" ]
                                                                [ text <| formatReceptionDays language days multipleDays ]
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
                ]
            ]
        ]


{-| View a single contact that will appear in a block (i.e. with less information).
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
                [ text contact.name ]
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
                                [ span []
                                    (List.map
                                        (\{ days, hours, multipleDays } ->
                                            div [ class "mr-xs" ]
                                                [ i [ class "fa fa-calendar" ]
                                                    []
                                                , span
                                                    [ class "reception-days" ]
                                                    [ text <| formatReceptionDays language days multipleDays ]
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
