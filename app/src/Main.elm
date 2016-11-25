module Main exposing (..)

import Calendar.Model exposing (..)
import Calendar.View exposing (..)
import Calendar.Update exposing (..)
import Calendar.Msg exposing (Msg)
import Html as App


main : Program Never Model Msg
main =
    App.beginnerProgram
        { model = model
        , view = calendarView
        , update = update
        }
