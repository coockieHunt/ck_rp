-- spawn clothing
AddRemoteEvent("spawn_clothing", function(PlayerId, clothing_preset)
	SetPlayerClothingPreset(PlayerId, clothing_preset)end)

function ClientCreateFireworks(type)
	local x, y, z = GetPlayerLocation()
	CreateFireworks(type, x, y, z + 150, 90, 0, 0)
end
AddRemoteEvent("ClientCreateFireworks", ClientCreateFireworks)

