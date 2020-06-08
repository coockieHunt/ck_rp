function upturn_vehicle_nearest(vehicle)
    local v_heading = GetVehicleHeading(vehicle)
    local x, y, z = GetVehicleLocation(vehicle)
    
    SetVehicleRotation(vehicle, 0, 0, 0)
    SetVehicleLocation(vehicle,x, y , z + 200)
    SetVehicleHeading(vehicle, v_heading)
end


function upturn_vehicle(playerId, vehicle)
    local car_nearest = GetNearestVehicles(
        playerId, 
        1000
    )

    if car_nearest ~= false then
        local closet_vehicle = GetClosetVehicle(car_nearest)

        upturn_vehicle_nearest(closet_vehicle)
    end

end
AddCommand('fc', upturn_vehicle)



