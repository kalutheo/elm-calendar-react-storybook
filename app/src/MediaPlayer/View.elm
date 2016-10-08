module MediaPlayer.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onMouseOver)
import Date exposing (Date, Month(..), year, month, day)
import Date.Extra as Date exposing (Interval(..))
import MediaPlayer.Model exposing (..)
import MediaPlayer.Utils exposing (..)
import MediaPlayer.Msg exposing (..)


classNameFromState : DayState -> String
classNameFromState state =
    case state of
        Normal ->
            ""

        Dimmed ->
            "lastmonth"

        Disabled ->
            ""

        Selected ->
            "current"


isSelected : Maybe Date -> Date -> Bool
isSelected selectedDay date =
    case selectedDay of
        Nothing ->
            False

        Just selectedDate ->
            Date.equal selectedDate date


isCurrentMonth : Date -> Int -> Bool
isCurrentMonth date selectedMonthIndex =
    Date.monthNumber date == selectedMonthIndex + 1


calendarDay : Date -> Model -> Html Msg
calendarDay date model =
    let
        state =
            if isSelected model.selectedDay date then
                Selected
            else if isCurrentMonth date model.selectedMonthIndex then
                Normal
            else
                Dimmed
    in
        td
            [ class <| classNameFromState state
            , onClick <| SelectDay date
            , onMouseOver <| HoverDay date
            ]
            [ text <| toString (day date) ]


calendarRow : List Date -> Model -> Html Msg
calendarRow dateRow model =
    tr []
        (List.map (\day -> calendarDay day model) dateRow)


calenderHeader : String -> Html Msg
calenderHeader title =
    h1 []
        [ text title ]


calendarView : Model -> Html Msg
calendarView model =
    let
        weeks =
            model.currentDates |> chunk dayPerWeek
    in
        div [ id "calendar" ]
            [ calenderHeader (getMonthNameByIndex model.selectedMonthIndex)
            , table []
                (List.map (\row -> calendarRow row model) weeks)
            ]
