module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Date exposing (Date, Month(..), year, month, day)
import Date.Extra as Date exposing (Interval(..))

-- Model


type alias Model = {
  dayPerWeek : Int,
  selectedMonth: Int,
  currentDates : List Date
}

model : Model
model = {
  dayPerWeek  = 7
  ,selectedMonth = 9
  ,currentDates = monthDates 2016 (Date.Oct)
 }

monthDates : Int -> Month -> List Date
monthDates y m =
  let
    start = Date.floor Monday <| Date.fromCalendarDate y m 1
  in
    Date.range Day 1 start <| Date.add Day 42 start

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


calendarDay : Date -> Html msg
calendarDay date =
  td []
      [ text <| toString (day date) ]

calendarRow : (List Date) -> Html msg
calendarRow dateRow =
  tr []
      (List.map calendarDay dateRow)

calendarView : Model -> Html msg
calendarView model =
  let
    weeks = model.currentDates |> chunk model.dayPerWeek
    _ = Debug.log "weeks" weeks
  in
  div [ id "calendar" ]
    [ h1 []
        [ text "October" ]
    , table []
        (List.map calendarRow weeks)
    ]
