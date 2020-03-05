function admin_anim(player, target, animId)
	local level = 1

	if(AdminLevel(player, level)) then
		AddAdminLog(player, " player anim : " .. animId)
		SetPlayerAnimation(target, animId)
	end
 end