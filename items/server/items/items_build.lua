local ItemsData = {}
ItemsData.ClassItem = import("items/class/item.lua")

local item_key = {
    ["name"] = "string",
    ["description"] = "string",
    ["model"] = "number",
    ["weight"] = "number",
    ["health"] = "number",
    ["thirst"] = "number",
    ["food"] = "number",
    ["usable"] = "string",
    ["thumbnail"] = "string",
    ["type"] = "string",
    ["hand_pos"] = "table"
}

function OnPackageStart(player)
    print("> Loading items ...")

    for id, item in pairs(_Items) do
        ValidateItemsConfig(item)

        if(item.model == 0) then item.model = _Default_model end
        local i = ItemsData.ClassItem.new(
            {
                ["id"] = id,
                ["name"] = item.name,
                ["descrip"] = item.description,
                ["model"] = item.model,
                ["weight"] = item.weight,
                ["usable"] = item.usable,
                ["thirst"] = item.thirst,
                ["food"] = item.food,
                ["health"] = item.health,
                ["thumbnail"] = item.thumbnail,
                ["type"] = item.type,
                ["hand_pos"] = item.hand_pos,
            })

        table.insert(ItemsData, i)       
    end

    print("> Successfully "..tablelength(ItemsData).." items loaded")
end
AddEvent("OnPackageStart", OnPackageStart)

function ValidateItemsConfig(item)
    for k, v in pairs(item_key) do
        if(item[k] == nil) then
            ServerExit("Error build item ["..item.name..", "..k.." invalide type nill] (EC 004)")
        end
        
        if(v == 'string') then
            local type = type(item[k])
            if(type ~= "string") then
                ServerExit("Error build item ["..item.name..", "..k.." invalide type like string] (EC 005)")
            end
        end
    
        if(v == 'number') then
            local type = type(item[k])
            if(type ~= "number") then
                ServerExit("Error build item ["..item.name..", "..k.." invalide type like number] (EC 005)")
            end
        end
    
        if(v == 'table') then
            local type = type(item[k])
            if(type ~= "table") then
                ServerExit("Error build item ["..item.name..", "..k.." invalide type like table] (EC 005)")
            end
        end
    end
end

function GetItemsList()
    return ItemsData
end