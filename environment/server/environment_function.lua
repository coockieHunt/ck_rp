currentDayTime = _Day_cycle.start_at

function setCurrentDayTime(time)
    currentDayTime = time
    SyncClientEnvi()
end


function SyncClientEnvi()
    local count_player = tablelength(GetAllPlayers())
    if count_player > 0 then
        for _, player in pairs(GetAllPlayers()) do
            CallRemoteEvent(player, "setTimeClient", currentDayTime)
        end
    end
end