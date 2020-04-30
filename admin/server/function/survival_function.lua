function admin_kill(player, target)
	AddAdminLog(player, " kill " .. GetPlayerName(target))
	SetPlayerHealth(target, 0)
	RefrechSurvivalIventoryUi(target)
	RefrechWarningSurvivalUi(target)
end

function admin_heal(player, target, num)
	AddAdminLog(player, GetPlayerName(player).." set heal ".. GetPlayerName(target) .." | " .. num)
	SetPlayerHealth(target, num)
	local p = getplayer(target)
	p:setHealth(num)

	RefrechSurvivalIventoryUi(target)
	RefrechWarningSurvivalUi(target)
 end


 function admin_armor(player, target, num)
	AddAdminLog(player, GetPlayerName(player).." set armor ".. GetPlayerName(target) .." | " .. num)
	SetPlayerArmor(target, num)
	local p = getplayer(target)
	p:setArmor(num)
	
	RefrechSurvivalIventoryUi(target)
	RefrechWarningSurvivalUi(target)
 end

 function admin_thirst(player, target, num)
	AddAdminLog(player, GetPlayerName(player).." set thirst ".. GetPlayerName(target) .." | " .. num)

	local p = getplayer(target)
	p:setThirst(num)
	
	RefrechSurvivalIventoryUi(target)
	RefrechWarningSurvivalUi(target)
 end

 function admin_food(player, target, num)
	AddAdminLog(player, GetPlayerName(player).." set food ".. GetPlayerName(target) .." | " .. num)
	local p = getplayer(target)
	p:setFood(num)
	
	RefrechSurvivalIventoryUi(target)
	RefrechWarningSurvivalUi(target)
 end