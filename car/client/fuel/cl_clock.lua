AddEvent("OnGameTick", function(DeltaSeconds)
    local playerId = GetPlayerId()
    local vehicleId = GetPlayerVehicle(playerId)

    if vehicleId ~= 0 then
        CallRemoteEvent("RefreshVehicleUi")
    end
end)