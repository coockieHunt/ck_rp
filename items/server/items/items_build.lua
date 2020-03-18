local ItemsData = {}
ItemsData.ClassItem = import("items/class/item.lua")

function OnPackageStart(player)
    for id, item in pairs(_Items) do
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
                ["thumbnail"] = item.thumbnail,
                ["type"] = item.type,
                ["hand_pos"] = item.hand_pos,
            })

        table.insert(ItemsData, i)       
    end
end
AddEvent("OnPackageStart", OnPackageStart)

function GetItemsList()
    return ItemsData
end