module Storybook.Utils exposing (..)

import Html


-- APP


update : msg -> a -> ( a, Cmd msg )
update msg model =
    ( model, Cmd.none )


storybookApp { view } =
    Html.programWithFlags
        { init = \flags -> ( flags, Cmd.none )
        , view = view
        , subscriptions = \_ -> Sub.none
        , update = update
        }
