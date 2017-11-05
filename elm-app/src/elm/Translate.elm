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


type StringIdHttpError
    = ErrorBadUrl
    | ErrorBadPayload String
    | ErrorBadStatus String
    | ErrorNetworkError
    | ErrorTimeout


type TranslationId
    = AddNewContactText
    | AddNewEventText
    | ContactsHeaderText
    | EventsHeaderText
    | ContactsNotFound
    | DayTranslation Day
    | DateLabelTranslation
    | EditLinkText
    | EventRecurringWeekly
    | EventsNotFound
    | FilterContactsPlaceholder
    | FilterEventsPlaceholder
    | HttpError StringIdHttpError
    | LocationText String
    | MatchingResults
    | MoreDetailsText
    | PriceText
    | PriceCurrencyText
    | ReceptionText
    | ShowAll
    | UntilTranslation


translate : Language -> TranslationId -> String
translate lang trans =
    let
        translationSet =
            case trans of
                AddNewContactText ->
                    { arabic = "إضافة جهة اتصال"
                    , english = "Add new contact"
                    , hebrew = "הוספת איש קשר"
                    }

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

                HttpError stringId ->
                    case stringId of
                        ErrorBadUrl ->
                            { english = "URL is not valid.", arabic = "رابط غير صالح.", hebrew = "כתובת שגוייה" }

                        ErrorBadPayload message ->
                            { english = "The server responded with data of an unexpected type: " ++ message, arabic = "استجاب الخادم مع بيانات من نوع غير متوقع: " ++ message, hebrew = "השרת שלח מידע בלתי צפוי: " ++ message }

                        ErrorBadStatus err ->
                            { english = "The server indicated the following error:\n\n" ++ err, arabic = "أشار الخادم إلى الخطأ التالي:\n\n", hebrew = "השרת שלך הודעת שגיאה:\n\n" ++ err }

                        ErrorNetworkError ->
                            { english = "There was a network error.", arabic = "حدث خطأ في الشبكة.", hebrew = "בעיית רשת" }

                        ErrorTimeout ->
                            { english = "The network request timed out.", arabic = "انتهت مهلة طلب الشبكة.", hebrew = "הקריאה לשרת ארכה זמן רב מדי" }

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

                UntilTranslation ->
                    { arabic = "حتى"
                    , english = "To"
                    , hebrew = "עד"
                    }
    in
    case lang of
        Arabic ->
            .arabic translationSet

        English ->
            .english translationSet

        Hebrew ->
            .hebrew translationSet
