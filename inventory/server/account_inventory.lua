-- setup var
Inventory = {}

-- import package
Inventory.ClassIventory = import("inventory/class/inventory.lua")

function DecodeInventoy(inventory_json)
    local decode = json_decode(inventory_json)
    local inv = {}

    for id, quantity in pairs(decode) do
        if(CheckIfValidItem(id)) then

            local i = Inventory.ClassIventory.new(
            {
                ["id"] = id,
                ["quantity"] = quantity,
            })
        
            table.insert(inv, i)
            
        else    
            return false
        end
    end

    return inv
end

function EncodeInventory(inventory_table)
    local valid_json = {}


    for _, value in pairs(inventory_table) do
        local id = value['id']
        local quantity = value['quantity']


        if(CheckIfValidItem(id)) then
            valid_json[id] = quantity
        else
            return false
        end
    end
    

    return json_encode(valid_json)
end

function GetItemsQuantity(inventory, item_id)
    for key, value in pairs(inventory) do
        local id_loop = value.id
        local quantity_loop = value.quantity

        if(item_id == id_loop) then
            return quantity_loop
        end
     end

     return false
end

function SaveInventory(target, new_inventory)
    local new_inventory = EncodeInventory(new_inventory)
    local target = getplayer(target)

    target:setInventory(new_inventory)
end

function GetInventory(target)
    local target = getplayer(target)

    return DecodeInventoy(target:getInventory())
end

function GetInventoryMaxWeight(target)
    local target = getplayer(target)

    return target:getMaxWeight()
end


function CalculateInvWeight(target)
    local decode_inventory = GetInventory(target)

    local cur_weight = 0

    for i, v in pairs(decode_inventory) do
        local cur_id = v['id']
        local cur_quantity = v['quantity']
        local item_weight = GetItemWeightById(cur_id)


        local add = cur_quantity * item_weight

        cur_weight = cur_weight + add
    end
    return cur_weight
end
