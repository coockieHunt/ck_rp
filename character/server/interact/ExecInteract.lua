function ExecInteractAction(playerId, type, target, action)
    if type == 'vehicle' then
        if action == "upturn" then
            upturn_vehicle_nearest(target)
        end

        if action == "refuel" then
            UseItem(playerId, "fuel_can", 1)
        end

        if action == "light" then
            SetVehicleLightEnabled(target, not GetVehicleLightState(target))
        end

        if action == "repair" then
            UseItem(playerId, "repair_kit", 1)
        end
    end
end 
AddRemoteEvent("ExecInteractAction", ExecInteractAction)