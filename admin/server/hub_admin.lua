AddRemoteEvent("Exucute", function(playerid, json)
    local data = json_decode(json)
    local func = data['func']


    if(func == 'car') then
        if(isnil(data['id'])) then
            AddPlayerChat(playerid, "none id")
        else
            local am = false
            local b = false
            if(data['autopilote'] == 'on') then am = true end
            if(data['boost'] == 'on') then b = true end
            
            admin_car_spawn(playerid, data['id'], am, b, data['color'])
        end
    end

    if(func == 'health') then
        if(isnil(data['id'])) then
            AddPlayerChat(playerid, "none id")
        else
            local h = data['health']
            
            admin_heal(playerid, h)
        end
    end

    if(func == 'armor') then
        if(isnil(data['id'])) then
            AddPlayerChat(playerid, "none id")
        else
            local a = data['armor']
            
            admin_armor(playerid, a)
        end
    end

    if(func == 'clothing') then
        if(isnil(data['id'])) then
            AddPlayerChat(playerid, "none id")
        else
            local p = data['id']
            local cp = data['clothingPreset']
            
            admin_clothing_preset(playerid, p,  cp)
        end
    end

    if(func == 'weapons') then
        if(isnil(data['id'])) then
            AddPlayerChat(playerid, "none id")
        else
            local p = data['id']
            local w = data['weapon']
            local s = data['slot']
            local a = data['ammo']
            
            admin_weapon_spawn(p, w, s, a)
        end
    end
end)

AddRemoteEvent("GetAllPlayer", function(player)
	local PlayerTable = { }
	
	for _, v in ipairs(GetAllPlayers()) do
        PlayerTable[v] = {
            GetPlayerName(v),
        }
	end
	
	CallRemoteEvent(player, "SetPlayerList", PlayerTable)
end)