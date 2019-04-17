
module Main exposing (main)

import Browser
import Element exposing (..)
import Element.Border as Border


main =
    layout
        [ width fill
        , height fill
        , centerX
        , inFront <|
            column [ centerX, height fill, scrollbarY ]
                [ el [ height fill, scrollbarY ] none
                , column [ Border.width 1, scrollbarY ] <|
                    List.map (\n -> text <| "long dialog" ++ String.fromInt n)
                        (List.range 0 2)
                , el [ height fill ] none
                ]
        ]
    <|
        column [] <|
            List.map (\n -> text <| "long content" ++ String.fromInt n)
                (List.range 0 1000)
