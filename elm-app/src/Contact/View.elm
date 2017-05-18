module Contact.View exposing (..)

import App.Types exposing (Language(..))
import Contact.Model exposing (Contact, DictListContact, Model)
import Contact.Utils exposing (getContactNameByLanguage, getContactsByLanguage)
import DictList
import Html exposing (..)
import Html.Attributes exposing (alt, class, classList, href, src, style, target)
import Html.Events exposing (onClick)
import Maybe.Extra exposing (isJust)
import Translate exposing (translate, TranslationId(..))
import Utils.Html exposing (showIf, showMaybe)


view : Language -> Model -> Html msg
view language model =
    div []
        [ text "Contact lists"
        , viewContacts language model.contacts
        ]


{-| View all contacts.
-}
viewContacts : Language -> DictListContact -> Html msg
viewContacts language contacts =
    let
        contactsByLanguage =
            getContactsByLanguage language contacts
    in
        if DictList.isEmpty contactsByLanguage then
            div [] [ text <| translate language ContactsNotFound ]
        else
            div []
                ((getContactsByLanguage language contacts)
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
