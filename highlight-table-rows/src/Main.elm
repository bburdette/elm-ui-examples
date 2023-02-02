module Main exposing (..)

import Browser
import Browser.Events
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (onClick, onMouseEnter, onMouseLeave)
import Element.Font as Font
import Element.Input as Input


-- Ellie for this one:  
--  https://ellie-app.com/kSZPrk5BCRNa1

type Msgs
    = EnterCell Int
    | LeaveCell Int


type alias Model =
    { highlightRow : Maybe Int }


main =
    Browser.element
        { init = \() -> ( { highlightRow = Nothing }, Cmd.none )
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


update msg model =
    case msg of
        EnterCell row ->
            ( { model | highlightRow = Just row }, Cmd.none )

        LeaveCell row ->
            ( { model | highlightRow = Just row }, Cmd.none )


cellevents =
    \mbhr row evts ->
        evts
            ++ [ onMouseEnter (EnterCell row), onMouseLeave (LeaveCell row) ]
            ++ (if mbhr == Just row then
                    [ Background.color (Element.rgb 255 0 0) ]

                else
                    []
               )


view model =
    layout [ width fill, height fill ] <|
        table [ width fill, height fill, spacing 1 ] <|
            { data =
                List.indexedMap (\i s -> ( i, s ++ String.fromInt i )) <|
                    List.repeat 50 "test"
            , columns =
                [ { header = el [ Background.color (rgb 0.9 0.9 0) ] <| text ("table header, row = " ++ (Maybe.map String.fromInt model.highlightRow |> Maybe.withDefault "none"))
                  , width = fill
                  , view = \( i, s ) -> el (cellevents model.highlightRow i [ padding 3 ]) <| text s
                  }
                , { header = el [ Background.color (rgb 0.9 0.9 0) ] <| text "table header"
                  , width = fill
                  , view = \( i, s ) -> el (cellevents model.highlightRow i [ padding 3 ]) <| text s
                  }
                , { header = el [ Background.color (rgb 0.9 0.9 0) ] <| text "table header"
                  , width = fill
                  , view = \( i, s ) -> el (cellevents model.highlightRow i [ padding 3 ]) <| text s
                  }
                ]
            }
