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
    = AddNewEventText
    | ContactsHeaderText
    | EventsHeaderText
    | ContactsNotFound
    | DayTranslation Day
    | DayAndDate Date (Maybe Date)
    | DateLabelTranslation
    | EditLinkText
    | EventRecurringWeekly
    | EventsNotFound
    | FilterContactsPlaceholder
    | FilterEventsPlaceholder
    | LocationText String
    | MatchingResults
    | MoreDetailsText
    | PriceText
    | PriceCurrencyText
    | ReceptionText
    | ShowAll


translate : Language -> TranslationId -> String
translate lang trans =
    let
        translationSet =
            case trans of
                AddNewEventText ->
                    { arabic = "إضافة حدث جديد"
                    , english = "Add new event"
                    , hebrew = "הוספת אירוע חדש"
                    }

                ContactsHeaderText ->
                    { arabic = "اتصالات وموظفي الشبكة"
                    , english = "Contacts and network employees"
                    , hebrew = "אנשי קשר ועובדי רשת"
                    }

                EventsHeaderText ->
                    { arabic = "الفعاليات"
                    , english = "Events"
                    , hebrew = "אירועים"
                    }

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

                        compareFormater =
                            format "%d/%m/%Y"

                        dateFormated =
                            formater date

                        timeFormater =
                            format "%H:%M"

                        allDatesFormated =
                            Maybe.map
                                (\endDate ->
                                    if compareFormater date == compareFormater endDate then
                                        dateFormated ++ " - " ++ timeFormater endDate
                                    else
                                        dateFormated ++ " - " ++ formater endDate
                                )
                                mEndDate
                                |> Maybe.withDefault dateFormated
                    in
                    { arabic = allDatesFormated ++ ", " ++ dayTranslated
                    , english = dayTranslated ++ ", " ++ allDatesFormated
                    , hebrew = allDatesFormated ++ ", " ++ dayTranslated
                    }

                DateLabelTranslation ->
                    { arabic = "متى"
                    , english = "When"
                    , hebrew = "מתי"
                    }

                EditLinkText ->
                    { arabic = "تحرير"
                    , english = "Edit"
                    , hebrew = "עריכה"
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

                LocationText locationTitle ->
                    { arabic = "أين: " ++ locationTitle
                    , english = "Where: " ++ locationTitle
                    , hebrew = "איפה: " ++ locationTitle
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

                PriceCurrencyText ->
                    { arabic = "شيكل"
                    , english = "NIS"
                    , hebrew = "ש״ח"
                    }

                ReceptionText ->
                    { arabic = "استقبال: "
                    , english = "Reception: "
                    , hebrew = "קבלת קהל: "
                    }

                ShowAll ->
                    { arabic = "عرض الكل"
                    , english = "Show all"
                    , hebrew = "הצג הכל"
                    }
    in
    case lang of
        Arabic ->
            .arabic translationSet

        English ->
            .english translationSet

        Hebrew ->
            .hebrew translationSet
