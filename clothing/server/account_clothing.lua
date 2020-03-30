-- setup var
Clothing = {}

-- import package
Clothing.ClassClothing = import("character/class/clothing.lua")

function DecodeClothing(clothing_json)
    local decode = json_decode(clothing_json)
    local clot = {}

    for k, v in pairs(decode) do
        local i = Clothing.ClassClothing.new(
            {
                ["id"] = k,
                ["value"] = v,
            })
        
            table.insert(clot, i)
    end

    return clot
end


function EncodeClothing(clothing_table)
    local valid_json = {}

    for _, value in pairs(clothing_table) do
        local id = value['id']
        local value = value['value']


        valid_json[id] = value
    end
    

    return json_encode(valid_json)
end


function SaveClothing(target, new_clothing)
    local new_clothing = EncodeClothing(new_clothing)
    local target = getplayer(target)

    target:setClothing(new_clothing)
end





