function admin_anim(player, target, animId)
	AddAdminLog(player, " player anim : " .. animId)
	SetPlayerAnimation(target, animId)
 end