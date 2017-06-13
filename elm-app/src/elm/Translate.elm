module Translate exposing (..)

import App.Types exposing (Language(..))
import Date exposing (Date, Day(..), dayOfWeek)
import Date.Format exposing (format)
import Json.Decode exposing (null)


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
                    , hebrew = "לא נמצאו אנשי קשר מתאימים"
                    }

                DayTranslation day ->
                    case day of
                        Mon ->
                            { arabic = "الإثنين"
                            , english = "Mon"
                            , hebrew = "שני"
                            }

                        Tue ->
                            { arabic = "الثلاثاء"
                            , english = "Tue"
                            , hebrew = "שלישי"
                            }

                        Wed ->
                            { arabic = "الأربعاء"
                            , english = "Wed"
                            , hebrew = "רביעי"
                            }

                        Thu ->
                            { arabic = "الخميس"
                            , english = "Thu"
                            , hebrew = "חמישי"
                            }

                        Fri ->
                            { arabic = "الجمعة"
                            , english = "Fri"
                            , hebrew = "שישי"
                            }

                        Sat ->
                            { arabic = "السبت"
                            , english = "Sat"
                            , hebrew = "שבת"
                            }

                        Sun ->
                            { arabic = "الأحد"
                            , english = "Sun"
                            , hebrew = "ראשון"
                            }

                DayAndDate date mEndDate ->
                    let
                        dayTranslated =
                            translate lang <| DayTranslation (dayOfWeek date)

                        formater =
                            format "%d/%m/%Y %H:%M"

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
                    { arabic = "حدث اسبوعي"
                    , english = "Weekly event"
                    , hebrew = "אירוע שבועי"
                    }

                EventsNotFound ->
                    { arabic = "لم يتم العثور على أية أحداث"
                    , english = "No events found"
                    , hebrew = "לא נמצאו אירועים מתאימים"
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
                    { arabic = "لمزيد من التفاصيل"
                    , english = "For more details"
                    , hebrew = "לפרטים נוספים"
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
