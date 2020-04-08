function OnPlayerJoin(player)
    print("> Build data from the server package and sent to clients ...")
    SetCarList(player)
    SetClothingPreset(player)
    SetWeaponsList(player)
    SetPosPresetList(player)
    SetSkeletalMesh(player)
    SetNewCharacterConfig(player)
    SetClothingList(player)
    print("> Data has been transmitted to the client")
end
AddEvent("OnPlayerJoin", OnPlayerJoin)

function SetCarList(player)
    local ListTable = { }
    local arg = 0
    

    for i, v in ipairs(_CarsList) do
        arg = arg + 1
        
        ListTable[arg] = {
            v.name,
            v.id,
        }
    end
    CallRemoteEvent(player, "SetCarList", ListTable)
end

function SetClothingPreset(player)
    local ListTable = { }
    local arg = 0
    

    for i, v in ipairs(_Preset_clothing) do
        arg = arg + 1
        
        ListTable[arg] = {
            v.name,
            i,
        }
    end
    CallRemoteEvent(player, "SetClothingPreset", ListTable)
end

function SetWeaponsList(player)
    local ListTable = { }
    local arg = 0
    

    for i, v in ipairs(_WeaponsList) do
        arg = arg + 1
        
        ListTable[arg] = {
            v.name,
            i,
        }
    end
    CallRemoteEvent(player, "SetWeaponsList", ListTable)
end

function SetPosPresetList(player)
    local ListTable = { }
    local arg = 0
    
    for i, v in ipairs(_PosPresetList) do
        arg = arg + 1
        
        ListTable[arg] = {
            v.name,
            i,
        }
    end
    CallRemoteEvent(player, "SetPosPresetList", ListTable)
end

function SetSkeletalMesh(player)
    CallRemoteEvent(player, "SetSkeletalMesh", _Registe_SkeletalMesh_player)
end

function SetNewCharacterConfig(player)
    CallRemoteEvent(player, "SetNewCharacterConfig", _Character_creation)
end

function SetClothingList(player)
    local ListTable = {}
    local arg = 0

    local var
    local name
    local type


    for i, v in pairs(_Clothing_men) do
        type = i
        for _, v in ipairs(v) do
            var = v.var
            name = v.name

            arg = arg + 1
        
            ListTable[arg] = {
                "men",
                type,
                var,
                name
            }
        end
    end

    for i, v in pairs(_Clothing_women) do
        type = i
        for _, v in ipairs(v) do
            var = v.var
            name = v.name

            arg = arg + 1
        
            ListTable[arg] = {
                "women",
                type,
                var,
                name
            }


        end
    end

    CallRemoteEvent(player, "SetClothingList", ListTable)
end

