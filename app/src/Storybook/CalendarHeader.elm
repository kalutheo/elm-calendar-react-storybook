port module Storybook.CalenderHeader exposing (..)

import Html.App as Html
import MediaPlayer.View exposing (calenderHeader)
import MediaPlayer.Msg exposing (..)


-- APP


update : Msg -> String -> ( String, Cmd Msg )
update msg model =
    ( model, Cmd.none )


main =
    Html.programWithFlags
        { init = \flags -> ( flags, Cmd.none )
        , view = calenderHeader
        , subscriptions = \_ -> Sub.none
        , update = update
        }
