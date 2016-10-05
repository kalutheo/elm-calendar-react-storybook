module Main exposing (..)

import Model exposing (..)
import View exposing (..)
import Update exposing (..)
import Html.App as App


main : Program Never
main =
    App.beginnerProgram
        { model = model
        , view = calendarView
        , update = update
        }
