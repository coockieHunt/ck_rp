-- spawn clothing
AddRemoteEvent("spawn_clothing", function(clothing_preset)
	SetPlayerClothingPreset(GetPlayerId(), clothing_preset)end)