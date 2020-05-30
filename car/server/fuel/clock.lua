AddEvent("OnPackageStart", function()
    CreateTimer(function()
        for _,vehicle in pairs(GetAllVehicles()) do
            local engine_state = GetVehicleEngineState(vehicle)
            local velocity = GetVehicleVelocity(vehicle)
            local fuel = GetFuel(vehicle)

            local new_fuel = 0

            if engine_state then
                local decreases_fuel = _Vehicle.normal_decreases_fuel
                if math.abs(velocity) > _Vehicle.velocity_cap and GetVehicleDriver(vehicle) ~= false then
                    decreases_fuel = decreases_fuel + _Vehicle.velocity_decreases_fuel_add
                end
                new_fuel = fuel - decreases_fuel
                SetFuel(vehicle, fuel - decreases_fuel)
            end

            if new_fuel <= 0 then
                SetFuel(vehicle, 0)
                StopVehicleEngine(vehicle) 
            end
        end


    end, 20000)
end)


