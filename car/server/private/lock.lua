function lock_unlock_vehicle_nearest(playerId)
    local car_nearest = GetNearestVehicles(
        playerId, 
        _Car.lock_unlock.distance_nearest
    )

    if car_nearest ~= false then
        local selected_car = GetClosetVehicle(car_nearest)
        local Alive = GetVehiclePropertyValue(selected_car, 'ALive')

        if selected_car ~= false and IsValidVehicle(selected_car) and Alive then
            local owner = json_decode(GetVehiclePropertyValue(selected_car, 'owner'))
            local p = getplayer(playerId)
    
            if has_value(owner, p.id) then
                lock_unlock_vehicle(selected_car, playerId)
            end
        end
    else
        return false
    end
end
AddRemoteEvent('lock_unlock_vehicle_nearest', lock_unlock_vehicle_nearest)

function lock_unlock_vehicle(selected_car, playerId)
    local locked = GetVehiclePropertyValue(selected_car, 'locked')
    local name =  GetNameVehicleByVar(GetVehicleModelName(selected_car))


    if locked then
        PlayVehicleLockSquance(selected_car)
        SetVehiclePropertyValue(selected_car, 'locked', false, true)
        SendAlert(playerId, 'warning', _('vehicle') , _('car_unlock', name))
        
    else
        PlayVehicleLockSquance(selected_car)
        SetVehiclePropertyValue(selected_car, 'locked', true, true)
        SendAlert(playerId, 'ok', _('vehicle') , _('car_lock', name))
    end

    if GetVehiclePropertyValue(selected_car, 'alarm') then
        StopAlarm(selected_car)
    end
end

function PlayVehicleLockSquance(vehicle_id)
    SetVehicleLightEnabled(vehicle_id, true)
    local x, y, z = GetVehicleLocation(vehicle_id)
    NewSoun3d('car_open'..vehicle_id, 'files_client/sound/car_lock.mp3', x, y, z,  _Car.lock_unlock.distance_sound, _Car.lock_unlock.volume, false)
    Delay(400, function()
        SetVehicleLightEnabled(vehicle_id, false)
	end)
end
