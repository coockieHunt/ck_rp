local ItemData = {}
ItemData.ClassItem = import("items/class/item.lua")

function OnPackageStart(player)
    for id, item in pairs(_Items) do
        local i = ItemData.ClassItem.new(
            {
                ["id"] = id,
                ["name"] = item.name,
                ["model"] = item.model,
                ["size"] = item.size,
                ["usable"] = item.usable,
                ["thumbnail"] = item.thumbnail,
            })

        table.insert(ItemData, i)       
    end

    for key, value in pairs(ItemData) do
        print(key)   
        print(value.name)   
    end
end
AddEvent("OnPackageStart", OnPackageStart)