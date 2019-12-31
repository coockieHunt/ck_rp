function spawn_init_clothing(player, random_id)
	local id = init_player.clothing_preset
	SetPlayerClothingPreset(GetPlayerId(),id)
end
AddRemoteEvent("spawn_init_clothing", spawn_init_clothing)