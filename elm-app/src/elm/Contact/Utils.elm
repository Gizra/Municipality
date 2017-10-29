module Contact.Utils exposing (filterContacts)

import Contact.Model exposing (DictListContact)
import DictList
import Maybe.Extra exposing (unwrap)


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
                    maybeStrings =
                        [ Just contact.name
                        , contact.jobTitle
                        , contact.department
                        ]

                    topics =
                        Maybe.withDefault [] contact.topics
                in
                List.foldl
                    (\maybeString accum ->
                        unwrap accum
                            (\string ->
                                if accum then
                                    accum
                                else
                                    stringMatch (String.toLower string)
                            )
                            maybeString
                    )
                    False
                    maybeStrings
                    -- One of the topics' name matches the searched string.
                    || List.foldl
                        (\topic match -> stringMatch (String.toLower <| topic.name))
                        False
                        topics
            )
            contacts
