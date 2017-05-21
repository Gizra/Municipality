module Contact.Utils
    exposing
        ( getContactsByLanguage
        , getContactNameByLanguage
        )

import App.Types exposing (Language(..))
import Contact.Model exposing (Contact, DictListContact, Model)
import DictList
import Maybe.Extra exposing (isJust)


{-| Determine if we have the name of the contact in the given language.
-}
getContactsByLanguage : Language -> DictListContact -> DictListContact
getContactsByLanguage language contacts =
    DictList.filter
        (\_ contact ->
            let
                property =
                    case language of
                        Arabic ->
                            .arabic

                        Hebrew ->
                            .hebrew

                        English ->
                            .english
            in
                isJust <| property contact.names
        )
        contacts


{-| Get the name by language. In case language doesn't exist, we show an emoty
string, but that should never be the case.
-}
getContactNameByLanguage : Language -> Contact -> String
getContactNameByLanguage language contact =
    let
        property =
            case language of
                Arabic ->
                    .arabic

                Hebrew ->
                    .hebrew

                English ->
                    .english
    in
        Maybe.withDefault "" (property contact.names)
