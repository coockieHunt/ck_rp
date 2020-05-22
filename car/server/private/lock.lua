function lock_unlock_vehicle(playerId)
    local car_nearest = GetNearestVehicles(
        playerId, 
        _Lock_unlock.distance
    )

    if car_nearest ~= false then
        local selected_car = getVehicleCloset(car_nearest, max_dist)
        local Alive = GetVehiclePropertyValue(selected_car, 'ALive')

        if selected_car ~= false and IsValidVehicle(selected_car) and Alive then
            local owner = json_decode(GetVehiclePropertyValue(selected_car, 'owner'))
            local p = getplayer(playerId)
    
            if has_value(owner, p.id) then
                local locked = GetVehiclePropertyValue(selected_car, 'locked')
    
                if locked then
                    PlayVehicleLockSquance(playerId, selected_car)
                    SetVehiclePropertyValue(selected_car, 'locked', false, true)
                    SendAlert(playerId, 'warning', _('vehicle') , _('car_unlock', GetVehicleModelName(selected_car)))
                    
                else
                    PlayVehicleLockSquance(playerId, selected_car)
                    SetVehiclePropertyValue(selected_car, 'locked', true, true)
                    SendAlert(playerId, 'ok', _('vehicle') , _('car_lock', GetVehicleModelName(selected_car)))
                end

                if GetVehiclePropertyValue(selected_car, 'alarm') then
                    StopAlarm(selected_car)
                end
            end
        end
    else
        return false
    end
end
AddRemoteEvent('lock_unlock_vehicle', lock_unlock_vehicle)

function PlayVehicleLockSquance(playerId, vehicle_id)
    SetVehicleLightEnabled(vehicle_id, true)
    local x, y, z = GetVehicleLocation(vehicle_id)
    NewSoun3d('car_open', 'files_client/sound/car_lock.mp3', x, y, z,  _Lock_unlock.distance_sound, false)
    Delay(400, function()
        SetVehicleLightEnabled(vehicle_id, false)
	end)
end


function getVehicleCloset(vehicle_list)
    local car_distance = vehicle_list[1].dist
    local selected_car = vehicle_list[1].id

    if(tablelength(vehicle_list)) >= 1 then
        for _, data in pairs(vehicle_list) do
            if data.dist < car_distance then
                car_distance = data.dist 
                selected_car = data.id
            end
        end
    end

    if selected_car > 0 then
        return selected_car
    else
        return false
    end
end