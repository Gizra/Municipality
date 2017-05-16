port module App.Update
    exposing
        ( init
        , subscriptions
        , update
        )

import App.Model exposing (..)
import EveryDict exposing (EveryDict)
import List.Extra as List exposing (getAt)
import Magnets.Update
import Mouse exposing (Position)
import People.Utils exposing (getAttributesFromPeople)


init : Flags -> ( Model, Cmd Msg )
init flags =
    -- Populate the Magnets, based on the attributes of the existing people.
    let
        getRandomNumber index =
            Maybe.map identity (getAt index flags.randomNumbers)
                |> Maybe.withDefault 0

        allAttributes =
            getAttributesFromPeople emptyModel.people

        ( magnets, _ ) =
            List.foldl
                (\attribute ( accumDict, index ) ->
                    let
                        -- Fetch three random numbners: For the magnet X and Y
                        -- and its rotation. When index is 0 fetching random
                        -- numbers 0, 1, 2, when it's 1 then fetching 3, 4, 5
                        -- and so on.
                        randomNumber1 =
                            getRandomNumber <| index * 3

                        randomNumber2 =
                            getRandomNumber <| index * 3 + 1

                        randomNumber3 =
                            getRandomNumber <| index * 3 + 2

                        -- Adjusting the random numbers.
                        x =
                            Basics.floor <| toFloat randomNumber1 * 1.19

                        y =
                            Basics.floor <| toFloat randomNumber2 / 6

                        rotation =
                            toFloat randomNumber3 / 50 - 10

                        magent =
                            { selected = False
                            , position = Position x y
                            , drag = Nothing
                            , rotation = rotation
                            }
                    in
                        ( EveryDict.insert attribute magent accumDict
                        , index + 1
                        )
                )
                ( EveryDict.empty, 0 )
                allAttributes
    in
        ( { emptyModel | magnets = magnets }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MsgMagnets subMsg ->
            let
                ( subModel, subCmds, maybeAttribute ) =
                    Magnets.Update.update subMsg model.magnets

                modelUpdated =
                    { model | magnets = subModel }

                modelUpdatedWithAttributeToggle =
                    Maybe.map
                        (\attribute ->
                            update (ToggleAttribute attribute) modelUpdated
                                |> Tuple.first
                        )
                        maybeAttribute
                        |> Maybe.withDefault modelUpdated
            in
                ( modelUpdatedWithAttributeToggle
                , Cmd.map MsgMagnets subCmds
                )

        ToggleAttribute attribute ->
            let
                modelUpdated =
                    Maybe.map
                        (\magnet ->
                            let
                                magnetUpdated =
                                    { magnet | selected = not magnet.selected }

                                magnetsUpdated =
                                    EveryDict.insert attribute magnetUpdated model.magnets
                            in
                                { model | magnets = magnetsUpdated }
                        )
                        (EveryDict.get attribute model.magnets)
                        |> Maybe.withDefault model
            in
                modelUpdated ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.map MsgMagnets <| Magnets.Update.subscriptions model.magnets
