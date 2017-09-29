module Messages exposing (..)

import Navigation exposing (..)
import Models exposing (Route)


-- Message


type Msg
    = ChangeLocation Location
    | ClickLink Route
