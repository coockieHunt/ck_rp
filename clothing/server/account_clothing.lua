-- setup var
Clothing = {}

-- import package
local ClassClothing = import("character/class/clothing.lua")

function DecodeClothing(clothing_json)
    local decode = json_decode(clothing_json)
    local clot = {}
    local clotCol = {}

    local rslt = {}


    for k, v in pairs(decode["clothing"]) do
        local i = ClassClothing.new(
            {
                ["id"] = k,
                ["value"] = v,
            })
        
            table.insert(clot, i)
    end

    for k, v in pairs(decode["color"]) do
        local i = ClassClothing.new(
            {
                ["id"] = k,
                ["value"] = v,
            })
        
            table.insert(clotCol, i)
    end

    rslt['clothing'] = clot
    rslt['color'] = clotCol


    return rslt
end


function EncodeClothing(clothing_table)
    local valid_json_clothing = {}
    local valid_json_color = {}

    local rslt_json = {}

    for _, value in pairs(clothing_table['clothing']) do
        local id = value['id']
        local value = value['value']


        valid_json_clothing[id] = value
    end

    for _, value in pairs(clothing_table['color']) do
        local id = value['id']
        local value = value['value']


        valid_json_color[id] = value
    end

    rslt_json['color'] = valid_json_color
    rslt_json['clothing'] = valid_json_clothing
    
    return json_encode(rslt_json)
end


function SaveClothing(target, new_clothing)
    local new_clothing = EncodeClothing(new_clothing)
    local target = getplayer(target)

    target:setClothing(new_clothing)
end





