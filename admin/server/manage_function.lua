function admin_clothing_preset(player, playerId, clothing_preset)
	if(clothing_preset == nil) then return	AddPlayerChat(player, 'Usage: /clothing <presetId>') end
    
    clothing_preset_id = tonumber(clothing_preset)
    if (clothing_preset_id < 1 or clothing_preset_id > 29) then
		return AddPlayerChat(player, "clothing preset "..clothing_preset.." does not exist.")
    end
    
    AddAdminLog(player, "spawn clothing preset id : " .. clothing_preset)
	CallRemoteEvent(player, "spawn_clothing", playerId, clothing_preset_id)
end

function admin_car_spawn(player, model, mount, boost , color)
	local vehicle

    if (model == nil) then return AddPlayerChat(player, "Usage: /car <model>")end

	model = tonumber(model)
	if (model < 1 or model > 25) then return AddPlayerChat(player, "Vehicle model "..model.." does not exist.") end


	local x, y, z = GetPlayerLocation(player)
	local h = GetPlayerHeading(player)

	if (vehicle == false) then return AddPlayerChat(player, "Failed to spawn your vehicle") end
	if(mount)then
		vehicle = CreateVehicle(model, x, y, z, h)
		SetPlayerInVehicle(player, vehicle)
	else
		vehicle = CreateVehicle(model, x , y - 300, z, h - 90.0)
		print("Player location: "..x..", "..y..", "..z)
	end

	if(boost) then AttachVehicleNitro(vehicle, true) end

	SetVehicleColor(vehicle, "0x"..color)
	SetVehicleLicensePlate(vehicle, "ADMIN-SPAWN")
	
	AddAdminLog(player, "spawn car id : " .. model)

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

function admin_heal(player, num)
	AddAdminLog(player, " heal - " .. num)
	SetPlayerHealth(player, num)
	local p = getplayer(player)
	p:setHealth(num)
	RefrechSurvivalUi(player)
	RefrechWarningSurvivalUi(player)
 end


 function admin_armor(player, num)
	AddAdminLog(player, " armor - " .. num)
	SetPlayerArmor(player, num)
	local p = getplayer(player)
	p:setArmor(num)
	RefrechSurvivalUi(player)
	RefrechWarningSurvivalUi(player)
 end

 function admin_tp_to(player, x, y, z)
 	 local msg = "teleport to x =" .. x ..", y= ".. y ..", z= " .. z
	  AddAdminLog(player, msg)
	  if (GetPlayerVehicleSeat(player) == 1) then
		local vehicle = GetPlayerVehicle(player)
		SetVehicleLocation(vehicle, x, y, z + 30)
		if (to[4] ~= -1.0) then
		  SetVehicleHeading(vehicle, 0)
		end
	
			SetVehicleLinearVelocity(vehicle, 0.0, 0.0, 0.0, true)
			SetVehicleAngularVelocity(vehicle, 0.0, 0.0, 0.0, true)
			local rx, ry, rz = GetVehicleRotation(vehicle)
			SetVehicleRotation(vehicle, 0.0, ry, 0.0)
		else
			SetPlayerLocation(player, x, y, z + 30)
			if (0 ~= -1.0) then
				SetPlayerHeading(player, 0)
			end
		end

 end

function admin_pos(player)
	AddAdminLog(player, " save pos")
	local x, y, z = GetPlayerLocation(player)
	local text = x..", "..y..", "..z
	file = io.open("pos.txt", "a")
	file:write(text, "\n")
	file:close()
end