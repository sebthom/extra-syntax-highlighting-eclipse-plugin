-- Main.elm
module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

-- ====================================================
-- 1. MODEL
-- ====================================================

-- Define the application's state using a custom type alias
type alias Model =
    { count : Int }

-- Initialize the model with a starting count of 0
initialModel : Model
initialModel =
    { count = 0 }

-- ====================================================
-- 2. MESSAGES
-- ====================================================

-- Define the messages that represent possible user interactions
type Msg
    = Increment
    | Decrement
    | Reset

-- ====================================================
-- 3. UPDATE
-- ====================================================

-- Update function that handles incoming messages and updates the model accordingly
update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 }

        Decrement ->
            { model | count = model.count - 1 }

        Reset ->
            { model | count = 0 }

-- ====================================================
-- 4. VIEW
-- ====================================================

-- View function that renders the HTML based on the current model
view : Model -> Html Msg
view model =
    div [ style "text-align" "center", style "margin-top" "50px" ]
        [ div [ style "font-size" "2em", style "margin-bottom" "20px" ]
            [ text ("Count: " ++ String.fromInt(model.count)) ]
        , button [ onClick Increment, style "padding" "10px", style "margin-right" "10px" ]
            [ text "Increment" ]
        , button [ onClick Decrement, style "padding" "10px", style "margin-right" "10px" ]
            [ text "Decrement" ]
        , button [ onClick Reset, style "padding" "10px" ]
            [ text "Reset" ]
        ]

-- ====================================================
-- 5. MAIN
-- ====================================================

-- Main entry point of the Elm application using Browser.sandbox
main : Program () Model Msg
main =
    Browser.sandbox { init = initialModel, update = update, view = view }
