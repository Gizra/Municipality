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
viewContacts language { contacts, filterString } =
    let
        filteredContacts =
            filterContacts contacts filterString
    in
        if DictList.isEmpty filteredContacts then
            div [] [ text <| translate language ContactsNotFound ]
        else
            div []
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
    ul
        []
        [ li [] [ text <| contact.name ]
        , showMaybe <| Maybe.map (\phone -> li [] [ text phone ]) contact.phone
        ]
