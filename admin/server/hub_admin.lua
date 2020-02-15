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
            local t = data['id']
            
            admin_heal(playerid, t, h)
        end
    end

    if(func == 'armor') then
        if(isnil(data['id'])) then
            AddPlayerChat(playerid, "none id")
        else
            local a = data['armor']
            local t = data['id']
            
            admin_armor(playerid,t ,a)
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

    if(func == 'kill') then
        if(isnil(data['id'])) then
            AddPlayerChat(playerid, "none id")
        else
            local p = data['id']
            
            admin_kill(playerid, p)
        end
    end

    if(func == 'tp_pos') then
        if(isnil(data['id'])) then
            AddPlayerChat(playerid, "none id")
        else
            local p = data['id']

            local x = data['x']
            local y = data['y']
            local z = data['z']
            
            admin_tp_to_pos(p, x, y, z)
        end
    end

    if(func == 'tp_to') then
        if(isnil(data['id'])) then
            AddPlayerChat(playerid, "none id")
        else
            local p = data['id']
            admin_tp_to(playerid, p)
        end
    end

    if(func == 'tp_preset') then
        if(isnil(data['id'])) then
            AddPlayerChat(playerid, "none id")
        else
            local t = data['id']
            local pd = data['preset_id']

            get_admin_tp_preset_pos(playerid, t, pd)
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

