function admin_weapon_spawn(player, weapon, slot, ammo)
	AddAdminLog(player, "spawn weapon id : " .. weapon .. " slot: " ..slot.. " ammo: " .. ammo)
	SetPlayerWeapon(player, weapon, ammo, true, slot, true)
end