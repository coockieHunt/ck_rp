local admin_ui
local admin_key = "F5"

-- manage ui
function OpenUIAdmin()
    if admin_ui ~= nil then
        SetIgnoreLookInput(true)
        SetIgnoreMoveInput(true)
        ShowMouseCursor(true)
        SetInputMode(INPUT_GAMEANDUI)
        SetWebVisibility(admin_ui, WEB_VISIBLE)
        CloseUISurvival_warn()
        
        BuildSelect()
    end
end

function CloseUIAdmin()
    SetIgnoreLookInput(false)
    SetIgnoreMoveInput(false)
    ShowMouseCursor(false)
    SetInputMode(INPUT_GAME)
    SetWebVisibility(admin_ui, WEB_HIDDEN)
    OpenUISurvival_warn()
end

-- package manager
function OnPackageStart()
    admin_ui = CreateWebUI(0, 0, 0, 0, 1, 60)
    LoadWebFile(admin_ui,'http://asset/' .. GetPackageName() .. '/admin/files/ui_admin.html')
    SetWebAlignment(admin_ui, 0.0, 0.0)
    SetWebAnchors(admin_ui, 0.0, 0.0, 1.0, 1.0)
    SetWebVisibility(admin_ui, WEB_HIDDEN)
end
AddEvent("OnPackageStart", OnPackageStart)

-- key
AddEvent("OnKeyPress", function(key)
    if key == admin_key then
        if GetWebVisibility(admin_ui) == WEB_HIDDEN then
            OpenUIAdmin()
        else
            CloseUIAdmin()
        end
    end
end)

-- call ui
function CallExecute(rslt)
    CallRemoteEvent("Exucute", rslt)
    CloseUIAdmin()
end
AddEvent("CallExecute", CallExecute)

function CallClose()
    CloseUIAdmin()
end
AddEvent("CallClose", CallClose)


-- Get List build select form
function BuildSelect()
    GetCarList()
    GetPlayerList()
    GetClothingPresetList()
    GetWeaponsList()
end

function GetCarList()
    for i, v in ipairs(VEHICLE_DATA) do
        local name = v['name']
        local alias = VEHICLE_DATA[i]['alias'][1]
        local id = i
        ExecuteWebJS(admin_ui, "BuildVehicleSelect('"..name.."', "..id..");")
    end
end


function GetClothingPresetList()
    for i, v in ipairs(CLOTHING_PRESET_DATA) do
        local name = v['name']
        local alias = CLOTHING_PRESET_DATA[i]['alias'][1]
        local id = i
        ExecuteWebJS(admin_ui, "BuildClothingPresetSelect('"..name.."', "..id..");")
    end
end

function GetWeaponsList()
    for i, v in ipairs(WEAPON_DATA) do
        local name = v['name']
        local alias = WEAPON_DATA[i]['alias'][1]
        local id = i
        ExecuteWebJS(admin_ui, "BuildWeaponsSelect('"..name.."', "..id..");")
    end
end

function GetPlayerList()
    CallRemoteEvent("GetAllPlayer")
end

function SetPlayerList(players)
    for k, v in ipairs(players) do
        local id = k
        local name = v[1]
        ExecuteWebJS(admin_ui, "BuildPlayerListSelect('"..name.."', "..id..");")
	end

end
AddRemoteEvent("SetPlayerList", SetPlayerList)


