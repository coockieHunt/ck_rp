function RequestCreateCarAccount(targetId, car_id, color, fuel, upgrade)
    local new_car = {
        target = targetId,
        id_car = car_id,
        color = color,
        fuel = fuel,
        upgrade = upgrade
    }
    
    CreateNewAccountCar(new_car)
end

function SaveNewCarAccount(new_car)
    -- to table
    local pro = {new_car.target}
    new_car.target = json_encode(pro)


    -- if color nil FIX
    if isnil(new_car.color) then new_car.color = 'none' end

    local query = mariadb_prepare(db, _RequestSql.CreateNewAccountCar,
        new_car.target,
        new_car.id_car,
        new_car.plate,
        new_car.color,
        new_car.fuel,
        json_encode(new_car.upgrade),
        0
    )

    mariadb_query(db, query)
end

