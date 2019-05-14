module Main exposing (main)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Input as Input
import Html exposing (Html)
import Html.Events exposing (onClick)


type alias Model =
    String


type Msg
    = Type String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Type s ->
            s


view : Model -> Html Msg
view model =
    Element.layout []
        (column [ width fill ]
            [ Input.text [ Border.rounded 0 ]
                { onChange = Type
                , text = model
                , placeholder = Nothing
                , label = Input.labelAbove [] <| text "default is fill?"
                }
            , Input.text
                [ Border.rounded 0
                , width (px 50)
                ]
                { onChange = Type
                , text = model
                , placeholder = Nothing
                , label = Input.labelAbove [] <| text "hardcoded to 50, sometimes too small"
                }
            , Input.text
                [ Border.rounded 0
                , width shrink
                ]
                { onChange = Type
                , text = model
                , placeholder = Nothing
                , label = Input.labelAbove [] <| text "putting shrink in makes it too big"
                }
            , Input.text
                [ Border.rounded 0
                , width (minimum 50 shrink)
                ]
                { onChange = Type
                , text = model
                , placeholder = Nothing
                , label = Input.labelAbove [] <| text "still meh"
                }
            , Input.text
                [ Border.rounded 0
                , width shrink
                ]
                { onChange = Type
                , text = model
                , placeholder = Just (Input.placeholder [] <| text model)
                , label = Input.labelAbove [] <| text "placeholder?"
                }
            , Input.text
                [ Border.rounded 0
                , width (px (20 + (10 * max 2 (String.length model))))
                ]
                { onChange = Type
                , text = model
                , placeholder = Just (Input.placeholder [] <| text model)
                , label = Input.labelAbove [] <| text "egregious hack"
                }
            , textAreaToContents
                [ Border.rounded 0
                , width shrink
                ]
                { onChange = Type
                , text = model
                , placeholder = Just (Input.placeholder [] <| text model)

                -- , label = Input.labelHidden "textAreaToContents"
                , label = Input.labelAbove [] <| text "textAreaToContents"
                }
            ]
        )


type alias TextInputSpecs msg =
    { onChange : String -> msg
    , text : String
    , placeholder : Maybe (Input.Placeholder msg)
    , label : Input.Label msg
    }


textAreaToContents : List (Attribute msg) -> TextInputSpecs msg -> Element msg
textAreaToContents attr specs =
    row (inFront (Input.text [ width fill ] specs) :: attr)
        [ text specs.text
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = "as big as this"
        , view = view
        , update = update
        }


sscce : Element msg
sscce =
    Element.text "sscce"
