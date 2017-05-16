module People.Utils
    exposing
        ( getAttributesFromPeople
        )

import Attribute.Model exposing (Attribute(..))
import DictList
import List.Extra exposing (unique)
import People.Model exposing (People)


{-| We return a list of `String`s instead of a single `String`, since some
values can be multiple. For example the `Food` attributes can have multiple
values.
-}
getAttributesFromPeople : People -> List Attribute
getAttributesFromPeople people =
    DictList.foldl
        (\_ person accum ->
            List.foldl
                (\val uniqueAccum ->
                    -- Make list unique.
                    if List.member val uniqueAccum then
                        uniqueAccum
                    else
                        val :: uniqueAccum
                )
                []
                (List.append person.attributes accum)
        )
        []
        people
