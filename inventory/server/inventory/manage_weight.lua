function CheckIfWeightToHeavy(max_weight, inventory)
    local total_weight = 0 

    for var, quantity in pairs(inventory) do
        local item_info = getItemInfo(var)

        local add = tonumber(item_info.weight) * tonumber(quantity)
        total_weight = total_weight + add
    end


    if total_weight >= 0 then
        if tonumber(total_weight) <= tonumber(max_weight) then
            return {true, total_weight}
        else
            return {false, math.floor(total_weight - max_weight)}
        end
    else
        return false
    end
end


function SaveHeightInventory(playerId, new_weight)
    local p = getplayer(playerId)
    p:setCurWeight(new_weight)
end
