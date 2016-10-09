module Storybook.Utils exposing (..)

import Html.App as Html


-- APP


update : msg -> a -> ( a, Cmd msg )
update msg model =
    ( model, Cmd.none )


storybookApp { view, init } =
    Html.programWithFlags
        { init = init
        , view = view
        , subscriptions = \_ -> Sub.none
        , update = update
        }
