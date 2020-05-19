-- Func
function decreaseSurvival(playerId)
    local p = getplayer(playerId)

    local food = p:getFood()
    local thirst = p:getThirst()

    local new_food = food - _Survival.decrease_food
    local new_thirst = thirst - _Survival.decrease_thirst

    if new_food > 0 then SetAccountFood(playerId, new_food) end
    if new_thirst > 0 then SetAccountThirst(playerId, new_thirst) end

    RefrechWarningSurvivalUi(playerId)
    RefrechSurvivalIventoryUi(playerId)
end
AddRemoteEvent("decreaseSurvival", decreaseSurvival)

function OnPlayerSpawn(playerId)
     CallRemoteEvent(playerId, "InitSurvivalTimer", _Account_timer.decrease_survival_timer)
end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)