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