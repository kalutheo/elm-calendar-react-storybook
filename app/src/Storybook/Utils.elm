module Storybook.Utils exposing (..)

import Html


-- APP


update : msg -> a -> ( a, Cmd msg )
update msg model =
    ( model, Cmd.none )


storybookApp : { b | view : a -> Html.Html msg } -> Program a a msg
storybookApp { view } =
    Html.programWithFlags
        { init = \flags -> ( flags, Cmd.none )
        , view = view
        , subscriptions = \_ -> Sub.none
        , update = update
        }
