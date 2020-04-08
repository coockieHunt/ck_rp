__Car_list = {}
__ClothingPreset_list = {}
__Weapons_list = {}
__PosPreset = {}
__SkeletalMesh = {}
__CharacterConfig = {}
__ClothingList = {}

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

function SetSkeletalMesh(data)
    __SkeletalMesh = data
end
AddRemoteEvent("SetSkeletalMesh", SetSkeletalMesh)

function SetNewCharacterConfig(data)
    __CharacterConfig = data
end
AddRemoteEvent("SetNewCharacterConfig", SetNewCharacterConfig)

function SetClothingList(data)
    __ClothingList = data
end
AddRemoteEvent("SetClothingList", SetClothingList)



