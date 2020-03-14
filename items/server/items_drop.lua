function CreateDropItem(player, item_id, quantity)
    local x, y, z = GetPlayerLocation(player)
    local ph = GetPlayerHeading(player)
    local Vx, Vy, Vz = GetPlayerForward(player)

    local item = GetItems(item_id)

    local obj = CreateObject(item.model, x, y, z)
    
    local hand_pos = GetItemHandPos(item_id)
    SetObjectAttached(obj, ATTACH_PLAYER, player, 
        hand_pos['x'], 
        hand_pos['y'], 
        hand_pos['z'], 
        hand_pos['rx'],  
        hand_pos['ry'], 
        hand_pos['rz'], 
        "hand_l"
    )
    
    SetPlayerAnimation(player, _Drop_animation.animation_id)

    SendAlert(player, "info", "Dropped", "You had left  " .. quantity .. " " .. item.name)

    Delay(_Gather_animation.atach_time, function()
        DestroyObject(obj)

        local pickup = CreatePickup(item.model, x + (Vx * 200), y + (Vy * 100), z - 50)
        local ItemText = CreateText3D(item.name ..' - ('..quantity..')', 18,  x + (Vx * 200), y + (Vy * 100), z + 20, 0,0,0)
        
        AddItemList(player, pickup, item.model, ItemText, quantity, item_id)
    end)
end

function GatherDropedItem(player, droped_id)
    local po_id = GetPickupPropertyValue(droped_id, 'item_id')
    local po_quantity = GetPickupPropertyValue(droped_id, 'quantity')
    local po_model = GetPickupPropertyValue(droped_id, 'model')
    local po_text = GetPickupPropertyValue(droped_id, '3d_text')

    local Setquantity = po_quantity

    local attached_object = 0

    SetPlayerAnimation(player, _Gather_animation.animation_id)

    Delay(_Gather_animation.atach_time, function()
        local th = AddPlayerItem(player, player, po_id, po_quantity)
        if(th ~= true) then
            local new_quantity = math.floor(po_quantity - th)

            Setquantity = new_quantity

            SetText3DText(po_text, GetItemNameByModelId(po_model) .. ' - (' ..th..')')
            SetPickupPropertyValue(droped_id, 'quantity', th)
            AddPlayerItem(player, player, po_id, Setquantity)
        else
            RemoveDropedItem(droped_id)
        end

        SendAlert(player, "info", "Dropped", "You had left  " .. Setquantity .. " " ..GetItemNameByModelId(po_model))


        local x, y, z = GetPlayerLocation(player)
        attached_object = CreateObject(po_model, x, y, z)

        local hand_pos = GetItemHandPos(po_id)
        SetObjectAttached(attached_object, ATTACH_PLAYER, player, 
            hand_pos['x'], 
            hand_pos['y'], 
            hand_pos['z'], 
            hand_pos['rx'],  
            hand_pos['ry'], 
            hand_pos['rz'], 
            "hand_l"
        )

        Delay(_Gather_animation.detach_time, function()
            DestroyObject(attached_object)

            return true
        end)
    end)
end
AddRemoteEvent("GatherDropedItem", GatherDropedItem)

function AddItemList(player, pickup, model, ItemText, quantity, item_id)
    SetPickupPropertyValue(pickup, "type", "droped_item")

    SetPickupPropertyValue(pickup, "player_drop", player)
    SetPickupPropertyValue(pickup, "model", model)
    SetPickupPropertyValue(pickup, "3d_text", ItemText)
    SetPickupPropertyValue(pickup, "quantity", quantity)
    SetPickupPropertyValue(pickup, "item_id", item_id)
end

function GetPlayerForward(playerid)
	local deg = GetPlayerHeading(playerid)
	local rad = math.rad(deg)
	local x = math.cos(rad)
	local y = math.sin(rad)
	return x, y, 0
end

function drop_item(player, item_id, quantity) 
    CreateDropItem(player, item_id, quantity)
    RemovePlayerItem(player, player, item_id, quantity)
end
AddRemoteEvent("drop_item", drop_item)


function RemoveDropedItem(droped_id)
    local po_text = GetPickupPropertyValue(droped_id, '3d_text')
    DestroyPickup(droped_id)
    DestroyText3D(po_text)
end

function OnPlayerPickupHit(player, Pickup)
    local x, y, z = GetPlayerLocation(player)
    SendAlert(player, "Info", "Interaction", "An interaction is possible by pressing " .. _Key_ui['interact'])

end
AddEvent("OnPlayerPickupHit", OnPlayerPickupHit )


