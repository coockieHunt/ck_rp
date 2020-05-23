function SetOnTheRoad(car_id, bool)
    if bool then 
        bool = 1
    end

    if bool == false then
        bool = 0
    end

    local query = mariadb_prepare(db, _RequestSql.SetOnTheRoad, bool, car_id)

    mariadb_async_query(db, query)
end

function SetAllOnTheRoad(bool)
    if bool then 
        bool = 1
    end

    if bool == false then
        bool = 0
    end

    local query = mariadb_prepare(db, _RequestSql.SetAllOnTheRoad, bool)

    mariadb_async_query(db, query)
end