module Main exposing (Model, Msgs(..), main, testview)

import Browser
import Browser.Events
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (onClick)
import Element.Font as Font
import Element.Input as Input


type Msgs
    = Resize Int Int


type alias Model =
    { size : ( Int, Int ) }


main =
    Browser.element
        { init = \() -> ( { size = ( 0, 0 ) }, Cmd.none )
        , update = \(Resize a b) mod -> ( { mod | size = ( a, b ) }, Cmd.none )
        , view = \mod -> Element.layout [ height fill, width fill, Border.width 5 ] (testview (Tuple.second mod.size))
        , subscriptions = \_ -> Browser.Events.onResize Resize
        }


testview : Int -> Element Msgs
testview h =
    column [ height fill, width fill ]
        -- height (px (h - 5)) ]
        -- column [ height fill ]
        [ row [ width fill ] [ text "header" ]
        , column [ scrollbarY, width fill ] (List.repeat 100 (text "content"))
        , row [ width fill ] [ text "footer" ]
        ]
