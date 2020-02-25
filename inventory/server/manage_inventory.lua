function AddPlayerItem(player, target, item_id, quantity)
    if(CheckIfValidItem(item_id) or isnil(target) or isnil(quantity)) then
        local decode_inventory = GetInventory(target)

        local cur_quantity = GetItemsQuantity(decode_inventory, item_id)

        if(cur_quantity ~= false) then
             quantity = quantity + cur_quantity
        end

        local new_item = {}
        new_item['id'] = item_id
        new_item['quantity'] = quantity

        table.insert(decode_inventory, new_item) 

        SaveInventory(target, decode_inventory)
    else
        print('invalid item or params')
    end
end

function RemovePlayerItem(player, target, item_id, quantity)
    if(CheckIfValidItem(item_id) or isnil(target) or isnil(quantity)) then
        local decode_inventory = GetInventory(target)
        local cur_quantity = GetItemsQuantity(decode_inventory, item_id)

        if(cur_quantity ~= false) then
            if(tonumber(quantity) >= 0) then
                quantity =  tonumber(cur_quantity) - tonumber(quantity)
            end

            if(quantity < 0) then
                quantity = 0
            end
        else
            quantity = 0
        end


        for i, v in pairs(decode_inventory) do
            local cur_id = v['id']
            local cur_quantity = v['quantity']
    
            if(cur_id == item_id) then
                if (tonumber(quantity) == 0) then
                    table.remove (decode_inventory, i)
                else
                    v['quantity'] = quantity
                end
            end
        end

        SaveInventory(target, decode_inventory)
    else
        print('invalid item or params')
    end
end