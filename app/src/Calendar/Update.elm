module Calendar.Update exposing (..)

import Calendar.Msg exposing (..)
import Calendar.Model exposing (..)


update : Msg -> Model -> Model
update msg model =
    case msg of
        SelectDay date ->
            case Maybe.oneOf [ model.selectedEndDay ] of
                Nothing ->
                    case model.selectedStartDay of
                        Nothing ->
                            { model | selectedStartDay = Just date }

                        Just selectedDate ->
                            { model | selectedEndDay = Just date }

                Just otherdate ->
                    { model | selectedStartDay = Just date, selectedEndDay = Nothing }

        HoverDay date ->
            { model | hoveredDay = Just date }

        BlurDay date ->
            { model | hoveredDay = Nothing }
