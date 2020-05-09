function CreateNewAccountCar(new_car)
    new_car.plate = GeneratePlate()

    local query = mariadb_prepare(db, _RequestSql.IfCarExistLicensePlate, new_car.plate)
    mariadb_async_query(db, query, resultplate, new_car)
end

function resultplate(new_car)
    if mariadb_get_row_count() == 0 then
        SaveNewCarAccount(new_car)
    else
        CreateNewAccountCar(new_car)
    end
end

function GeneratePlate()
    local start_plate = "FR"
    local end_plate = "EU"
    local plate = tostring(start_plate .. "-" .. Random(100, 999) .. "-" .. end_plate)

    return plate
end
