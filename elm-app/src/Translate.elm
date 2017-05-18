module Translate exposing (..)

import App.Types exposing (Language(..))


type alias TranslationSet =
    { arabic : String
    , english : String
    , hebrew : String
    }


type TranslationId
    = FilterContacts


translate : Language -> TranslationId -> String
translate lang trans =
    let
        translationSet =
            case trans of
                FilterContacts ->
                    { arabic = "ابحث عن اسم، موضوع أو فئة"
                    , english = "Filter contacts"
                    , hebrew = "חפשו שם, נושא או מחלקה"
                    }
    in
        case lang of
            Arabic ->
                .arabic translationSet

            English ->
                .english translationSet

            Hebrew ->
                .hebrew translationSet
