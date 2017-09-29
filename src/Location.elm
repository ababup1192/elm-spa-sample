module Location exposing (..)

import Navigation exposing (..)
import UrlParser exposing (Parser, parseHash, parsePath, map, top, s)
import Models exposing (..)


matchers : Parser (Route -> a) a
matchers =
    UrlParser.oneOf
        [ map Foo top
        , map Foo <| s (routeToPathStr Foo)
        , map Bar <| s (routeToPathStr Bar)
        , map Hoge <| s (routeToPathStr Hoge)
        ]


routeToPathStr : Route -> String
routeToPathStr route =
    case route of
        Foo ->
            "foo"

        Bar ->
            "bar"

        Hoge ->
            "hoge"

        NotFound ->
            "other"


parseLocation : Location -> Route
parseLocation location =
    case (parsePath matchers location) of
        Just route ->
            route

        Nothing ->
            NotFound
