module Ant exposing (..)

import Html exposing (Html, text, div)
import Html.Attributes exposing (style)
import Html.Events
import Keyboard exposing (KeyCode)
import Svg exposing (svg, polygon, circle, rect)
import Svg.Attributes exposing (version, viewBox, points, fill, cx, cy, r)
import Svg.Events exposing (onClick)
import AnimationFrame
import Time exposing (Time, millisecond)
import Array exposing (Array, get, repeat)


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
            updateModel dt model


updateModel : Time -> Model -> ( Model, Cmd Msg)
updateModel dt model =
    ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    Html.div
        [ style [ ( "max-width", "400px" ), ( "min-width", "280px" ), ( "flex", "1" ) ] ]
        [ svg [ version "1.1", viewBox "0 0 400 400" ] (viewGrid model)
        , div [] [ text (toString model) ]
        ]


viewGrid : Model -> List (Html Msg)
viewGrid model =
    List.map (viewGridElement model) (List.range 0 (width * height - 1))

viewGridElement : Model -> Int -> Html Msg
viewGridElement model idx =
    let
      x = idx % width
      y = idx // height
    in
        if x == model.ant.x && y == model.ant.y then
            rect [ Svg.Attributes.x  (toString (x * 400 // width))
                        , Svg.Attributes.y (toString (y * 400 // height))
                        , Svg.Attributes.width (toString (400 // height))
                        , Svg.Attributes.height (toString (400 // height))
                        , fill "#dd2211"
                        ] []    
        else
            case get idx model.grid of
            Just Black ->
                rect [ Svg.Attributes.x  (toString (x * 400 // width))
                        , Svg.Attributes.y (toString (y * 400 // height))
                        , Svg.Attributes.width (toString (400 // height))
                        , Svg.Attributes.height (toString (400 // height))
                        , fill "#444"
                        ] []    
            Just White ->
                rect [ Svg.Attributes.x  (toString (x * 400 // width + 1))
                        , Svg.Attributes.y (toString (y * 400 // height + 1))
                        , Svg.Attributes.width (toString (400 // height - 2))
                        , Svg.Attributes.height (toString (400 // height - 2))
                        , fill "#ddd"
                        ] []    
            _ -> 
                rect [] []
            

        



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Time.every updateInterval TimeUpdate
        ]
