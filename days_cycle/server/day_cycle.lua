local currentDayTime = _Day_cycle.start_at
local refrech = _Day_cycle.refrech_time

AddEvent("OnPackageStart",function()
    day_cycle = CreateTimer(function(vehicle)
        local cycle_status = GetDayOrNigth(currentDayTime)
       
        local multiply = _Day_cycle.multiply[cycle_status]
        local step = _Day_cycle.step_by_refrech

        if multiply > 0 then step = step * multiply end

        currentDayTime = currentDayTime + step

        if(currentDayTime > 24) then currentDayTime = 0 end

        SyncClientTime(time)
    end, refrech, vehicle)
end)

function OnPlayerJoin(player)
    CallRemoteEvent(player, "setTimeClient", currentDayTime)
end
AddEvent("OnPlayerJoin", OnPlayerJoin)

function SyncClientTime(time)
    local count_player = tablelength(GetAllPlayers())
    if count_player > 0 then
        for _, player in pairs(GetAllPlayers()) do
            CallRemoteEvent(player, "setTimeClient", currentDayTime)
        end
    end
end

function GetDayOrNigth(time)
    time = math.floor(time)
    local current = "day"

    if time > 18 or time < 6 then thencurrent = "night" end
    return current
end

function setCurrentDayTime(time)
    currentDayTime = time
    SyncClientTime(time)
end



