module Contact.View exposing (..)

import App.Types exposing (Language(..))
import Contact.Model exposing (Contact, DictListContact, Model, Msg(..))
import Contact.Utils exposing (getContactNameByLanguage, getContactsByLanguage)
import DictList
import Html exposing (..)
import Html.Attributes exposing (alt, class, classList, href, placeholder, src, style, target, type_, value)
import Html.Events exposing (onClick, onInput)
import Maybe.Extra exposing (isJust)
import Translate exposing (TranslationId(..), translate)
import Utils.Html exposing (showIf, showMaybe)


view : Language -> Model -> Html Msg
view language model =
    div []
        [ viewContactFilter language model.filter
        , viewContacts language model
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
viewContacts language { contacts, filter } =
    let
        contactsByLanguage =
            getContactsByLanguage language contacts

        filteredContacts =
            if String.isEmpty filter then
                -- No filtering
                contactsByLanguage
            else
                let
                    stringMatch =
                        String.contains (String.toLower filter)
                in
                    DictList.filter
                        (\_ contact ->
                            stringMatch (String.toLower <| getContactNameByLanguage language contact)
                        )
                        contactsByLanguage
    in
        if DictList.isEmpty filteredContacts then
            div [] [ text <| translate language ContactsNotFound ]
        else
            div []
                (filteredContacts
                    |> DictList.map
                        (\_ contact ->
                            viewContact language contact
                        )
                    |> DictList.values
                )


{-| View a single contact.
-}
viewContact : Language -> Contact -> Html msg
viewContact language contact =
    ul
        []
        [ li [] [ text <| getContactNameByLanguage language contact ]
        , showMaybe <| Maybe.map (\phone -> li [] [ text phone ]) contact.phone
        ]
