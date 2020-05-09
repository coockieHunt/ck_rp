function RequestCreateCarAccount(targetId, id_car, color)
    local new_car = {
        target = targetId,
        id_car = id_car,
        color = color
    }
    
    CreateNewAccountCar(new_car)
end

function SaveNewCarAccount(new_car)
    local query = mariadb_prepare(db, _RequestSql.CreateNewAccountCar,
        tostring(GetPlayerSteamId(new_car.target)),
        new_car.id_car,
        new_car.plate,
        new_car.color
    )

    mariadb_query(db, query)
end

function SpawnCarAccount(targetId, car_id)
    local steam_id = tostring(GetPlayerSteamId(playerId))
    
    local p = getplayer(targetId)

    local query = mariadb_prepare(db, _RequestSql.GetAccountCar, p.id)


    mariadb_async_query(db, query, ResultGetAccountCar, playerId, car_id)
end

function ResultGetAccountCar(playerId, car_id)
    if mariadb_get_row_count() == 0 then
       retrun false
    else
        local count = mariadb_get_row_count()

        for i = 1, count do
            local result = mariadb_get_assoc(i)
            local x,y,z = GetPlayerLocation(playerId)
            
            if car_id == result['id'] then
                local car = CreateVehicle(result['car_id'], x , y - 300, z, 90.0)
                SetVehicleHealth(car, result['damage'])
                SetVehicleLicensePlate(car, result['plate'])
                SetVehicleColor(car, "0x"..result['color'])
                
                return true
            end
        end
    end

    return false
end