module Events.Utils exposing (filterEvents)

import Events.Model exposing (DictListEvent)
import DictList


filterEvents : DictListEvent -> String -> DictListEvent
filterEvents events filterString =
    if String.isEmpty filterString then
        -- No filtering
        events
    else
        let
            stringMatch =
                String.contains (String.toLower filterString)
        in
            DictList.filter
                (\_ event ->
                    stringMatch (String.toLower <| event.name)
                )
                events
