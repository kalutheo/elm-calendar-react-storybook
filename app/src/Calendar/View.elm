module Calendar.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onMouseOver, onMouseOut)
import Date exposing (Date, Month(..), year, month, day)
import Date.Extra as Date exposing (Interval(..))
import Calendar.Model exposing (..)
import Calendar.Utils exposing (..)
import Calendar.Msg exposing (..)


stateFromString : String -> DayState
stateFromString stateString =
    case stateString of
        "Normal" ->
            Normal

        "Dimmed" ->
            Dimmed

        "Disabled" ->
            Disabled

        "Selected" ->
            Selected

        "Hovered" ->
            Hovered

        _ ->
            Normal


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

        Hovered ->
            "hovered"


getDateState : Date -> Model -> DayState
getDateState date model =
    case oneOf [ model.selectedEndDay ] of
        Nothing ->
            if isSelected model.selectedStartDay date then
                Selected
            else if isSelected model.selectedEndDay date then
                Selected
            else if isBetween model.selectedStartDay model.hoveredDay date then
                Hovered
            else if isCurrentMonth date model.selectedMonthIndex then
                Normal
            else
                Dimmed

        Just endDate ->
            if
                isSelected model.selectedStartDay date
                    || isBetween model.selectedStartDay model.selectedEndDay date
            then
                Selected
            else if isCurrentMonth date model.selectedMonthIndex then
                Normal
            else
                Dimmed


calendarDay : Date -> DayState -> Html Msg
calendarDay date dayState =
    td
        [ class <| classNameFromState dayState
        , onClick <| SelectDay date
        , onMouseOver <| HoverDay date
        , onMouseOut <| BlurDay date
        ]
        [ text <| toString (day date) ]


calendarRow : List Date -> Model -> Html Msg
calendarRow dateRow model =
    tr []
        (List.map
            (\day ->
                calendarDay day (getDateState day model)
            )
            dateRow
        )


calenderHeader : String -> Html Msg
calenderHeader title =
    h1 []
        [ text title ]


selectedDayLabelView : String -> Maybe String -> Html Msg
selectedDayLabelView title day =
    div [ class "select-date-label" ]
        [ span [ class "label" ]
            [ text title ]
        , span
            [ class "date" ]
            [ text (Maybe.withDefault "" day) ]
        ]


calendarView : Model -> Html Msg
calendarView model =
    let
        weeks =
            model.currentDates |> chunk dayPerWeek

        startDay =
            Maybe.map (Date.toFormattedString "MMMM d, y") model.selectedStartDay

        endDay =
            Maybe.map (Date.toFormattedString "MMMM d, y") model.selectedEndDay
    in
        div []
            [ div [ id "calendar" ]
                [ calenderHeader (getMonthNameByIndex model.selectedMonthIndex)
                , table []
                    (List.map (\row -> calendarRow row model) weeks)
                ]
            , div
                [ id "footer" ]
                [ footer []
                    [ selectedDayLabelView "Start Date : " startDay
                    , selectedDayLabelView "End Date : " endDay
                    ]
                ]
            ]
