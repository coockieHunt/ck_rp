function CallPlayerDropItem(playerId, item_id, quantity)
    local item_object = _itemsList[item_id]
    item_object:OnDrop(playerId, quantity)
end
AddRemoteEvent('CallPlayerDropItem', CallPlayerDropItem)

function CallPlayerUse(playerId, item_id)
    local p = getplayer(playerId)
    local use = false

    local used = true

    local item_object = _itemsList[item_id]

    local item_info = getItemInfo(item_id)

    if isnil(p.coolDown_item[item_id]) then
        use = item_object:OnUse(playerId, quantity)
        if use ~= false then
            if not item_object.cooldown then return false end

            local coolDown = item_object.cooldown.time_cooldown
            local TimeUse = item_object.cooldown.time_use
    
            CeateProgressBar(playerId, "use : (" .. item_info.name .. ')', TimeUse)
    
            local timerItems = CreateTimer(function() 
            end, coolDown + TimeUse)

            local timer_mouvement = CreateTimer(function()
                if GetPlayerMovementMode(playerId) ~= 0 then
                    used = false
                    SendAlert(playerId, 'error', 'item', _("action_canceled"))
                    DeleteProgessBar(playerId)
                    DestroyTimer(p.coolDown_item[item_id].timer_mouvement)
                    p.coolDown_item[item_id] = nil
                end
            end, 100)

            p.coolDown_item[item_id] = {timer = timerItems, timer_mouvement = timer_mouvement}


            Delay(TimeUse, function()
                if not isnil(p.coolDown_item[item_id]) then 
                    DestroyTimer(p.coolDown_item[item_id].timer_mouvement)
                    if used then 
                        item_object:OnUsed(playerId, quantity, use)
                    end
                end
            end)

            Delay(coolDown + TimeUse + 1, function()
                if not isnil(p.coolDown_item[item_id]) then 
                    DestroyTimer(p.coolDown_item[item_id].timer)
                    p.coolDown_item[item_id] = nil
                end
            end)
        end

    else
        local reaming_time_seconde = GetTimerRemainingTime(p.coolDown_item[item_id].timer) / 1000
        SendAlert(playerId, 'warning', 'item', _("remaing_time_action", item_info.name, round(reaming_time_seconde)))
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


