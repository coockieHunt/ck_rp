local web_ui

function BuildSelect(ui)
    web_ui = ui
    
    GetCarList()
    GetPlayerList()
    GetClothingPresetList()
    GetWeaponsList()
    GetTpList()
    GetItemsList()
    GetDropItemList()
end

-- car list
function GetCarList()
    for i, v in ipairs(VEHICLE_DATA) do
        local name = v['name']
        local alias = VEHICLE_DATA[i]['alias'][1]
        local id = i
        ExecuteWebJS(web_ui, "BuildVehicleSelect('"..name.."', "..id..");")
    end
end

--clothing preset list
function GetClothingPresetList()
    for i, v in ipairs(CLOTHING_PRESET_DATA) do
        local name = v['name']
        local alias = CLOTHING_PRESET_DATA[i]['alias'][1]
        local id = i
        ExecuteWebJS(web_ui, "BuildClothingPresetSelect('"..name.."', "..id..");")
    end
end

--Weapon list
function GetWeaponsList()
    for i, v in ipairs(WEAPON_DATA) do
        local name = v['name']
        local id = i
        ExecuteWebJS(web_ui, "BuildWeaponsSelect('"..name.."', "..id..");")
    end
end

-- Player list
function GetPlayerList(ui)
    CallRemoteEvent("GetAllPlayer", ui)
end

function SetPlayerList(playersList)
    for k, v in ipairs(playersList) do
        local id = k
        local name = v[1]
        ExecuteWebJS(web_ui, "BuildPlayerListSelect('"..name.."', "..id..");")
	end

end
AddRemoteEvent("SetPlayerList", SetPlayerList)

-- tp list
function GetTpList(ui)
    local i = 0
    for k, v in ipairs(POS_PRESET_DATA) do
        i = i + 1
        local name = v['name']
        ExecuteWebJS(web_ui, "BuildPresetPosSelect('"..name.."', '"..i.."');")
	end
end

-- Items list
function GetItemsList(ui)
    CallRemoteEvent('GetItemsList', ui)
end

function SetItemsList(ItemsList)
    for k, v in ipairs(ItemsList) do
        local id = v[2]
        local name = v[1]
        
        ExecuteWebJS(web_ui, "BuildItemSelect('"..name.."', '"..id.."');")
    end

end
AddRemoteEvent("SetItemsList", SetItemsList)

-- Droped item list
function GetDropItemList(ui)
    CallRemoteEvent('GetDropItemList', ui)
end

function SetDropItemList(ItemsList)
    for k, v in ipairs(ItemsList) do
        local id = v["id"]
        local player = v["player"]
        local pos = v["pos"]
        local model_name = v["model_name"]

        local str = string.format("BuildIDropItemSelect('%q', '%q', '%q', '%q')", id, GetPlayerName(player), model_name, pos)

        ExecuteWebJS(web_ui, str)
    end
end
AddRemoteEvent("SetDropItemList", SetDropItemList)