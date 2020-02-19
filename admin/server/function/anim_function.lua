function admin_anim(player, target, animId)
	local level = 1

	if(AdminLevel(player, level)) then
		AddAdminLog(player, " player anim : " .. animId)
		print(target, animId)
		SetPlayerAnimation(target, animId)
	end
 end