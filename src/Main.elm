module Main exposing (..)

import Navigation exposing (..)
import Models exposing (Model)
import Messages exposing (..)
import View exposing (view)
import Update exposing (update)
import Location exposing (parseLocation)


init : Location -> ( Model, Cmd Msg )
init loc =
    parseLocation loc ! []



-- Main


main : Program Never Model Msg
main =
    Navigation.program ChangeLocation
        { init = init, subscriptions = always Sub.none, view = view, update = update }
