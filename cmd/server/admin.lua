-- spawn clothing
function cmd_set_clothing_preset(player, clothing_preset)
	if(clothing_preset == nil) then return	AddPlayerChat(player, 'Usage: /clothing <presetId>') end

	if(AdminLevel(player, 1)) then return AddPlayerChat(player, "not admin")end

	clothing_preset_id = tonumber(clothing_preset)
	if (clothing_preset_id < 1 or clothing_preset_id > 29) then
		return AddPlayerChat(player, "clothing preset "..clothing_preset.." does not exist.")
	end
	AddAdminLog(player, "spawn clothing preset id : " .. clothing_preset)
	CallRemoteEvent(player, "spawn_clothing", clothing_preset_id)
end
AddCommand("clothing", cmd_set_clothing_preset)

-- spawn car
function cmd_car_spawn(player, model)
	if (model == nil) then return AddPlayerChat(player, "Usage: /car <model>")end

	model = tonumber(model)

	if (model < 1 or model > 25) then return AddPlayerChat(player, "Vehicle model "..model.." does not exist.") end

	if(AdminLevel(player, 1)) then return AddPlayerChat(player, "not admin")end

	local x, y, z = GetPlayerLocation(player)
	local h = GetPlayerHeading(player)

	local vehicle = CreateVehicle(model, x, y, z, h)
	if (vehicle == false) then return AddPlayerChat(player, "Failed to spawn your vehicle") end

	AddAdminLog(player, "spawn car id : " .. model)
	AttachVehicleNitro(vehicle, true) 
	SetPlayerInVehicle(player, vehicle)
end
AddCommand("car", cmd_car_spawn)

--spawn weapon
function cmd_weapon_spawn(player, weapon, slot, ammo)
	if (weapon == nil or slot == nil or ammo == nil) then
		return AddPlayerChat(player, "Usage: /weapon <weapon> <slot> <ammo>")
	end

	if(AdminLevel(player, 1)) then return AddPlayerChat(player, "not admin")end
	AddAdminLog(player, "spawn weapon id : " .. weapon .. " slot: " ..slot.. " ammo: " .. ammo)

	SetPlayerWeapon(player, weapon, ammo, true, slot, true)
end
AddCommand("weapon", cmd_weapon_spawn)

--kill
function kill(player)
	if(AdminLevel(player, 1)) then return AddPlayerChat(player, "not admin")end

	AddAdminLog(player, " commit sucide")

	SetPlayerHealth(player, 0)
 end
 AddCommand("kill", kill)

 --heal
function heal(player)
	if(AdminLevel(player, 1)) then return AddPlayerChat(player, "not admin")end

	AddAdminLog(player, " heal")

	SetPlayerHealth(player, 100)

	GetPlayerData(player)
 end
 AddCommand("heal", heal)

 --anim
function anim(player, animId)
	if(AdminLevel(player, 1)) then return AddPlayerChat(player, "not admin")end

	AddAdminLog(player, " player anim : " .. animId)

	SetPlayerAnimation(player, animId)
 end
 AddCommand("anim", anim)


 function cmd_fireworks(player, type)
	if (type == nil) then
		return LogPlayerChat(player, "warning", "Usage", "/fireworks <type 1-13>")
	end
	
	type = tonumber(type)

	if (type < 0 or type > 13) then
		return LogPlayerChat(player, "warning", "Parameter", "type 1-13")
	end

	if(AdminLevel(player, 1)) then return AddPlayerChat(player, "not admin")end

	CallRemoteEvent(player, "ClientCreateFireworks", type)
	LogPlayerChat(player, "ok", "server", "Fireworks created!")
	AddAdminLog(player, " player fireworks : " .. type)
end
AddCommand("fireworks", cmd_fireworks)

function cmd_spec(player, disable)
	if(AdminLevel(player, 1)) then return AddPlayerChat(player, "not admin")end
	local _disable = false
	if disable ~= nil then
		_disable = true
	end
	_disable = not _disable
	
	SetPlayerSpectate(player, _disable)
	AddAdminLog(player, " player spectate")

end
AddCommand("spectate", cmd_spec)

--utils
function AdminLevel(playerid, level)
	local data = getplayer(playerid)

	if(tonumber(data.admin) < tonumber(level)) then
		return true
	end

	return false
end
