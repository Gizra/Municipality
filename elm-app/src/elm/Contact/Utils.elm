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
                    stringMatch (String.toLower <| contact.name)
                )
                contacts
