function initSurivaval(timer)
    CreateTimer(function()
        CallRemoteEvent("initSurivaval", GetPlayerId())
    end, timer, GetPlayerId())
end
AddRemoteEvent("initSurivaval", initSurivaval)


