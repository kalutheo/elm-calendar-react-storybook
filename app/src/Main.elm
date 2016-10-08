module Main exposing (..)

import MediaPlayer.Model exposing (..)
import MediaPlayer.View exposing (..)
import MediaPlayer.Update exposing (..)
import Html.App as App


main : Program Never
main =
    App.beginnerProgram
        { model = model
        , view = calendarView
        , update = update
        }
