function set_clothingPreset(target, clothing_id)
    SetPlayerClothingPreset(target, clothing_id)
    SetPlayerPropertyValue(target, "_modelPreset", clothing_id, true)
end
AddRemoteEvent("set_clothingPreset", set_clothingPreset)