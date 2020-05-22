AddEvent("OnPlayerStartEnterVehicle", function(vehicleId, seatId)
    local locked = GetVehiclePropertyValue(vehicleId, 'locked')

    if locked then
        return false
    else
        CallRemoteEvent('OnEnterVehicle',vehicleId, seatId)
        return true
    end
end)