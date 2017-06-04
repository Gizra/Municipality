module Translate exposing (..)

import App.Types exposing (Language(..))
import Date exposing (Day(..), Date)


type alias TranslationSet =
    { arabic : String
    , english : String
    , hebrew : String
    }


type TranslationId
    = ContactsNotFound
    | DayAndDate Date (Maybe Date)
    | EventsNotFound
    | FilterContactsPlaceholder
    | FilterEventsPlaceholder
    | MatchingResults
    | MoreDetailsText
    | PriceText


translate : Language -> TranslationId -> String
translate lang trans =
    let
        translationSet =
            case trans of
                ContactsNotFound ->
                    { arabic = "لم يتم العثور على جهات اتصال"
                    , english = "No contacts found"
                    , hebrew = "לא נמצאו אירועים מתאימים"
                    }

                DayAndDate date mEndDate ->
                    let
                        dayFromDate =
                            getDayFromDate lang date
                    in
                        { arabic = ""
                        , english = ""
                        , hebrew = ""
                        }

                EventsNotFound ->
                    { arabic = "لم يتم العثور على أية أحداث"
                    , english = "No events found"
                    , hebrew = "לא נמצאו אנשי קשר מתאימים"
                    }

                FilterContactsPlaceholder ->
                    { arabic = "ابحث عن اسم، موضوع أو فئة"
                    , english = "Filter contacts"
                    , hebrew = "חפשו שם, נושא או מחלקה"
                    }

                FilterEventsPlaceholder ->
                    { arabic = "ابحث عن الأحداث في ذوقك"
                    , english = "Look for events to your liking"
                    , hebrew = "חפשו אירועים לטעמכם"
                    }

                MatchingResults ->
                    { arabic = "نتائج البحث"
                    , english = "Matching Results"
                    , hebrew = "תוצאות מתאימות"
                    }

                MoreDetailsText ->
                    { arabic = ""
                    , english = ""
                    , hebrew = ""
                    }

                PriceText ->
                    { arabic = "السعر"
                    , english = "Price"
                    , hebrew = "מחיר"
                    }
    in
        case lang of
            Arabic ->
                .arabic translationSet

            English ->
                .english translationSet

            Hebrew ->
                .hebrew translationSet


getDayFromDate : Language -> Date -> String
getDayFromDate lang date =
    ""
