port module Storybook.CalendarDay exposing (..)

import Calendar.View exposing (calendarDay, calenderHeader, stateFromString)
import Storybook.Utils exposing (storybookApp)
import Date
import Calendar.Msg
import Html exposing (table, tr)


-- APP


main : Program String String Calendar.Msg.Msg
main =
    storybookApp
        { view =
            \model ->
                table []
                    [ tr []
                        [ calendarDay (Date.fromTime 0) (stateFromString model)
                        ]
                    ]
        }
