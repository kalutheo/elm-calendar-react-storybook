module Model exposing (..)

import Date exposing (Date)
import Utils exposing (monthDates)


type alias Model =
    { selectedMonthIndex : Int
    , selectedDay : Int
    , currentDates : List Date
    }


type DayState
    = Normal
    | Dimmed
    | Disabled
    | Selected


model : Model
model =
    { selectedMonthIndex = 9
    , selectedDay = 18
    , currentDates = monthDates 2016 (Date.Oct)
    }
