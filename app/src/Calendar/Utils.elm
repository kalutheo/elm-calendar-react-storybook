module Calendar.Utils exposing (..)

import Date exposing (Date, Month(..), year, month, day)
import Date.Extra as Date exposing (Interval(..))
import Array


oneOf : List (Maybe a) -> Maybe a
oneOf maybes =
    case maybes of
        [] ->
            Nothing

        maybe :: rest ->
            case maybe of
                Nothing ->
                    oneOf rest

                Just _ ->
                    maybe


chunk : Int -> List a -> List (List a)
chunk n list =
    if List.isEmpty list then
        []
    else
        List.take n list :: chunk n (List.drop n list)


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
                date |> Tuple.second

            Nothing ->
                ""
