function GetItemsQuantity(inventory, item_id)
    for key, value in pairs(inventory) do
        local id_loop = value.id
        local quantity_loop = value.quantity

        if(item_id == id_loop) then
            return tonumber(quantity_loop)
        end
     end

     return 0
end

function IfAccountOwnItem(player, item_id)
    local p = getplayer(player)
    local inventory = DecodeInventoy(p:getInventory())
    for key, value in pairs(inventory) do
        local id_loop = value.id

        if(item_id == id_loop) then
            return true
        end
     end

     return false
end

function GetInventory(target)
    local target = getplayer(target)

    return DecodeInventoy(target:getInventory())
end

function GetInventoryMaxWeight(target)
    local target = getplayer(target)

    return tonumber(target:getMaxWeight())
end

function CalculateInvWeight(target)
    local decode_inventory = GetInventory(target)

    local cur_weight = 0

    for i, v in pairs(decode_inventory) do
        local cur_id = v['id']
        local cur_quantity = v['quantity']

        local add = GetInventoryItemWeight(cur_id, cur_quantity)

        cur_weight = cur_weight + add
    end

    return math.floor(cur_weight)
end

function GetInventoryItemWeight(item_id, quantity)
    local item_weight = GetItemWeightById(item_id)

    return quantity * item_weight
end