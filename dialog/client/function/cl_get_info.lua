local web_ui

function BuildSelectOnStart(ui)
    web_ui = ui
    
    GetCarList()
    GetWeaponsList()
    GetTpList()
    GetItemsList()
    
end

function BuildSelectOnOpen(ui)
    web_ui = ui

    GetPlayerList()
    GetPlayerCacheList()
    GetDropItemList()
end

-- car list
function GetCarList()
    for i, v in ipairs(__Car_list) do
        local name = v[1]
        local id = v[2]
        ExecuteWebJS(web_ui, "BuildVehicleSelect('"..name.." ', "..id..");")
    end
end

--clothing preset list
function GetClothingPresetList()
    for i, v in ipairs(__ClothingPreset_list) do
        local name = v[1]
        local id = v[2]
        ExecuteWebJS(web_ui, "BuildClothingPresetSelect('"..name.."', "..id..");")
    end
end

--Weapon list
function GetWeaponsList()
    for i, v in ipairs(__Weapons_list) do
        local name = v[1]
        local id = v[2]
        ExecuteWebJS(web_ui, "BuildWeaponsSelect('"..name.."', "..id..");")
    end
end

-- tp list
function GetTpList(ui)
    local i = 0
    for k, v in ipairs(__PosPreset) do
        i = i + 1
        local name = v[1]
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

function SetDropItemList(DropedList)
    ExecuteWebJS(web_ui, 'ClearDropedItemListSelect()')

    for k, v in ipairs(DropedList) do
        local id = v["id"]
        local player = v["player"]
        local pos = v["pos"]
        local model_name = v["model_name"]
        local quantity = tostring(v["quantity"])

        local str = string.format("BuildPDropedItemListSelect('%q - %q - %q - %q',  %q)", id, GetPlayerName(player), model_name, pos, id)

        ExecuteWebJS(web_ui, str)
    end
end
AddRemoteEvent("SetDropItemList", SetDropItemList)

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

-- Player cache list
function GetPlayerCacheList(ui)
    CallRemoteEvent("GetPlayerCacheList")
end

function SetPlayerCacheList(playersList)
    for k, v in ipairs(playersList) do
        local id = k
        local name = v[1]
        local acitve = v[2]


        local op

        if(acitve) then op = "connected" else op = "disconected" end
        ExecuteWebJS(web_ui, "BuildPlayerCacheListSelect('"..name.." - ("..op..")', "..id..");")
	end

end
AddRemoteEvent("SetPlayerCacheList", SetPlayerCacheList)


