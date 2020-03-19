function ManageFood(playerId, negativ, amt)
    local player = getplayer(playerId)

    local food = tonumber(player:getFood())
    local newFood

    if negativ then
        newFood = food - string.match (amt, "%d+")
    else
        newFood = food + string.match (amt, "%d+")
    end

    if newFood > 100 then
        newFood = 100
    end

    player:setFood(newFood)
end


function ManageThirst(playerId, negativ, amt)
    local player = getplayer(playerId)

    local thirst = tonumber(player:getThirst())

    local newThirst

    if negativ then
        print('rf')
        newThirst = thirst - string.match (amt, "%d+")
    else
        newThirst = thirst + string.match (amt, "%d+")
    end

    if newThirst > 100 then
        newThirst = 100
    end

    player:setThirst(newThirst)
end