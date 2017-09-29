module Update exposing (..)

import Navigation exposing (..)
import Models exposing (Model)
import Messages exposing (..)
import Location exposing (routeToPathStr, parseLocation)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeLocation loc ->
            parseLocation loc ! []

        ClickLink route ->
            route ! [ Navigation.newUrl <| routeToPathStr route ]
