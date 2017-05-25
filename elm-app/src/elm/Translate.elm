module Translate exposing (..)

import App.Types exposing (Language(..))


type alias TranslationSet =
    { arabic : String
    , english : String
    , hebrew : String
    }


type TranslationId
    = ContactsNotFound
    | FilterContactsPlaceholder
    | MatchingResults


translate : Language -> TranslationId -> String
translate lang trans =
    let
        translationSet =
            case trans of
                ContactsNotFound ->
                    { arabic = "No contacts found"
                    , english = "No contacts found"
                    , hebrew = "לא נמצאו אנשי קשר מתאימים"
                    }

                FilterContactsPlaceholder ->
                    { arabic = "ابحث عن اسم، موضوع أو فئة"
                    , english = "Filter contacts"
                    , hebrew = "חפשו שם, נושא או מחלקה"
                    }

                MatchingResults ->
                    { arabic = "نتائج البحث"
                    , english = "Matching Results"
                    , hebrew = "תוצאות מתאימות"
                    }
    in
        case lang of
            Arabic ->
                .arabic translationSet

            English ->
                .english translationSet

            Hebrew ->
                .hebrew translationSet
