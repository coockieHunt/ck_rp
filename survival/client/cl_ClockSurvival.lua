function InitSurvivalTimer(timer)
    CreateTimer(function()
        CallRemoteEvent("decreaseSurvival", GetPlayerId())
    end, timer, GetPlayerId())
end
AddRemoteEvent("InitSurvivalTimer", InitSurvivalTimer)


