function StartAlarm(vehicle)
    SetVehiclePropertyValue(vehicle, "alarm", true, true)
    local x, y, z = GetVehicleLocation(vehicle)
    -- NewSoun3d('car_alarm', 'files_client/sound/car_alarm.mp3', x, y, z,  _Lock_unlock.distance_sound, true)
    NewSoun3d('car_alarm'..vehicle, 'files_client/sound/car_alarm.mp3', x, y, z,  _Lock_unlock.distance_sound, 1.0, true)
    
    PlayVehicleAlarmSequance(vehicle)
end

function StopAlarm(vehicle)
    SetVehiclePropertyValue(vehicle, "alarm", false, true)
    DestroySound3d('car_alarm'..vehicle)
end

function PlayVehicleAlarmSequance(vehicle)
    if GetVehiclePropertyValue(vehicle, "alarm") then

        Delay(1000, function()
            SetVehicleLightEnabled(vehicle, true)
        end)
        
        Delay(2000, function()
            SetVehicleLightEnabled(vehicle, false)
            PlayVehicleAlarmSequance(vehicle)
        end)
    end
end