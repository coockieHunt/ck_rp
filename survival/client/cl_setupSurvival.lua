function initSurivaval(timer)
    reateTimer(function()
        CallRemoteEvent("initSurivaval", GetPlayerId())
    end, timer, playerid)
end
AddRemoteEvent("initSurivaval", initSurivaval)


