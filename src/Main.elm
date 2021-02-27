module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import ItemTracker exposing (..)
import Json.Decode as JD exposing (..)


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Location =
    { name : String
    , locType : String
    , categories : List String
    }


type alias Model =
    { error : Maybe String
    , locations : List Location
    , items : ItemTracker
    }


decodeData : JD.Decoder Location
decodeData =
    JD.map3 Location
        (JD.field "name" JD.string)
        (JD.field "type" JD.string)
        (JD.field "categories" (JD.list JD.string))


getLocations : (Result Http.Error (List Location) -> Msg) -> Cmd Msg
getLocations cmd =
    Http.get
        { url = "zootr.json"
        , expect = Http.expectJson cmd (JD.list decodeData)
        }



-- INIT


init : () -> ( Model, Cmd Msg )
init _ =
    update LoadLocations initModel


initModel : Model
initModel =
    { error = Nothing
    , locations = []
    , items = initItemTracker
    }



-- UPDATE


type Msg
    = NoOp
    | LoadLocations
    | LocationsLoaded (Result Http.Error (List Location))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        LoadLocations ->
            ( model
            , getLocations LocationsLoaded
            )

        LocationsLoaded result ->
            case result of
                Err httpError ->
                    case httpError of
                        Http.BadBody errStr ->
                            ( { model | error = Just errStr }, Cmd.none )

                        _ ->
                            ( model, Cmd.none )

                Ok locationData ->
                    let
                        foo =
                            Debug.log "locations" locationData
                    in
                    ( { model | locations = locationData }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ table []
            [ tr []
                [ td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                ]
            , tr []
                [ td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                ]
            , tr []
                [ td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                ]
            , tr []
                [ td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                ]
            , tr []
                [ td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                , td []
                    [ button [] [ text "" ] ]
                ]
            ]
        ]
