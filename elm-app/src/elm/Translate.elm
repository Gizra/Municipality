module Translate exposing (..)

import App.Types exposing (Language(..))
import Date exposing (Date, Day(..), dayOfWeek)
import Date.Format exposing (format)


type alias TranslationSet =
    { arabic : String
    , english : String
    , hebrew : String
    }


type TranslationId
    = ContactsNotFound
    | DayTranslation Day
    | DayAndDate Date (Maybe Date)
    | EventRecurringWeekly
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

                DayTranslation day ->
                    case day of
                        Mon ->
                            { arabic = "Mon"
                            , english = "Mon"
                            , hebrew = "Mon"
                            }

                        Tue ->
                            { arabic = "Tue"
                            , english = "Tue"
                            , hebrew = "Tue"
                            }

                        Wed ->
                            { arabic = "Wed"
                            , english = "Wed"
                            , hebrew = "רביעי"
                            }

                        Thu ->
                            { arabic = "Thu"
                            , english = "Thu"
                            , hebrew = "Thu"
                            }

                        Fri ->
                            { arabic = "Fri"
                            , english = "Fri"
                            , hebrew = "Fri"
                            }

                        Sat ->
                            { arabic = "Sat"
                            , english = "Sat"
                            , hebrew = "Sat"
                            }

                        Sun ->
                            { arabic = "Sun"
                            , english = "Sun"
                            , hebrew = "Sun"
                            }

                DayAndDate date mEndDate ->
                    let
                        dayTranslated =
                            translate lang <| DayTranslation (dayOfWeek date)

                        formater =
                            format "%d/%m/%Y"

                        dateFormated =
                            formater date

                        allDatesFormated =
                            Maybe.map
                                (\endDate ->
                                    dateFormated ++ " - " ++ (formater endDate)
                                )
                                mEndDate
                                |> Maybe.withDefault dateFormated
                    in
                        { arabic = allDatesFormated ++ " ," ++ dayTranslated
                        , english = dayTranslated ++ ", " ++ allDatesFormated
                        , hebrew = allDatesFormated ++ " ," ++ dayTranslated
                        }

                EventRecurringWeekly ->
                    { arabic = "EventRecurringWeekly"
                    , english = "EventRecurringWeekly"
                    , hebrew = "EventRecurringWeekly"
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
