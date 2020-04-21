function admin_clothing_preset(player, target, clothing_preset)
	clothing_preset_id = tonumber(clothing_preset)
	if (clothing_preset_id < 1 or clothing_preset_id > 29) then
		return AddPlayerChat(player, "clothing preset "..clothing_preset.." does not exist.")
	end
	
	AddAdminLog(player, "spawn at "..GetPlayerName(target).." clothing preset id : " .. clothing_preset)
	CallRemoteEvent(player, "set_clothingPreset", target, clothing_preset_id)
end