module Events.Utils exposing (filterEvents)

import DictList
import Events.Model exposing (DictListEvent)


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
                let
                    description =
                        Maybe.withDefault "" event.description

                    locationTitle =
                        Maybe.map (\location -> location.title) event.location
                            |> Maybe.withDefault ""
                in
                stringMatch (String.toLower <| event.name)
                    || stringMatch (String.toLower <| description)
                    || stringMatch (String.toLower <| locationTitle)
            )
            events
