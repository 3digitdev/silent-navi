module Logic exposing (..)

import ItemTracker exposing (ItemTracker, Quaternary(..), Ternary(..))
import Settings exposing (Settings)



-- Logic translated manually from https://github.com/TestRunnerSRL/OoT-Randomizer/blob/Dev/data/LogicHelpers.json
-- All credit to the authors/contributors of that Repo!
-- All functions in here need to be type signature `ItemTracker -> Bool`
-- Gems, Medallions, & Songs


hasGems : ItemTracker -> Bool
hasGems itemTracker =
    itemTracker.gems.emerald
        && itemTracker.gems.ruby
        && itemTracker.gems.sapphire


hasMedallions : ItemTracker -> Bool
hasMedallions itemTracker =
    itemTracker.medallions.forest
        && itemTracker.medallions.fire
        && itemTracker.medallions.water
        && itemTracker.medallions.shadow
        && itemTracker.medallions.spirit
        && itemTracker.medallions.light


canPlay : Bool -> ItemTracker -> Bool
canPlay songState itemTracker =
    case itemTracker.ocarina of
        TZero ->
            False

        _ ->
            songState


canPlayScarecrow : ItemTracker -> Bool
canPlayScarecrow itemTracker =
    itemTracker |> canPlay itemTracker.songs.scarecrow


canPlayZelda : ItemTracker -> Bool
canPlayZelda itemTracker =
    itemTracker |> canPlay itemTracker.songs.zelda


canPlayEpona : ItemTracker -> Bool
canPlayEpona itemTracker =
    itemTracker |> canPlay itemTracker.songs.epona


canPlaySaria : ItemTracker -> Bool
canPlaySaria itemTracker =
    itemTracker |> canPlay itemTracker.songs.saria


canPlaySun : ItemTracker -> Bool
canPlaySun itemTracker =
    itemTracker |> canPlay itemTracker.songs.sun


canPlayTime : ItemTracker -> Bool
canPlayTime itemTracker =
    itemTracker |> canPlay itemTracker.songs.time


canPlayStorms : ItemTracker -> Bool
canPlayStorms itemTracker =
    itemTracker |> canPlay itemTracker.songs.storms


canPlayForest : ItemTracker -> Bool
canPlayForest itemTracker =
    itemTracker |> canPlay itemTracker.songs.forest


canPlayFire : ItemTracker -> Bool
canPlayFire itemTracker =
    itemTracker |> canPlay itemTracker.songs.fire


canPlayWater : ItemTracker -> Bool
canPlayWater itemTracker =
    itemTracker |> canPlay itemTracker.songs.water


canPlayShadow : ItemTracker -> Bool
canPlayShadow itemTracker =
    itemTracker |> canPlay itemTracker.songs.shadow


canPlaySpirit : ItemTracker -> Bool
canPlaySpirit itemTracker =
    itemTracker |> canPlay itemTracker.songs.spirit


canPlayLight : ItemTracker -> Bool
canPlayLight itemTracker =
    itemTracker |> canPlay itemTracker.songs.light



-- Ternaries
-- Skip the ocarina, covered above


hasHookshot : ItemTracker -> Bool
hasHookshot itemTracker =
    itemTracker.hookshot /= TZero && (itemTracker |> canBeAdult)


hasLongshot : ItemTracker -> Bool
hasLongshot itemTracker =
    itemTracker.hookshot == TTwo && (itemTracker |> canBeAdult)


hasSilverScale : ItemTracker -> Bool
hasSilverScale itemTracker =
    itemTracker.scale /= TZero


hasGoldenScale : ItemTracker -> Bool
hasGoldenScale itemTracker =
    itemTracker.scale == TTwo


hasMagic : ItemTracker -> Bool
hasMagic itemTracker =
    itemTracker.magic /= TZero


hasDoubleMagic : ItemTracker -> Bool
hasDoubleMagic itemTracker =
    itemTracker.magic == TTwo


hasAdultWallet : ItemTracker -> Bool
hasAdultWallet itemTracker =
    itemTracker.wallet /= TZero


hasGiantWallet : ItemTracker -> Bool
hasGiantWallet itemTracker =
    itemTracker.wallet == TTwo



-- Quaternaries


hasBow : ItemTracker -> Bool
hasBow itemTracker =
    itemTracker.bow /= QZero && (itemTracker |> canBeAdult)


hasBombs : ItemTracker -> Bool
hasBombs itemTracker =
    itemTracker.bombs /= QZero


hasSlingshot : ItemTracker -> Bool
hasSlingshot itemTracker =
    itemTracker.slingshot /= QZero


hasDekuNuts : ItemTracker -> Bool
hasDekuNuts itemTracker =
    itemTracker.dekuNuts /= QZero


hasDekuSticks : ItemTracker -> Bool
hasDekuSticks itemTracker =
    itemTracker.dekuSticks /= QZero


hasGoronBracer : ItemTracker -> Bool
hasGoronBracer itemTracker =
    itemTracker.gloves /= QZero


hasSilverGauntlet : ItemTracker -> Bool
hasSilverGauntlet itemTracker =
    [ QTwo, QThree ] |> List.member itemTracker.gloves


hasGoldenGauntlet : ItemTracker -> Bool
hasGoldenGauntlet itemTracker =
    itemTracker.gloves == QThree



-- Now we get a little bit more complex...


canBeAdult : ItemTracker -> Bool
canBeAdult itemTracker =
    itemTracker |> canPlayTime


hasGoronTunic : ItemTracker -> Bool
hasGoronTunic itemTracker =
    (itemTracker |> canBeAdult)
        && (itemTracker.goronTunic || (itemTracker |> hasAdultWallet))


hasZoraTunic : ItemTracker -> Bool
hasZoraTunic itemTracker =
    (itemTracker |> canBeAdult)
        && (itemTracker.zoraTunic || (itemTracker |> hasGiantWallet))


hasBottle : ItemTracker -> Bool
hasBottle itemTracker =
    itemTracker.bottles > 0


hasExplosives : ItemTracker -> Bool
hasExplosives itemTracker =
    (itemTracker |> hasBombs)
        || itemTracker.bombchus


canBlastOrSmash : ItemTracker -> Bool
canBlastOrSmash itemTracker =
    (itemTracker |> hasHammer)
        || (itemTracker |> hasExplosives)


canHitScarecrow : ItemTracker -> Bool
canHitScarecrow itemTracker =
    (itemTracker |> canPlayScarecrow)
        && (itemTracker |> hasHookshot)


canHitFarScarecrow : ItemTracker -> Bool
canHitFarScarecrow itemTracker =
    (itemTracker |> canPlayScarecrow)
        && (itemTracker |> hasLongshot)


canUseDinsFire : ItemTracker -> Bool
canUseDinsFire itemTracker =
    (itemTracker |> hasMagic) && itemTracker.dinsFire


canUseNayrusLove : ItemTracker -> Bool
canUseNayrusLove itemTracker =
    (itemTracker |> hasMagic) && itemTracker.nayrusLove


canUseFaroresWind : ItemTracker -> Bool
canUseFaroresWind itemTracker =
    (itemTracker |> hasMagic) && itemTracker.faroresWind


canUseLensOfTruth : ItemTracker -> Bool
canUseLensOfTruth itemTracker =
    (itemTracker |> hasMagic) && itemTracker.lensOfTruth


canUseFireArrows : ItemTracker -> Bool
canUseFireArrows itemTracker =
    (itemTracker |> canBeAdult)
        && (itemTracker |> hasBow)
        && (itemTracker |> hasMagic)
        && itemTracker.fireArrows


canUseLightArrows : ItemTracker -> Bool
canUseLightArrows itemTracker =
    (itemTracker |> canBeAdult)
        && (itemTracker |> hasBow)
        && (itemTracker |> hasMagic)
        && itemTracker.lightArrows


canChildDamage : ItemTracker -> Bool
canChildDamage itemTracker =
    itemTracker.kokiriSword
        || (itemTracker |> hasDekuSticks)
        || (itemTracker |> hasSlingshot)
        || (itemTracker |> hasExplosives)
        || (itemTracker |> canUseDinsFire)


canChildAttack : ItemTracker -> Bool
canChildAttack itemTracker =
    (itemTracker |> canChildDamage)
        || itemTracker.boomerang


canCutShrubs : ItemTracker -> Bool
canCutShrubs itemTracker =
    (itemTracker |> canBeAdult)
        || (itemTracker |> hasDekuSticks)
        || itemTracker.boomerang
        || itemTracker.kokiriSword
        || (itemTracker |> hasExplosives)


canShield : ItemTracker -> Bool
canShield itemTracker =
    itemTracker.dekuShield
        || ((itemTracker |> canBeAdult) && (itemTracker.hylianShield || itemTracker.mirrorShield))


canShieldBounce : ItemTracker -> Bool
canShieldBounce itemTracker =
    -- Mirror Shield can't reflect Scrub bullets
    itemTracker.dekuShield
        || ((itemTracker |> canBeAdult) && itemTracker.hylianShield)


canJumpslash : ItemTracker -> Bool
canJumpslash itemTracker =
    (itemTracker |> canBeAdult)
        || (itemTracker |> hasDekuSticks)
        || itemTracker.kokiriSword


canRideEpona : ItemTracker -> Bool
canRideEpona itemTracker =
    (itemTracker |> canBeAdult)
        && (itemTracker |> canPlayEpona)


canStunDekuScrubs : ItemTracker -> Bool
canStunDekuScrubs itemTracker =
    (itemTracker |> canBeAdult)
        || (itemTracker |> hasExplosives)
        || (itemTracker |> canUseDinsFire)
        || (itemTracker |> hasSlingshot)
        || (itemTracker |> hasDekuSticks)
        || (itemTracker |> hasDekuNuts)
        || itemTracker.boomerang
        || itemTracker.kokiriSword
        || itemTracker.dekuShield


canPlantBeans : ItemTracker -> Bool
canPlantBeans itemTracker =
    itemTracker.beans > 0


canOpenBombGrotto : ItemTracker -> Bool
canOpenBombGrotto itemTracker =
    itemTracker |> canBlastOrSmash


canOpenStormGrotto : ItemTracker -> Bool
canOpenStormGrotto itemTracker =
    itemTracker |> canPlayTime


canUseProjectile : ItemTracker -> Bool
canUseProjectile itemTracker =
    (itemTracker |> hasExplosives)
        || (itemTracker |> hasSlingshot)
        || itemTracker.boomerang
        || ((itemTracker |> canBeAdult) && (itemTracker |> hasHookshot))


hasFireSource : ItemTracker -> Bool
hasFireSource itemTracker =
    (itemTracker |> canUseDinsFire) || (itemTracker |> canUseFireArrows)


hasFireSourceWithTorch : ItemTracker -> Bool
hasFireSourceWithTorch itemTracker =
    (itemTracker |> hasFireSource) || (itemTracker |> hasDekuSticks)


canFinishGerudoFortress : ItemTracker -> Bool
canFinishGerudoFortress itemTracker =
    (itemTracker.smallKeys.fortress >= 4)
        && ((itemTracker |> canBeAdult) || itemTracker.kokiriSword)
        && ((itemTracker |> canBeAdult)
                && ((itemTracker |> hasBow) || (itemTracker |> hasHookshot) || itemTracker.hoverBoots)
           )
        || itemTracker.gerudoMembership


canGetFromFarAway : ItemTracker -> Bool
canGetFromFarAway itemTracker =
    (itemTracker |> hasHookshot) || itemTracker.boomerang


hasHammer : ItemTracker -> Bool
hasHammer itemTracker =
    (itemTracker |> canBeAdult) && itemTracker.hammer


hasHoverBoots : ItemTracker -> Bool
hasHoverBoots itemTracker =
    (itemTracker |> canBeAdult) && itemTracker.hoverBoots
