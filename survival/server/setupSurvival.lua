function OnPlayerSpawn(playerid)
    CallRemoteEvent(playerid, "initSurivaval", _Account_timer.decrease_survival_timer)
    
end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)

function initSurivaval(playerid)
        local p = getplayer(playerid)

        local food = p:getFood()
        local thirst = p:getThirst()

        p:setThirst(thirst - _Survival.decrease_thirst)
        p:setFood(food - _Survival.decrease_food)

        RefrechSurvivalData(playerid)
        CallRemoteEvent(playerid, "setSurivalWarning", food, thirst)
end
AddRemoteEvent("initSurivaval", initSurivaval)

function OnPlayerDamage(playerid)
    RefrechPlayerData(playerid)
 end
 AddEvent("OnPlayerDamage", OnPlayerDamage)
 
function GetPlayerData(playerid)
    RefrechSurvivalData(playerid)
    RefrechPlayerData(playerid)
 end
 AddRemoteEvent("GetPlayerData", GetPlayerData)

