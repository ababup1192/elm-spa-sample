module Models exposing (..)

-- Model ルーティング


type Route
    = Foo
    | Bar
    | Hoge
    | NotFound


type alias Model =
    Route
