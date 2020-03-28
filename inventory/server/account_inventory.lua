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

function SaveInventory(target, new_inventory, weight)
    local new_inventory = EncodeInventory(new_inventory)
    local target = getplayer(target)

    target:setInventory(new_inventory)
    target:setCurWeight(weight)
end