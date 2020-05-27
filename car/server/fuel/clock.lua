AddEvent("OnPackageStart", function()
    CreateTimer(function()
        for _,vehicle in pairs(GetAllVehicles()) do
            local engine_state = GetVehicleEngineState(vehicle)
            local velocity = GetVehicleVelocity(vehicle)
            local fuel = GetFuel(vehicle)

            if fuel == 0 then 
                StopVehicleEngine(vehicle) 
            end

            if engine_state then
                local decreases_fuel = _Vehicle.normal_decreases_fuel
                if math.abs(velocity) > _Vehicle.velocity_cap and GetVehicleDriver(vehicle) ~= false then
                    decreases_fuel = decreases_fuel + _Vehicle.velocity_decreases_fuel_add
                end
                SetFuel(vehicle, fuel - decreases_fuel)
                print('id : ' .. vehicle .. ' | fuel : ' .. fuel .. ' | velocity : ' .. velocity .. ' | decreases fuel : ' .. decreases_fuel)
            end
        end
    end, 20000)
end)