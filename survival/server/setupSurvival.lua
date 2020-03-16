-- Func
function decreaseSurvival(playerid)
        local p = getplayer(playerid)

        local food = p:getFood()
        local thirst = p:getThirst()

        p:setThirst(thirst - _Survival.decrease_thirst)
        p:setFood(food - _Survival.decrease_food)

        SetSUiurvival(playerid)
        setUiWarnSuvival(playerid)
end
AddRemoteEvent("decreaseSurvival", decreaseSurvival)