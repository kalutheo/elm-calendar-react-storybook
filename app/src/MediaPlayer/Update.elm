module MediaPlayer.Update exposing (..)

import MediaPlayer.Msg exposing (..)
import MediaPlayer.Model exposing (..)


update : Msg -> Model -> Model
update msg model =
    case msg of
        SelectDay date ->
            { model | selectedDay = Just date }

        HoverDay date ->
            { model | hoveredDay = Just date }

        BlurDay date ->
            { model | hoveredDay = Nothing }
