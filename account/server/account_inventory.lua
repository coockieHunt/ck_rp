local ItemData = {}
ItemData.ClassItem = import("account/class/item.lua")

function OnPackageStart(player)
    for k, v in pairs(_Item) do
        local i = ItemData.ClassItem.new(
            {
                ["id"] = k,
                ["name"] = _Item.name,
                ["model"] = _Item.model,
                ["size"] = _Item.size,
                ["usable"] = _Item.usable,
                ["thumbnail"] = _Item.thumbnail,
            })

        table.insert(ItemData, i)       
    end

    for key, value in pairs(ItemData) do
        print(key)   
        print(value.id)   
    end
end
AddEvent("OnPackageStart", OnPackageStart)