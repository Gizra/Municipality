module Events.Utils exposing (filterEvents)

import DictList
import Events.Model exposing (DictListEvent)
import Maybe.Extra exposing (unwrap)


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
                    maybeStrings =
                        [ Just event.name
                        , event.description
                        , Maybe.map (\location -> location.title) event.location
                        ]
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
            )
            events
