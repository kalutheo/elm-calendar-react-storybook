module MediaPlayer.Model exposing (..)

import Date exposing (Date)
import MediaPlayer.Utils exposing (monthDates)


type alias Model =
    { selectedMonthIndex : Int
    , selectedDay : Maybe Date
    , hoveredDay : Maybe Date
    , currentDates : List Date
    }


type DayState
    = Normal
    | Dimmed
    | Disabled
    | Selected
    | Hovered


model : Model
model =
    { selectedMonthIndex = 9
    , selectedDay = Nothing
    , hoveredDay = Nothing
    , currentDates = monthDates 2016 (Date.Oct)
    }
