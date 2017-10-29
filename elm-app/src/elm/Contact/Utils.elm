module Contact.Utils exposing (filterContacts)

import Contact.Model exposing (DictListContact)
import DictList


filterContacts : DictListContact -> String -> DictListContact
filterContacts contacts filterString =
    if String.isEmpty filterString then
        -- No filtering
        contacts
    else
        let
            stringMatch =
                String.contains (String.toLower filterString)
        in
        DictList.filter
            (\_ contact ->
                let
                    jobTitle =
                        Maybe.withDefault "" contact.jobTitle

                    department =
                        Maybe.withDefault "" contact.department

                    topics =
                        Maybe.withDefault [] contact.topics
                in
                stringMatch (String.toLower <| contact.name)
                    || stringMatch (String.toLower <| department)
                    || stringMatch (String.toLower <| jobTitle)
                    -- One of the topics' name matches the searched string.
                    || List.foldl (\topic match -> stringMatch (String.toLower <| topic.name)) False topics
            )
            contacts
