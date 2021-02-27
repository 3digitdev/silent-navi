module Settings exposing (..)


type RainbowBridgeRequirement
    = Vanilla
    | AllDungeons
    | AllMedallions
    | Open


type GerudoFortressBehavior
    = DefaultGerudo
    | OneCarpenter
    | StartWithCard


type Hints
    = DefaultHints
    | Mask
    | Stone


type alias Settings =
    { glitchesAllowed : Bool
    , openForest : Bool
    , openKakarikoGate : Bool
    , openDoorOfTime : Bool
    , rainbowBridge : RainbowBridgeRequirement
    , gerudoFortress : GerudoFortressBehavior
    , hints : Hints
    }


initSettings : Settings
initSettings =
    { glitchesAllowed = False
    , openForest = False
    , openKakarikoGate = False
    , openDoorOfTime = False
    , rainbowBridge = Vanilla
    , gerudoFortress = DefaultGerudo
    , hints = DefaultHints
    }
