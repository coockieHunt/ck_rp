AddEvent("OnPlayerStartEnterVehicle", function(vehicleId, seatId)
    local locked = GetVehiclePropertyValue(vehicleId, 'locked')

    if locked then
        return false
    else
        return true
    end
end)