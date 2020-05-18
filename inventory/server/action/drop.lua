function drop_item(playerId, item_var, quantity)
    local x, y, z = GetPlayerLocation(playerId)
    local Vx, Vy, Vz = GetPlayerForward(playerId)

    local item_info = getItemInfo(item_var)
    local p = getplayer(playerId)

    if item_info == false then return false end
    if IfInventorContainsItem(p.inventory, item_var, quantity) ~= false then return false end

    RemovePlayerItem(playerId, item_var, quantity)
    SetPlayerAnimation(playerId, _Drop_animation.animation_id)

    Delay(_Gather_animation.atach_time, function()
        local name = item_info.name
        local model = item_info.model
        local pickup = CreatePickup(model, x + (Vx * 200), y + (Vy * 100), z - 50)
        local ItemText = CreateText3D(name ..' - ('..quantity..')', 18,  x + (Vx * 200), y + (Vy * 100), z + 20, 0,0,0)
        
        AddItemPickUpList(playerId, pickup, ItemText, quantity, item_var)
    end)
    
end

function AddItemPickUpList(player, pickup, ItemText, quantity, item_id)
    SetPickupPropertyValue(pickup, "type", "droped_item")

    SetPickupPropertyValue(pickup, "player_drop", player)
    SetPickupPropertyValue(pickup, "3d_text", ItemText)
    SetPickupPropertyValue(pickup, "quantity", quantity)
    SetPickupPropertyValue(pickup, "item_id", item_id)
end

function RemoveDropedItem(droped_id)
    local pu_text =GetPickupPropertyValue(droped_id, '3d_text')

    DestroyPickup(droped_id)
    DestroyText3D(pu_text)
end