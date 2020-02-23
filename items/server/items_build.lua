local ItemsData = {}
ItemsData.ClassItem = import("items/class/item.lua")

function OnPackageStart(player)
    for id, item in pairs(_Items) do
        local i = ItemsData.ClassItem.new(
            {
                ["id"] = id,
                ["name"] = item.name,
                ["model"] = item.model,
                ["size"] = item.size,
                ["usable"] = item.usable,
                ["thumbnail"] = item.thumbnail,
                ["type"] = item.type,
            })

        table.insert(ItemsData, i)       
    end
end
AddEvent("OnPackageStart", OnPackageStart)

function GetItemsList()
    return ItemsData
end