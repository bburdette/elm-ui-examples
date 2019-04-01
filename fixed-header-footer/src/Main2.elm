module Main exposing (main)

import Browser
import Element exposing (..)
import Element.Border as Border


main =
    layout [ height fill, width fill ] <|
        column [ height fill, width fill ]
            [ el [ width fill, height (px 200), padding 5 ] <|
                text "This is the top segment"
            , column [ width fill, scrollbarY ]
                (List.map
                    (\n ->
                        el [ width fill ] <|
                            text ("this is " ++ String.fromInt n)
                    )
                    (List.range 0 100)
                )
            , el [ width fill, height (px 200), padding 5 ] <|
                text "This is the bottom segment"
            ]
