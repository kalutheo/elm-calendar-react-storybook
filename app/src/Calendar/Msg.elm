module Calendar.Msg exposing (..)

import Date exposing (Date)


type Msg
    = SelectDay Date
    | HoverDay Date
    | BlurDay Date
