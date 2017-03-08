module Ant exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import Html.Events
import Keyboard exposing (KeyCode)
import Svg exposing (svg, polygon, circle)
import Svg.Attributes exposing (version, viewBox, points, fill, cx, cy, r)
import Svg.Events exposing (onClick)
import AnimationFrame
import Time exposing (Time)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


-- MODEL

type alias Model =
    { 
    }


model : Model
model =
    { 
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
            ( updateModel dt model, Cmd.none )

-- VIEW


view : Model -> Html Msg
view model =
  

-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ AnimationFrame.diffs TimeUpdate
        ]
