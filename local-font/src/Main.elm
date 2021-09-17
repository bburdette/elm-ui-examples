module Main exposing (main)

import Browser
import Element
import Element.Input
import Element.Font
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


type alias Model =
    { lunch : Lunch }


initialModel : Model
initialModel =
    { lunch = Burrito }


type Lunch
    = Burrito
    | Sallad
    | Cake

type Msg
    = ChooseLunch Lunch


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChooseLunch lunch ->
            { model | lunch = lunch }


view : Model -> Html Msg
view model =
    Element.layout 
        [ Element.Font.color (Element.rgb255 51 51 51)
        , Element.Font.size 36
        , Element.Font.family
            [ Element.Font.typeface "Groovtastic"
            , Element.Font.sansSerif
            ]
        , Element.Font.extraLight
        , Element.Font.italic
        , Element.Font.center
        , Element.padding 10
        ]
        (Element.Input.radio []
            { label =
                Element.Input.labelAbove
                    []
                    (Element.text "Pick lunch")
            , onChange = ChooseLunch
            , selected = Just model.lunch
            , options =
                [ Element.Input.option Burrito (Element.text "Burrito!")
                , Element.Input.option Sallad (Element.text "Sallad")
                , Element.Input.option Cake (Element.text "Cake")
                ]
            }
        )


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }

