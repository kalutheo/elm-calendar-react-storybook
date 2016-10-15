module Main exposing (..)

import Calendar.Model exposing (..)
import Calendar.View exposing (..)
import Calendar.Update exposing (..)
import Html.App as App


main : Program Never
main =
    App.beginnerProgram
        { model = model
        , view = calendarView
        , update = update
        }
