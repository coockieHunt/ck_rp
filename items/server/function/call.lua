function CallPlayerDropItem(playerId, item_id, quantity)
    local item_object = _itemsList[item_id]
    item_object:OnDrop(playerId, quantity)
end
AddRemoteEvent('CallPlayerDropItem', CallPlayerDropItem)

function CallPlayerUse(playerId, item_id)
    local p = getplayer(playerId)
    local use = false

    local item_object = _itemsList[item_id]

    if isnil(p.coolDown_item[item_id]) then
        use = item_object:OnUse(playerId, quantity)

        if use then

            if not item_object.cooldown then return false end

            local coolDown = item_object.cooldown.time_cooldown
            local TimeUse = item_object.cooldown.time_use
    
            CeateProgressBar(playerId, TimeUse)
            FreezePlayerInput(playerId, true)

            Delay(TimeUse, function()
                FreezePlayerInput(playerId, false)
            end)
    
            local timerItems = CreateTimer(function() end, coolDown + TimeUse)

            p.coolDown_item[item_id] = {timer = timerItems}

            Delay(coolDown + TimeUse + 1, function()
                DestroyTimer(p.coolDown_item[item_id].timer)
                p.coolDown_item[item_id] = nil
                FreezePlayerInput(playerId, false)
            end)
        end

    else
        local reaming_time_seconde = GetTimerRemainingTime(p.coolDown_item[item_id].timer) / 1000
        SendAlert(playerId, 'warning', 'item', _("remaing_time_action", round(reaming_time_seconde), 2))
        return false
    end

    if isnil(use) then use = false end

    if not use then
        SendAlert(playerId, 'warning', 'item', _("not_use_item", item_object.name))
    end

    CloseDialogClient(playerId, 'interact')    

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


