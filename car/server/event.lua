AddEvent("OnVehicleDamage", function(vehicle, healthDamage, damageIndex, damageAmount)
    local healt_car = GetVehicleHealth(vehicle)
    print("id : " .. vehicle .. " healt : " .. healt_car)

    local ALive = GetVehiclePropertyValue(vehicle, "ALive")

    if healt_car <= 0 and ALive == true then
        local driver = GetVehicleDriver(vehicle)
        local seats = GetVehicleNumberOfSeats(vehicle)

        for id_seat = 1, seats do
            local playerSeat = GetVehiclePassenger(vehicle, id_seat)

            if playerSeat ~= 0 then SetPlayerHealth(playerSeat, 0) end
        end

        if driver ~= 0 then SetPlayerHealth(driver, 0) end

        local x,y,z = GetVehicleLocation(vehicle)
        SetVehiclePropertyValue(vehicle, "ALive", false, true)
        SetVehicleLinearVelocity(vehicle, 250.0, 0.0, 0.0, true)
        CreateExplosion(10, x,y,z, true, 1500.0, 600.0)
    end
end)