module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Date exposing (Date, Month(..), year, month, day)
import Date.Extra as Date exposing (Interval(..))
import Array


-- Model


type alias Model =
    { selectedMonthIndex : Int
    , selectedDay : Int
    , currentDates : List Date
    }


model : Model
model =
    { selectedMonthIndex = 9
    , selectedDay = 18
    , currentDates = monthDates 2016 (Date.Oct)
    }


type DayState
    = Normal
    | Dimmed
    | Disabled
    | Selected



-- Date utils


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


monthDates : Int -> Month -> List Date
monthDates y m =
    let
        start =
            Date.floor Monday <| Date.fromCalendarDate y m 1
    in
        Date.range Day 1 start <| Date.add Day 42 start


dayPerWeek : Int
dayPerWeek =
    7


monthNames : List ( Month, String )
monthNames =
    [ ( Jan, "January" )
    , ( Feb, "February" )
    , ( Mar, "March" )
    , ( Apr, "April" )
    , ( May, "May" )
    , ( Jun, "June" )
    , ( Jul, "July" )
    , ( Aug, "August" )
    , ( Sep, "September" )
    , ( Oct, "October" )
    , ( Nov, "November" )
    , ( Dec, "December" )
    ]


getMonthNameByIndex : Int -> String
getMonthNameByIndex selectedMonthIndex =
    let
        maybeMonth =
            Array.fromList monthNames |> Array.get selectedMonthIndex
    in
        case maybeMonth of
            Just date ->
                date |> snd

            Nothing ->
                ""



-- Helpers


chunk : Int -> List a -> List (List a)
chunk n list =
    if List.isEmpty list then
        []
    else
        List.take n list :: chunk n (List.drop n list)



-- View


main : Html msg
main =
    calendarView model


calendarDay : Date -> Model -> Html msg
calendarDay date model =
    let
        state =
            if model.selectedDay == day date then
                Selected
            else if Date.monthNumber date == model.selectedMonthIndex + 1 then
                Normal
            else
                Dimmed
    in
        td [ class <| classNameFromState state ]
            [ text <| toString (day date) ]


calendarRow : List Date -> Model -> Html msg
calendarRow dateRow model =
    tr []
        (List.map (\day -> calendarDay day model) dateRow)


calendarView : Model -> Html msg
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
