function OnPlayerStreamIn(player)
	local _modelPreset = GetPlayerPropertyValue(player, "_modelPreset")
	if (_modelPreset ~= nil and _modelPreset > 0) then
		SetPlayerClothingPreset(player, _modelPreset)
	end
end
AddEvent("OnPlayerStreamIn", OnPlayerStreamIn)