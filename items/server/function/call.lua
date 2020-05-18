function CallPlayerDropItem(playerId, item_id, quantity)
    local item_object = _itemsList[item_id]

    item_object:OnDrop(playerId, quantity)

end
AddRemoteEvent('CallPlayerDropItem', CallPlayerDropItem)

function CallPlayerUse(playerId, item_id)
    local item_object = _itemsList[item_id]

    item_object:OnUse(playerId, quantity)
end
AddRemoteEvent('CallPlayerUse', CallPlayerUse)

function OnPlayerDeath(playerId, instigator)
    local p = getplayer(playerId)
    local inventory = p.inventory

    for item,d in pairs(DecodeInventory(inventory)) do
        local item_object = _itemsList[item]

        item_object:OnPlayerDeath(playerId, instigator)
    end
end
AddEvent("OnPlayerDeath", OnPlayerDeath)
