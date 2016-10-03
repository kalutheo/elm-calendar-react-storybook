module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Date exposing (Date, Month(..), year, month, day)
import Date.Extra as Date exposing (Interval(..))


monthDates : Int -> Month -> List Date
monthDates y m =
  let
    start = Date.floor Monday <| Date.fromCalendarDate y m 1
  in
    Date.range Day 1 start <| Date.add Day 42 start

renderDate  =
  let
    maybeDate = Date.fromIsoString "2016-10-03"
  in
    case maybeDate of
      Just date -> Date.toFormattedString "dd-MM-y" <| Date.add Month -2 date
      Nothing -> "Invalid date"


main : Html msg
main =
    let
      dates = monthDates 2016 (Date.Oct)
      _ = Debug.log "hey" (List.map day dates)
    in
      calendarView


calendarView : Html msg
calendarView = div [ id "calendar" ]
    [ h1 []
        [ text "October" ]
    , table []
        [ tr []
            [ td [ class "lastmonth" ]
                [ text "30" ]
            , td []
                [ text "1" ]
            , td []
                [ text "2" ]
            , td []
                [ text "3" ]
            , td [ class "hastask" ]
                [ text "4" ]
            , td []
                [ text "5" ]
            , td []
                [ text "6" ]
            ]
        , tr []
            [ td []
                [ text "7" ]
            , td [ class "current" ]
                [ text "8" ]
            , td [ class "hastask" ]
                [ text "9" ]
            , td []
                [ text "10" ]
            , td []
                [ text "11" ]
            , td [ class "hastask" ]
                [ text "12" ]
            , td []
                [ text "13" ]
            ]
        , tr []
            [ td []
                [ text "14" ]
            , td [ class "hastask" ]
                [ text "15" ]
            , td []
                [ text "16" ]
            , td []
                [ text "17" ]
            , td []
                [ text "18" ]
            , td []
                [ text "19" ]
            , td []
                [ text "20" ]
            ]
        , tr []
            [ td [ class "hastask" ]
                [ text "21" ]
            , td []
                [ text "22" ]
            , td []
                [ text "23" ]
            , td []
                [ text "24" ]
            , td []
                [ text "25" ]
            , td [ class "hastask" ]
                [ text "26" ]
            , td []
                [ text "27" ]
            ]
        , tr []
            [ td []
                [ text "28" ]
            , td []
                [ text "29" ]
            , td [ class "hastask" ]
                [ text "30" ]
            , td []
                [ text "31" ]
            , td [ class "nextmonth" ]
                [ text "1" ]
            , td []
                [ text "2" ]
            , td []
                [ text "3" ]
            ]
        ]
    ]
