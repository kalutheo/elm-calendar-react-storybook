module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Date exposing (Date, Month(..), year, month, day)
import Date.Extra as Date exposing (Interval(..))
import Model exposing (..)
import Utils exposing (..)
import Msg exposing (..)


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


isSelected : Int -> Date -> Bool
isSelected selectedDay date =
    selectedDay == day date


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
        td [ class <| classNameFromState state, onClick <| SelectDay date ]
            [ text <| toString (day date) ]


calendarRow : List Date -> Model -> Html Msg
calendarRow dateRow model =
    tr []
        (List.map (\day -> calendarDay day model) dateRow)


calendarView : Model -> Html Msg
calendarView model =
    let
        weeks =
            model.currentDates |> chunk dayPerWeek
    in
        div [ id "calendar" ]
            [ h1 []
                [ text <| getMonthNameByIndex model.selectedMonthIndex ]
            , table []
                (List.map (\row -> calendarRow row model) weeks)
            ]
