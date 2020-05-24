function store_car(car_id)
    if IsValidVehicle(car_id) then
        if GetVehiclePropertyValue(car_id, 'owner') ~= '[]' then
            local query = mariadb_prepare(db, _RequestSql.StoreCar, 
            GetVehiclePropertyValue(car_id, 'owner'), 
            GetVehicleHealth(car_id), 
            GetVehicleLicensePlate(car_id), 
            tohex(GetVehicleColor(car_id)), 
            GetVehiclePropertyValue(car_id, 'upgrade'), 
                GetVehiclePropertyValue(car_id, 'db_id')
            )

            mariadb_async_query(db, query)

            SetOnTheRoad(GetVehiclePropertyValue(car_id, 'db_id'), false)

            DestroyVehicle(car_id)
            return true

        else
            return false
        end
        return false
    end
end
