-- setup var
Clothing = {}

-- import package
Clothing.ClassClothing = import("character/class/clothing.lua")

-- {kind : "female","body": "none", "hair": "none", "shirt": "none", "accessory": "none", "pants": "none","shoes": "none" }

function tdi(pi)
    local p = getplayer(pi)

    local decode = DecodeClothing(p.clothing)


    local kind
    for k, v in pairs(decode) do
        if v.id == "kind" then
            kind = v.value
        end
    end

    for k, v in pairs(decode) do
        if v.id ~= "kind" then
            setClothing(pi, kind, v.id, v.value)
        end
    end
end
AddCommand("tdi", tdi)

function tce(pi)
    local p = getplayer(pi)

    local decode = DecodeClothing(p.clothing)


   print(EncodeClothing(decode))
end
AddCommand("tce", tce)


function setClothing(player, kind, skeletonMeches, id)
    local list

    if kind == "female" then
        list = _Clothing_women[skeletonMeches] 
    else
        list = _Clothing_men[skeletonMeches] 
    end

    if(id ~= "none") then
        local slct = list[tonumber(id)]
        CallRemoteEvent(player, "setSkeletalMesh", skeletonMeches, slct['dir'])
    else
        CallRemoteEvent(player, "removeSkeletalMesh", skeletonMeches)
    end
end

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
