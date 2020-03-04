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

    SetObjectDetached(obj)
    SetObjectLocation(obj, x + (Vx * 200), y + (Vy * 100), z - 100)
    SetObjectRotation(obj, 0, ph, 0)
    local ItemText = CreateText3D(item.name ..' ('..quantity..')', 18,  x + (Vx * 200), y + (Vy * 100), z + 20, 0,0,0)

    AddItemList(player, item.model, { x, y, z }, obj, ItemText, quantity)
end

function AddItemList(player, model, pos, object, text, quantity)
    local new_item = {
        ["player"] = player, 
        ["model"] = model, 
        ["pos"] = pos,
        ["object"] = object,
        ['3d_text'] = ItemtextText,
        ['quantity'] = quantity,
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
        DestroyObject(object["object"])
        table.remove(drop_list, tonumber(droped_id)) 
        DestroyText3D(object["3d_text"])
    end
end