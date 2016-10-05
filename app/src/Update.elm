module Update exposing (..)

import Msg exposing (..)
import Model exposing (..)


update : Msg -> Model -> Model
update msg model =
    case msg of
        SelectDay date ->
            { model | selectedDay = Just date }

        HoverDay date ->
            { model | hoveredDay = Just date }
