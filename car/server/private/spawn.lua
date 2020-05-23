function SpawnCarAccount(targetId, car_id)
    local p = getplayer(targetId)

    local query = mariadb_prepare(db, _RequestSql.GetAccountCar, '%"'..p.id..'"%', car_id)

    mariadb_async_query(db, query, ResultGetAccountCar, targetId, car_id)
end

function ResultGetAccountCar(targetId)
    local count_row = mariadb_get_row_count()
    
    if count_row == 0 then
       return false
    else
        local result = mariadb_get_assoc(1)
        local x,y,z = GetPlayerLocation(targetId)
        local car = CreateVehicle(result['car_id'], x , y - 300, z, 90.0)
        SetVehicleHealth(car, result['damage'])
        SetVehicleLicensePlate(car, result['plate'])
        SetVehicleColor(car, "0x"..result['color'])


        setupVehicule(car, true, result['account_id'], result['id'])
        return true
    end
end