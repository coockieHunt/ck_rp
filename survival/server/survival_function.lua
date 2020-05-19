function SetAccountFood(playerId, amount)
    local player = getplayer(playerId)
    local food = tonumber(player:getFood())

    amount = checkRange(amount)

    player:setFood(amount)
end

function SetAccountThirst(playerId, amount)
    local player = getplayer(playerId)
    local thirst = tonumber(player:getThirst())

    amount = checkRange(amount)

    player:setThirst(amount)
end

function checkRange(number)
    if number > 100 then number = 100 end
    if number < 0 then number = 0 end

    return number
end