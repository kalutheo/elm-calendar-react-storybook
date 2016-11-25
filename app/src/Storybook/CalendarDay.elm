port module Storybook.CalendarDay exposing (..)

import Calendar.View exposing (calendarDay, calenderHeader)
import Storybook.Utils exposing (storybookApp)
import Date
import Calendar.Model exposing (..)
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
                        Date.fromString "2011/1/1" |> Result.withDefault (Date.fromTime 0)
                in
                    table []
                        [ tr []
                            [ calendarDay date Dimmed
                            ]
                        ]
        , init = \flags -> ( flags, Cmd.none )
        }
