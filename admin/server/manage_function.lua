function admin_clothing_preset(player, target, clothing_preset)
	local level = 1

	if(AdminLevel(player, level)) then
		clothing_preset_id = tonumber(clothing_preset)
		if (clothing_preset_id < 1 or clothing_preset_id > 29) then
			return AddPlayerChat(player, "clothing preset "..clothing_preset.." does not exist.")
		end
		
		AddAdminLog(player, "spawn at "..GetPlayerName(target).." clothing preset id : " .. clothing_preset)
		CallRemoteEvent(player, "spawn_clothing", target, clothing_preset_id)
	end
end

function admin_car_spawn(player, model, mount, boost , color)
	local level = 1

	if(AdminLevel(player, level)) then
		local vehicle
		local model = tonumber(model)
		color = "0x"..color

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
		

		SetVehicleColor(vehicle, color)
		SetVehicleLicensePlate(vehicle, "ADMIN-SPAWN")
		
		AddAdminLog(player, "spawn car id : ".. model.." | color: ".. color .. " | boost : ".. strBool(boost))
	end
end

function admin_weapon_spawn(player, weapon, slot, ammo)
	local level = 1

	if(AdminLevel(player, level)) then
		AddAdminLog(player, "spawn weapon id : " .. weapon .. " slot: " ..slot.. " ammo: " .. ammo)
		SetPlayerWeapon(player, weapon, ammo, true, slot, true)
	end

end

function admin_kill(player, target)
	local level = 1

	if(AdminLevel(player, level)) then
		AddAdminLog(player, " kill " .. GetPlayerName(target))
		SetPlayerHealth(target, 0)
	end
end

function admin_anim(player, target, animId)
	local level = 1

	if(AdminLevel(player, level)) then
		AddAdminLog(player, " player anim : " .. animId)
		print(target, animId)
		SetPlayerAnimation(target, animId)
	end
 end



function admin_heal(player, target, num)
	local level = 1

	if(AdminLevel(player, level)) then
		AddAdminLog(player, GetPlayerName(player).." set heal ".. GetPlayerName(target) .." | " .. num)
		SetPlayerHealth(target, num)
		local p = getplayer(target)
		p:setHealth(num)
		RefrechSurvivalUi(target)
		RefrechWarningSurvivalUi(target)
	end
 end


 function admin_armor(player, target, num)
	local level = 1

	if(AdminLevel(player, level)) then
		AddAdminLog(player, GetPlayerName(player).." set armor ".. GetPlayerName(target) .." | " .. num)
		SetPlayerArmor(target, num)
		local p = getplayer(target)
		p:setArmor(num)
		RefrechSurvivalUi(target)
		RefrechWarningSurvivalUi(target)
	end
 end


 function admin_fc(player, disable)
	local level = 1
	local _disable = false

	if(AdminLevel(player, level)) then
		if disable ~= nil then
			_disable = true
		end
		_disable = not _disable

		SetPlayerSpectate(player, _disable)
		AddAdminLog(player, GetPlayerName(player).." spectate")
	end
end

function admin_pos(player)
	local level = 1

	if(AdminLevel(player, level)) then
		AddAdminLog(player, " save pos")
		local x, y, z = GetPlayerLocation(player)
		local text = x..", "..y..", "..z
		file = io.open("pos.txt", "a")
		file:write(text, "\n")
		file:close()
	end
end


 function admin_tp_to_pos(player, x, y, z)
	local level = 1

	if(AdminLevel(player, level)) then
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
 end

function admin_tp_to(main, to)
	local level = 1

	if(AdminLevel(player, level)) then
		AddAdminLog(main, GetPlayerName(main).." tp to " .. GetPlayerName(to))
		local x, y, z = GetPlayerLocation(to)
		admin_tp_to_pos(main, x, y, z)
	end
end

function get_admin_tp_preset_pos(player, target, dest)
	local level = 1

	if(AdminLevel(player, level)) then
		local pos = tonumber(dest)
		if(isnil(pos)) then pos = dest end

		CallRemoteEvent(target, "GetPosByName", pos, player, target)
	end
end

AddRemoteEvent("admin_tp_preset_pos", function(player, target, x, y, z, h)
    admin_tp_to_pos(target, x, y, z)
end)