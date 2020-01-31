function admin_clothing_preset(player, clothing_preset)
	if(clothing_preset == nil) then return	AddPlayerChat(player, 'Usage: /clothing <presetId>') end
    
    clothing_preset_id = tonumber(clothing_preset)
    if (clothing_preset_id < 1 or clothing_preset_id > 29) then
		return AddPlayerChat(player, "clothing preset "..clothing_preset.." does not exist.")
    end
    
    AddAdminLog(player, "spawn clothing preset id : " .. clothing_preset)
	CallRemoteEvent(player, "spawn_clothing", clothing_preset_id)
end

function admin_car_spawn(player, model)
    if (model == nil) then return AddPlayerChat(player, "Usage: /car <model>")end

	model = tonumber(model)
	if (model < 1 or model > 25) then return AddPlayerChat(player, "Vehicle model "..model.." does not exist.") end

	local x, y, z = GetPlayerLocation(player)
	local h = GetPlayerHeading(player)

	local vehicle = CreateVehicle(model, x, y, z, h)
	if (vehicle == false) then return AddPlayerChat(player, "Failed to spawn your vehicle") end

	AddAdminLog(player, "spawn car id : " .. model)
	AttachVehicleNitro(vehicle, true) 
    SetPlayerInVehicle(player, vehicle)
end

function admin_weapon_spawn(player, weapon, slot, ammo)
	if (weapon == nil or slot == nil or ammo == nil) then
		return AddPlayerChat(player, "Usage: /weapon <weapon> <slot> <ammo>")
	end

	AddAdminLog(player, "spawn weapon id : " .. weapon .. " slot: " ..slot.. " ammo: " .. ammo)
	SetPlayerWeapon(player, weapon, ammo, true, slot, true)
end

function admin_kill(player)
    AddAdminLog(player, " commit sucide")
    SetPlayerHealth(player, 0)
end

function admin_anim(player, animId)
	AddAdminLog(player, " player anim : " .. animId)
	SetPlayerAnimation(player, animId)
 end

 function admin_fireworks(player, type)
	if (type == nil) then
		return LogPlayerChat(player, "warning", "Usage", "/fireworks <type 1-13>")
	end
	
	type = tonumber(type)
	if (type < 0 or type > 13) then
		return LogPlayerChat(player, "warning", "Parameter", "type 1-13")
	end

	CallRemoteEvent(player, "ClientCreateFireworks", type)
	LogPlayerChat(player, "ok", "server", "Fireworks created!")
	AddAdminLog(player, " player fireworks : " .. type)
end

function admin_spec(player, disable)
	local _disable = false
	if disable ~= nil then
		_disable = true
	end
	_disable = not _disable
	
	SetPlayerSpectate(player, _disable)
	AddAdminLog(player, " player spectate")
end

function admin_heal(player)
	AddAdminLog(player, " heal")
	SetPlayerHealth(player, 100)
	local p = getplayer(player)
	p:setHealth(100)
	RefrechSurvivalUi(player)
	RefrechWarningSurvivalUi(player)
 end


 function admin_armor(player)
	AddAdminLog(player, " armor")
	SetPlayerArmor(player, 100)
	local p = getplayer(player)
	p:setArmor(100)
	RefrechSurvivalUi(player)
	RefrechWarningSurvivalUi(player)
 end

function admin_pos(player)
	AddAdminLog(player, " save pos")
	local x, y, z = GetPlayerLocation(player)
	local text = x..", "..y..", "..z
	file = io.open("pos.txt", "a")
	file:write(text, "\n")
	file:close()
end