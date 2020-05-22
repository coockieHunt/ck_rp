function OnEnterVehicle(vehicleId, seatId)
    if GetVehiclePropertyValue(vehicleId, 'alarm') then
        StopAlarm(vehicleId)
    end
end
AddRemoteEvent('OnEnterVehicle', OnEnterVehicle)
