-- spawn clothing
function cmd_set_clothing_preset(player, clothing_preset)
	if(AdminLevel(player, 1)) then
		admin_clothing_preset(player, clothing_preset)
	end
end
AddCommand("clothing", cmd_set_clothing_preset)


-- spawn car
function cmd_car_spawn(player, model)
    if(AdminLevel(player, 1)) then
        admin_car_spawn(player, model)
	end
end
AddCommand("car", cmd_car_spawn)


function cmd_admin_weapon(player, weapon, slot, ammo)
    if(AdminLevel(player, 1)) then
        admin_weapon_spawn(player, weapon, slot, ammo)
    end
end
AddCommand("weapon", cmd_admin_weapon)

function cmd_admin_kill(player)
    if(AdminLevel(player, 1)) then
        admin_kill(player)
	end
end
AddCommand("kill", cmd_admin_kill)

 --heal
 function cmd_admin_heal(player)
    if(AdminLevel(player, 1)) then
        admin_heal(player)
	end
 end
 AddCommand("heal", cmd_admin_heal)

 function cmd_admin_anim(player, animId)
    if(AdminLevel(player, 1)) then
        admin_anim(player, animId)
	end
 end
 AddCommand("anim", cmd_admin_anim)

 function cmd_admin_fireworks(player, type)
    if(AdminLevel(player, 1)) then
        admin_fireworks(player, type)
	end
 end
 AddCommand("fireworks", cmd_admin_fireworks)

 function cmd_admin_spec(player, disable)
    if(AdminLevel(player, 1)) then
        admin_spec(player, disable)
	end
 end
 AddCommand("spec", cmd_admin_spec)

--utils
function AdminLevel(playerid, level)
	local data = getplayer(playerid)

	if(tonumber(data.admin) < tonumber(level)) then
		AddPlayerChat(playerid, "not admin")
		return false
	else
		return true
	end
end