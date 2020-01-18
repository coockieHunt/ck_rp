function spawn_init_clothing(player, random_id)
	local id = init_player.clothing_preset
	SetPlayerClothingPreset(GetPlayerId(),id)
end
AddRemoteEvent("spawn_init_clothing", spawn_init_clothing)

function OnKeyPress(key)
    if key == "V" then
		if IsFirstPersonCamera() then
			EnableFirstPersonCamera(false)
		else
			EnableFirstPersonCamera(true)
			SetNearClipPlane(10)
		end
	end
end
AddEvent("OnKeyPress", OnKeyPress)

AddEvent("OnPlayerSpawn", function()
	SetPostEffect("DepthOfField", "Distance", 0)
end)