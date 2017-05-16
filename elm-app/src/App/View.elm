module App.View exposing (..)

import App.Model exposing (..)
import App.Update exposing (..)
import Attribute.View exposing (viewEmptyResult)
import DictList
import Html exposing (..)
import Html.Attributes exposing (alt, class, classList, href, src, style, target)
import Html.Events exposing (onClick)
import Magnets.Utils exposing (getSelectedAttributesFromMagnets)
import Magnets.View
import People.Utils exposing (getAttributesFromPeople)
import People.View exposing (viewPerson)


view : Model -> Html Msg
view model =
    let
        selectedAttributes =
            getSelectedAttributesFromMagnets model.magnets

        filteredPeople =
            if List.isEmpty selectedAttributes then
                model.people
            else
                DictList.filter
                    (\_ person ->
                        -- Check if person has all selected attributes.
                        List.foldl
                            (\selectedAttribute accum ->
                                if accum then
                                    List.member selectedAttribute person.attributes
                                    -- We already found a non matching attribute.
                                else
                                    False
                            )
                            True
                            selectedAttributes
                    )
                    model.people

        -- Get the attributes from all the people, regardless of the filtered
        -- ones.
        allAttributes =
            getAttributesFromPeople model.people

        peopleOrEmptyResult =
            if DictList.isEmpty filteredPeople then
                viewEmptyResult selectedAttributes
            else
                div [ class "ui three stackable cards" ]
                    (List.map
                        (\( githubName, person ) ->
                            viewPerson person
                        )
                        (DictList.toList filteredPeople)
                    )
    in
        div []
            [ peopleOrEmptyResult
            , Html.map MsgMagnets <| Magnets.View.view model.magnets
            ]
