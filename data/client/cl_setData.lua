__Car_list = {}
__ClothingPreset_list = {}
__Weapons_list = {}
__PosPreset = {}

function SetCarList(data)
    __Car_list = data
end
AddRemoteEvent("SetCarList", SetCarList)

function SetClothingPreset(data)
    __ClothingPreset_list = data
end
AddRemoteEvent("SetClothingPreset", SetClothingPreset)

function SetWeaponsList(data)
    __Weapons_list = data
end
AddRemoteEvent("SetWeaponsList", SetWeaponsList)

function SetPosPresetList(data)
    __PosPreset = data
end
AddRemoteEvent("SetPosPresetList", SetPosPresetList)


