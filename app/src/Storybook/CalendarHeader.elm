port module Storybook.CalenderHeader exposing (..)

import Calendar.View exposing (calenderHeader)
import Storybook.Utils exposing (storybookApp)


-- APP


main =
    storybookApp
        { view = calenderHeader
        , init = \flags -> ( flags, Cmd.none )
        }
