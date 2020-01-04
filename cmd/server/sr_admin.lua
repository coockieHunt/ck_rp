-- spawn clothing
function cmd_set_clothing_preset(player, clothing_preset)
	if(clothing_preset == nil) then return	AddPlayerChat(player, 'Usage: /clothing <presetId>') end

	if(AdminLevel(player, 1)) then return AddPlayerChat(player, "not admin")end

	clothing_preset_id = tonumber(clothing_preset)
	if (clothing_preset_id < 1 or clothing_preset_id > 29) then
		return AddPlayerChat(player, "clothing preset "..clothing_preset.." does not exist.")
	end
	print_cmd("clothing", clothing_preset, player)
	AdminLog(GetPlayerName(player) .. " spawn clithing preset id : " .. model)
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

	AdminLog(GetPlayerName(player) .. " spawn car id : " .. model)
	AttachVehicleNitro(vehicle, true) 
	SetPlayerInVehicle(player, vehicle)

	print_cmd("car", vehicle, player)
end
AddCommand("car", cmd_car_spawn)

--spawn weapon
function cmd_weapon_spawn(player, weapon, slot, ammo)
	if (weapon == nil or slot == nil or ammo == nil) then
		return AddPlayerChat(player, "Usage: /weapon <weapon> <slot> <ammo>")
	end

	if(AdminLevel(player, 1)) then return AddPlayerChat(player, "not admin")end

	AdminLog(GetPlayerName(player) .. " spawn weapon : " .. weapon)

	SetPlayerWeapon(player, weapon, ammo, true, slot, true)

    print_cmd("weapon", weapon, player)
end
AddCommand("weapon", cmd_weapon_spawn)

--kill
function kill(player)
	if(AdminLevel(player, 1)) then return AddPlayerChat(player, "not admin")end

	AdminLog(GetPlayerName(player) .. " comit sucide")
	print("> [ADMIN] " .. GetPlayerName(player).." commit sucide ")

	SetPlayerHealth(player, 0)
 end
 AddCommand("kill", kill)


--utils
function AdminLevel(playerid, level)
	local data = getplayer(playerid)

	if(tonumber(data.admin) < tonumber(level)) then
		return true
	end

	return false
end

function AdminLog(print)
	local time = os.time(os.date("!*t"))
	file = io.open("admin_log.txt", "a")
	file:write("[admin] ("..time..") : "..print, "\n")
	file:close()
end

function print_cmd(spawn, id, player)
	print("> [ADMIN] cmd spawn "..spawn..", id : "..id..", player : "..GetPlayerName(player).." ")
end

