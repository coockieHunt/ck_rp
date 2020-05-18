AddRemoteEvent("GetAllPlayer", function(player)
	local PlayerTable = { }
	
	for _, v in ipairs(GetAllPlayers()) do
        PlayerTable[v] = {
            GetPlayerName(v),
        }
	end
	
	CallRemoteEvent(player, "SetPlayerList", PlayerTable)
end)

AddRemoteEvent("GetPlayerCacheList", function(player)
	local PlayerTable = { }
    
    for _, v in ipairs(playerData) do
        PlayerTable[v.id_client] = {
            v.name,
            v.active
        }
	end
	
	CallRemoteEvent(player, "SetPlayerCacheList", PlayerTable)
end)


AddRemoteEvent("GetItemsList", function(player)
	local ListTable = { }
    local arg = 0
    print(tablelength(_itemsList))
    for id ,info in pairs(_itemsList) do

        arg = arg + 1
        
        ListTable[arg] = {
            info.name,
            id,
        }
    end
	
	CallRemoteEvent(player, "SetItemsList", ListTable)
end)

AddRemoteEvent("GetDropItemList", function(player)
    local ListTable = { }
    local arg = 0

    for _, pickupId in pairs(GetAllPickups()) do
        arg = arg + 1

        local po_type = GetPickupPropertyValue(pickupId, "type")
        local po_player = GetPickupPropertyValue(pickupId, "player_drop")
        local po_posX, po_posY, po_posZ = GetPickupLocation(pickupId)
        local po_quantity = GetPickupPropertyValue(pickupId, "quantity")
        local po_item = GetPickupPropertyValue(pickupId, "item_id")
        
        local pos = po_posX .. " - " .. po_posY .. " - " .. po_posZ
        local item_info = getItemInfo(po_item)

        if item_info ~= false then

            if(po_type == 'droped_item') then
                ListTable[arg] = {
                    ["id"] = pickupId,
                    ["name"] = item_info.name,
                    ["player"] = po_player, 
                    ["pos"] = pos,
                    ["quantity"] = po_quantity
                }
            end
        end
    end
	
    CallRemoteEvent(player, "SetDropItemList", ListTable)
end)


AddRemoteEvent("GetPlayerInfo", function(player, playerid)
    admin_GetPlayerInfo(player, player, playerid)
end)

AddRemoteEvent("GetBanList", function(player, playerid)
    local list = admin_GetBanList(playerid)
end)