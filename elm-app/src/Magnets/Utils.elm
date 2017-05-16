module Magnets.Utils exposing (getSelectedAttributesFromMagnets)

import Attribute.Model exposing (Attribute)
import EveryDict exposing (EveryDict)
import Magnets.Model exposing (Magnets)


getSelectedAttributesFromMagnets : Magnets -> List Attribute
getSelectedAttributesFromMagnets magnets =
    EveryDict.foldl
        (\attribute magnet accum ->
            if magnet.selected then
                attribute :: accum
            else
                accum
        )
        []
        magnets
