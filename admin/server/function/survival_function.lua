function admin_kill(player, target)
	local level = 1

	if(AdminLevel(player, level)) then
		AddAdminLog(player, " kill " .. GetPlayerName(target))
		SetPlayerHealth(target, 0)
	end
end

function admin_heal(player, target, num)
	local level = 1

	if(AdminLevel(player, level)) then
		AddAdminLog(player, GetPlayerName(player).." set heal ".. GetPlayerName(target) .." | " .. num)
		SetPlayerHealth(target, num)
		local p = getplayer(target)
		p:setHealth(num)

		SetUiDamage(target)
		setUiWarnDamage(target)
	end
 end


 function admin_armor(player, target, num)
	local level = 1

	if(AdminLevel(player, level)) then
		AddAdminLog(player, GetPlayerName(player).." set armor ".. GetPlayerName(target) .." | " .. num)
		SetPlayerArmor(target, num)
		local p = getplayer(target)
		p:setArmor(num)
		
		SetUiDamage(target)
		setUiWarnDamage(target)
	end
 end