currentDayTime = _Day_cycle.start_at
currentStarsBrightness = _Day_cycle.stars_brightness
currentFogDensity = 0.0

function setCurrentDayTime(time)
    currentDayTime = time
    SyncClientEnvi()
end

function setStarsBrightness(brightness)
    currentStarsBrightness = brightness
    SyncClientEnvi()
end

function setFogDensity(FogDensity)
    currentFogDensity = FogDensity
    SyncClientEnvi()
end


function SyncClientEnvi()
    local count_player = tablelength(GetAllPlayers())
    if count_player > 0 then
        for _, player in pairs(GetAllPlayers()) do
            CallRemoteEvent(player, "setTimeClient", currentDayTime)
            CallRemoteEvent(player, "setStarsBrightClient", currentStarsBrightness)
            CallRemoteEvent(player, "setFogDensityClient", currentFogDensity)
        end
    end
end