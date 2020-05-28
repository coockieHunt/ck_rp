AddEvent("OnGameTick", function(DeltaSeconds)
    local playerId = GetPlayerId()
    local vehicleId = GetPlayerVehicle(playerId)

    if vehicleId ~= 0 then
        local speed = math.tointeger(math.floor(GetVehicleForwardSpeed(vehicleId)))
        CallRemoteEvent("RefreshVehicleUi", speed)
    end
end)