function AddFood(playerId, amt)
    local player = getplayer(playerId)

    local food = player:getFood()

    local newFood = food + amt

    if newFood > 100 then
        newFood = 100
    end

    player:setFood(newFood)
end