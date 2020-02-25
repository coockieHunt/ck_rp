function spawn_init_clothing(clothing_id)
	SetPlayerClothingPreset(GetPlayerId(),clothing_id)
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
	ShowHealthHUD(false)
    ShowWeaponHUD(false)
end)

function OnScriptError(message) --Standard copy&paste code from onset lua script examples for printing out lua errors    AddPlayerChat('<span color="#33DD33" style="bold" size="12">[PinColorpicker]</> - ' .. msgs[i])
    AddPlayerChat('<span color="#882233" style="bold" size="12">[ScriptTester Error] [CLIENT]</>: ' .. message)
end
AddEvent("OnScriptError", OnScriptError)
