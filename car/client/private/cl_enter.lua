AddEvent("OnPlayerStartEnterVehicle", function(vehicleId, seatId)
    local locked = GetVehiclePropertyValue(vehicleId, 'locked')
    local ALive = GetVehiclePropertyValue(vehicleId, 'ALive')

    if locked or ALive == false then
        CallRemoteEvent('OnEnterVehicle',vehicleId, seatId, false)
        return false
    else
        CallRemoteEvent('OnEnterVehicle',vehicleId, seatId, true)
        return true
    end
end)