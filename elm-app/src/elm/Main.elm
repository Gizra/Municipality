module Main exposing (..)

import App.Update
import App.View
import Html exposing (Html)


main =
    Html.programWithFlags
        { init = App.Update.init
        , update = App.Update.update
        , view = App.View.view
        , subscriptions = App.Update.subscriptions
        }
