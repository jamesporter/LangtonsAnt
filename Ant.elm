module Ant exposing (..)

import Html exposing (Html, text, div)
import Html.Attributes exposing (style)
import Html.Events
import Keyboard exposing (KeyCode)
import Svg exposing (svg, polygon, circle)
import Svg.Attributes exposing (version, viewBox, points, fill, cx, cy, r)
import Svg.Events exposing (onClick)
import AnimationFrame
import Time exposing (Time, millisecond)
import Array exposing (Array, repeat)


updateInterval : Time
updateInterval =
    millisecond * 100


width : Int
width =
    20


height : Int
height =
    20


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type Direction
    = North
    | West
    | East
    | South


type alias Ant =
    { x : Int
    , y : Int
    , direction : Direction
    }


type Colour
    = Black
    | White


type alias Model =
    { grid : Array Colour
    , ant : Ant
    }


model : Model
model =
    { grid = repeat (width * height) White
    , ant = { x = width // 2, y = height // 2, direction = North }
    }


init : ( Model, Cmd Msg )
init =
    ( model, Cmd.none )



-- UPDATE


type Msg
    = TimeUpdate Time


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TimeUpdate dt ->
            ( model, Cmd.none )


updateModel : Time -> Model -> Model
updateModel dt model =
    model



-- VIEW


view : Model -> Html Msg
view model =
    div [] [ text (toString model) ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Time.every updateInterval TimeUpdate
        ]
