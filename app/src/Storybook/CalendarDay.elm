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
                let
                    date =
                        Date.fromString "2011/3/3" |> Result.withDefault (Date.fromTime 0)
                in
                    table []
                        [ tr []
                            [ calendarDay date (stateFromString model)
                            ]
                        ]
        , init = \flags -> ( flags, Cmd.none )
        }
