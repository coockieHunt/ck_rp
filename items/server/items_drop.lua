drop_list = {}

function CreateDropItem(player, item_id, quantity)
    local x, y, z = GetPlayerLocation(player)
    local ph = GetPlayerHeading(player)
    local Vx, Vy, Vz = GetPlayerForward(player)

    local item = GetItems(item_id)

    local obj = CreateObject(item.model, x, y, z)
    local hand_pos = item.hand_pos

    if(isnil(hand_pos)) then
        SetObjectAttached(obj, ATTACH_PLAYER, player, 8, -3, -8, 0.0, 0, 0, "hand_l")
    else
        SetObjectAttached(obj, ATTACH_PLAYER, player, 
            hand_pos['x'], 
            hand_pos['y'], 
            hand_pos['z'], 
            hand_pos['rx'],  
            hand_pos['ry'], 
            hand_pos['rz'], 
            "hand_l"
        )
    end
    
    SetPlayerAnimation(player, _Drop_animation.animation_id)

    os.sleep(_Drop_animation.detach_time)
    DestroyObject(obj)

    local pickup = CreatePickup(item.model, x + (Vx * 200), y + (Vy * 100), z - 50)
    SetPickupPropertyValue(pickup, "type", "droped_item")
    SetPickupPropertyValue(pickup, "id", "droped_item")
    local ItemText = CreateText3D(item.name ..' - ('..quantity..')', 18,  x + (Vx * 200), y + (Vy * 100), z + 20, 0,0,0)

    AddItemList(player, item.model, { x, y, z }, pickup, ItemText, quantity, item_id)
end

function AddItemList(player, model, pos, pickup, ItemText, quantity, item_id)
    local new_item = {
        ["player"] = player, 
        ["model"] = model, 
        ["pos"] = pos,
        ['3d_text'] = ItemText,
        ['quantity'] = quantity,
        ['pickup'] = pickup,
        ['item_id'] = item_id,
    }

    table.insert(drop_list, new_item)
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


function GetDropedItemById(id)
    if(drop_list[id] ~= nil) then
        return drop_list[id]
    end
end

function RemoveDropedItem(droped_id)
    local object = GetDropedItemById(tonumber(droped_id))

    if(object ~= nil) then
        DestroyPickup(object['pickup'])
        table.remove(drop_list, tonumber(droped_id)) 
        DestroyText3D(object["3d_text"])
    end
end

function GatherDropedItem(player, droped_id)
    local object = GetDropedItemById(tonumber(droped_id))
    

    SetPlayerAnimation(player, _Gather_animation.animation_id)

    os.sleep(_Gather_animation.atach_time)

    AddPlayerItem(player, player, object['item_id'], object['quantity'])
    RemoveDropedItem(droped_id)

    local x, y, z = GetPlayerLocation(player)
    local obj = CreateObject(object.model, x, y, z)
    SetObjectAttached(obj, ATTACH_PLAYER, player, 8, -3, -8, 0.0, 0, 0, "hand_l")
    os.sleep(_Gather_animation.detach_time)
    DestroyObject(obj)
end
AddRemoteEvent("GatherDropedItem", GatherDropedItem)


function OnPlayerPickupHit(player, Pickup)
    local x, y, z = GetPlayerLocation(player)
    --CallRemoteEvent(player, "GetPickupActor", x, y, z)
end
AddEvent("OnPlayerPickupHit", OnPlayerPickupHit )


