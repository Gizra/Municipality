module People.View exposing (viewPerson)

import Html exposing (..)
import Html.Attributes exposing (alt, class, classList, href, src, style, target)
import Html.Events exposing (onClick)
import People.Model exposing (Person, SocialNetwork(..))


viewPerson : Person -> Html msg
viewPerson person =
    div [ class "card" ]
        [ div
            [ class "image" ]
            [ img
                [ src <| "/assets/images/team/members/" ++ person.image
                , alt <| person.name ++ " - " ++ person.title
                ]
                []
            ]
        , div
            [ class "content" ]
            [ div [ class "header" ] [ text person.name ]
            , div [ class "meta" ] [ text person.title ]
            , viewSocailNetowrks person
            ]
        ]


viewSocailNetowrks : Person -> Html msg
viewSocailNetowrks person =
    let
        viewSocialNetwork : SocialNetwork -> ( String, String )
        viewSocialNetwork socialNetwork =
            case socialNetwork of
                Drupal name ->
                    ( "drupal", "https://www.drupal.org/u/" ++ name )

                Email name ->
                    ( "mail", "mailto:" ++ name )

                Github name ->
                    ( "github", "https://github.com/" ++ name )

                Twitter name ->
                    ( "twitter", "https://twitter.com/" ++ name )
    in
        div [ class "description" ]
            (List.map
                (\socialNetwork ->
                    let
                        ( icon, url ) =
                            viewSocialNetwork socialNetwork
                    in
                        a
                            [ href url
                            , target "_blank"
                            ]
                            [ i [ class <| icon ++ " icon" ] [] ]
                )
                person.socialNetworks
            )
