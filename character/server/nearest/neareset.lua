-- VEHICLES
function GetNearestVehicles(playerId, MaxDist)
    local car = {}
    local rslt = false

    for _,v in pairs(GetStreamedVehiclesForPlayer(playerId)) do
        local x, y, z = GetPlayerLocation(playerId)
        local px, py, pz = GetVehicleLocation(v)

        local GetDistance3D = GetDistance3D(x, y, z, px, py, pz)
        
        if GetDistance3D < MaxDist then
            rslt = true
            table.insert(car, {['dist'] = GetDistance3D, ['id'] = v}) 
        end
    end

    if rslt then return car end

    return false
end

function GetClosetVehicle(vehicle_list)
    local car_distance = vehicle_list[1].dist
    local selected_car = vehicle_list[1].id

    if(tablelength(vehicle_list)) >= 1 then
        for _, data in pairs(vehicle_list) do
            if data.dist < car_distance then
                car_distance = data.dist 
                selected_car = data.id
            end
        end
    end

    if selected_car > 0 then
        return selected_car
    else
        return false
    end
end