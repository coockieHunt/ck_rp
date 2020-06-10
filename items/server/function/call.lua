function CallPlayerDropItem(playerId, item_id, quantity)
    local item_object = _itemsList[item_id]
    item_object:OnDrop(playerId, quantity)
end
AddRemoteEvent('CallPlayerDropItem', CallPlayerDropItem)

function CallPlayerUse(playerId, item_id)
    print(item_id)
    local item_object = _itemsList[item_id]

    local use = item_object:OnUse(playerId, quantity)
    
    if isnil(use) then use = false end
    if not use then
        SendAlert(playerId, 'warning', 'item', _("not_use_item", item_object.name))
    end
    return use
end
AddRemoteEvent('CallPlayerUse', CallPlayerUse)


function CallOnPlayerSpawnItem(playerId)
    local p = getplayer(playerId)
    local inventory = p.inventory

    for item,d in pairs(DecodeInventory(inventory)) do
        local item_object = _itemsList[item]

        item_object:OnPlayerSpawn(playerId)
    end
end


function CallOnPlayerDeath(playerId, instigator)
    local p = getplayer(playerId)
    local inventory = p.inventory

    for item,d in pairs(DecodeInventory(inventory)) do
        local item_object = _itemsList[item]

        item_object:OnPlayerDeath(playerId, instigator)
    end
end
AddEvent("OnPlayerDeath", CallOnPlayerDeath)


