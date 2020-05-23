AddEvent("OnPlayerStartEnterVehicle", function(vehicleId, seatId)
    local locked = GetVehiclePropertyValue(vehicleId, 'locked')
    local ALive = GetVehiclePropertyValue(vehicleId, 'ALive')

    if locked or ALive == false then
        return false
    else
        CallRemoteEvent('OnEnterVehicle',vehicleId, seatId)
        return true
    end
end)