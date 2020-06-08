function OnEnterVehicle(playerId, vehicleId, seatId, enter)
    if not enter then
        local x,y,z = GetVehicleLocation(vehicleId)
        NewSoun3d('car_locked'..vehicleId, 'files_client/sound/car_locked.mp3', x, y, z,  _Car.locked.distance_sound, _Car.locked.volume, false)
    end 
    if GetVehiclePropertyValue(vehicleId, 'alarm') then
        StopAlarm(vehicleId)
    end
end
AddRemoteEvent('OnEnterVehicle', OnEnterVehicle)
