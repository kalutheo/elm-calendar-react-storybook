port module Storybook.CalendarHeader exposing (..)

import Calendar.View exposing (calenderHeader)
import Storybook.Utils exposing (storybookApp)
import Calendar.Msg exposing (Msg)


-- APP


main : Program String String Msg
main =
    storybookApp
        { view = calenderHeader
        }
