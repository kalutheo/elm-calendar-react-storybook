module Update exposing (..)

import Msg exposing (..)
import Model exposing (..)
import Date exposing (day)


update : Msg -> Model -> Model
update msg model =
    case msg of
        SelectDay date ->
            { model | selectedDay = day date }
