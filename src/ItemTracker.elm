module ItemTracker exposing
    ( AdultTrade
    , ChildTrade
    , Gems
    , ItemTracker
    , Medallions
    , Quaternary(..)
    , Songs
    , Ternary(..)
    , bombsIcon
    , bowIcons
    , dekuNutsIcon
    , dekuSticksIcon
    , gloveIcons
    , hookshotIcons
    , initItemTracker
    , magicIcons
    , ocarinaIcons
    , scaleIcons
    , selectWithQuaternary
    , selectWithTernary
    , slingshotIcons
    , walletIcons
    )

import List.Extra as LX exposing (getAt)


type alias Medallions =
    { forest : Bool
    , fire : Bool
    , water : Bool
    , spirit : Bool
    , shadow : Bool
    , light : Bool
    }


initMedallions : Medallions
initMedallions =
    Medallions False False False False False False


type alias Gems =
    { emerald : Bool
    , sapphire : Bool
    , ruby : Bool
    }


initGems : Gems
initGems =
    Gems False False False


type alias Songs =
    { zelda : Bool
    , epona : Bool
    , saria : Bool
    , sun : Bool
    , time : Bool
    , storms : Bool
    , forest : Bool
    , fire : Bool
    , water : Bool
    , spirit : Bool
    , shadow : Bool
    , light : Bool
    , scarecrow : Bool
    }


initSongs : Songs
initSongs =
    Songs False False False False False False False False False False False False False


type ChildTrade
    = NoChildTrade
    | Egg
    | Cucco
    | Letter
    | Keaton
    | Skull
    | Spooky
    | Bunny
    | Truth


type AdultTrade
    = NoAdultTrade
    | PocketEgg
    | PocketCucco
    | Cojiro
    | Mushroom
    | OddPotion
    | PoacherSaw
    | BrokenSword
    | Prescription
    | Frog
    | EyeDrops
    | ClaimCheck


type alias SmallKeys =
    { forest : Int
    , fire : Int
    , water : Int
    , shadow : Int
    , spirit : Int
    , well : Int
    , fortress : Int
    , trainingGrounds : Int
    , castle : Int
    }


type alias BossKeys =
    { forest : Bool
    , fire : Bool
    , water : Bool
    , shadow : Bool
    , spirit : Bool
    , castle : Bool
    }


type alias CompassMap =
    { forest : ( Bool, Bool )
    , fire : ( Bool, Bool )
    , water : ( Bool, Bool )
    , shadow : ( Bool, Bool )
    , spirit : ( Bool, Bool )
    , well : ( Bool, Bool )
    , ice : ( Bool, Bool )
    , deku : ( Bool, Bool )
    , dodongo : ( Bool, Bool )
    , jabu : ( Bool, Bool )
    }


type Ternary
    = TZero
    | TOne
    | TTwo


selectWithTernary : Ternary -> List String -> String
selectWithTernary ternary someList =
    someList
        |> LX.getAt
            (case ternary of
                TZero ->
                    0

                TOne ->
                    1

                TTwo ->
                    2
            )
        |> Maybe.withDefault ""


type Quaternary
    = QZero
    | QOne
    | QTwo
    | QThree


selectWithQuaternary : Quaternary -> List String -> String
selectWithQuaternary quaternary someList =
    someList
        |> LX.getAt
            (case quaternary of
                QZero ->
                    0

                QOne ->
                    1

                QTwo ->
                    2

                QThree ->
                    3
            )
        |> Maybe.withDefault ""


type alias ItemTracker =
    -- Complex
    { medallions : Medallions
    , gems : Gems
    , songs : Songs
    , childTrade : ChildTrade
    , adultTrade : AdultTrade
    , smallKeys : SmallKeys
    , bossKeys : BossKeys
    , compassMap : CompassMap

    -- Simple Counters
    , skulltulas : Int
    , beans : Int
    , bottles : Int
    , heartPieces : Int
    , fullHearts : Int

    -- Yes/No
    , bombchus : Bool
    , boomerang : Bool
    , lensOfTruth : Bool
    , hammer : Bool
    , doubleDefense : Bool
    , gerudoMembership : Bool
    , stoneOfAgony : Bool
    , rutoLetter : Bool
    , fireArrows : Bool
    , iceArrows : Bool
    , lightArrows : Bool
    , dinsFire : Bool
    , nayrusLove : Bool
    , faroresWind : Bool
    , kokiriSword : Bool
    , masterSword : Bool
    , biggoronSword : Bool
    , dekuShield : Bool
    , hylianShield : Bool
    , mirrorShield : Bool
    , kokiriTunic : Bool
    , zoraTunic : Bool
    , goronTunic : Bool
    , kokiriBoots : Bool
    , hoverBoots : Bool
    , ironBoots : Bool

    -- Two Upgrades
    , ocarina : Ternary
    , hookshot : Ternary
    , scale : Ternary
    , magic : Ternary

    -- You start with a wallet, can't go "below" the child wallet.
    , wallet : Ternary

    -- Three Upgrades
    , dekuSticks : Quaternary
    , dekuNuts : Quaternary
    , bombs : Quaternary
    , slingshot : Quaternary
    , bow : Quaternary
    , gloves : Quaternary
    }


initItemTracker : ItemTracker
initItemTracker =
    { medallions = initMedallions
    , gems = initGems
    , songs = initSongs
    , childTrade = NoChildTrade
    , adultTrade = NoAdultTrade
    , smallKeys = SmallKeys 0 0 0 0 0 0 0 0 0
    , bossKeys = BossKeys False False False False False False
    , compassMap =
        CompassMap
            ( False, False )
            ( False, False )
            ( False, False )
            ( False, False )
            ( False, False )
            ( False, False )
            ( False, False )
            ( False, False )
            ( False, False )
            ( False, False )
    , skulltulas = 0
    , beans = 0
    , bottles = 0
    , heartPieces = 0
    , fullHearts = 0
    , bombchus = False
    , boomerang = False
    , lensOfTruth = False
    , hammer = False
    , doubleDefense = False
    , gerudoMembership = False
    , stoneOfAgony = False
    , rutoLetter = False
    , fireArrows = False
    , iceArrows = False
    , lightArrows = False
    , dinsFire = False
    , nayrusLove = False
    , faroresWind = False
    , kokiriSword = False
    , masterSword = False
    , biggoronSword = False
    , dekuShield = False
    , hylianShield = False
    , mirrorShield = False

    -- Starting Gear
    , kokiriTunic = True
    , zoraTunic = False
    , goronTunic = False

    -- Starting Gear
    , kokiriBoots = True
    , hoverBoots = False
    , ironBoots = False
    , ocarina = TZero
    , hookshot = TZero
    , scale = TZero
    , magic = TZero

    -- Starting Gear
    , wallet = TZero
    , dekuSticks = QZero
    , dekuNuts = QZero
    , bombs = QZero
    , slingshot = QZero
    , bow = QZero
    , gloves = QZero
    }


ocarinaIcons : Ternary -> String
ocarinaIcons tern =
    [ "No Ocarina", "Fairy Ocarina", "Ocarina of Time" ] |> selectWithTernary tern


hookshotIcons : Ternary -> String
hookshotIcons tern =
    [ "No Hookshot", "Hookshot", "Longshot" ] |> selectWithTernary tern


scaleIcons : Ternary -> String
scaleIcons tern =
    [ "No Scale", "Silver Scale", "Golden Scale" ] |> selectWithTernary tern


magicIcons : Ternary -> String
magicIcons tern =
    [ "No Magic", "1x Magic", "2x Magic" ] |> selectWithTernary tern


walletIcons : Ternary -> String
walletIcons tern =
    [ "Child's Wallet", "Adult's Wallet", "Giant's Wallet" ] |> selectWithTernary tern


dekuSticksIcon : Quaternary -> String
dekuSticksIcon quat =
    [ "No Deku Sticks", "Deku Sticks 10", "Deku Sticks 20", "Deku Sticks 30" ] |> selectWithQuaternary quat


dekuNutsIcon : Quaternary -> String
dekuNutsIcon quat =
    [ "No Deku Nuts", "Deku Nuts 10", "Deku Nuts 20", "Deku Nuts 30" ] |> selectWithQuaternary quat


bombsIcon : Quaternary -> String
bombsIcon quat =
    [ "No Bombs", "Bombs 10", "Bombs 20", "Bombs 30" ] |> selectWithQuaternary quat


slingshotIcons : Quaternary -> String
slingshotIcons quat =
    [ "No Slingshot", "Slingshot 30", "Slingshot 40", "Slingshot 50" ] |> selectWithQuaternary quat


bowIcons : Quaternary -> String
bowIcons quat =
    [ "No Bow", "Bow 30", "Bow 40", "Bow 50" ] |> selectWithQuaternary quat


gloveIcons : Quaternary -> String
gloveIcons quat =
    [ "No Gloves", "Goron Bracer", "Silver Gauntlets", "Golden Gauntlets" ] |> selectWithQuaternary quat
