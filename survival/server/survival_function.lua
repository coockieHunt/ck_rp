function ManageFood(playerId, negativ, amt)
    local player = getplayer(playerId)

    local food = tonumber(player:getFood())
    local newFood

    if negativ then
        newFood = food - string.match (amt, "%d+")
    else
        newFood = food + string.match (amt, "%d+")
    end

    if newFood > 100 then newFood = 100 end
    if newFood < 0 then newFood = 0 end

    player:setFood(newFood)
end


function ManageThirst(playerId, negativ, amt)
    local player = getplayer(playerId)

    local thirst = tonumber(player:getThirst())

    local newThirst

    if negativ then
        newThirst = thirst - string.match (amt, "%d+")
    else
        newThirst = thirst + string.match (amt, "%d+")
    end

    if newThirst > 100 then newThirst = 100 end
    if newThirst < 0 then newThirst = 0 end

    player:setThirst(newThirst)
end

function ManageHealth(playerId, negativ, amt)
    local player = getplayer(playerId)

    local health = tonumber(player:getHealth())

    local newHealth

    if negativ then
        newHealth = health - string.match (amt, "%d+")
    else
        newHealth = health + string.match (amt, "%d+")
    end

    if newHealth > 100 then newHealth = 100 end
    if newHealth < 0 then newHealth = 0 end

    player:setHealth(newHealth)
end