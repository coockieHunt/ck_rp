local action_list = {}

function AddRegisterActionTime(playerId, name, action, time, cool_down)
    action_list[action] = {time = time, cool_down = cool_down}
end

function ExecInteractAction(playerId, type, target, action)
    local time = action_list[action].time
    local cool_down = action_list[action].cool_down

    local p = getplayer(playerId)
    local cool_down_player = p.coolDown_interact

    if isnil(cool_down_player[action]) then
        FreezePlayerInput(playerId, true)
        CeateProgressBar(playerId, time)

        local cd_delay = CreateTimer(function() end, time + cool_down)

        cool_down_player[action] = {total_time = time + cool_down, delay = cd_delay}

        Delay(time + cool_down + 10, function()
            DestroyTimer(cool_down_player[action].delay)
            cool_down_player[action] = nil
        end)


        Delay(time, function(player)
            FreezePlayerInput(playerId, false)
    
            if type == 'vehicle' then
                if action == "upturn" then
                    upturn_vehicle_nearest(target)
                end
        
                if action == "refuel" then
                    UseItem(playerId, "fuel_can", 1)
                end
        
                if action == "light" then
                    SetVehicleLightEnabled(target, not GetVehicleLightState(target))
                end
        
                if action == "repair" then
                    SetVehicleHealth(target, GetVehicleHealth(target) + 200)
                    RemovePlayerItem(playerId, "repair_kit", 1)
                end
            end
        end)
    else
        local reaming_seconde = GetTimerRemainingTime(cool_down_player[action].delay) / 1000
        local alert =  _("remaing_time_action",  reaming_seconde )
        SendAlert(playerId, 'warning', 'interact', alert)
    end
end 
AddRemoteEvent("ExecInteractAction", ExecInteractAction)