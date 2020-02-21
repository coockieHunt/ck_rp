-- setup var
Inventory = {}

-- import package
Inventory.ClassIventory = import("account/class/inventory.lua")


function BuildInventroy(inv)
    local decode = json_decode(inv)
    local inv = {}

    for id, quantity in pairs(decode) do
        if(CheckIfValidItem(id)) then
            local i = Inventory.ClassIventory.new(
                {
                    ["id"] = id,
                    ["quantity"] = quantity,
                })
        
                table.insert(inv, i) 
        end
    end

    return inv
end