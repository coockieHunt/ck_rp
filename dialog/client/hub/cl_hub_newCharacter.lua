local new_character

-- manage ui
function OpenUINewCharacter()
    if new_character ~= nil then
        ShowMouseHub(true)
        LockPlayerInput(true)
        SetWebVisibility(new_character, WEB_VISIBLE)

        setupCamUi(GetPlayerId())
    end
end
AddRemoteEvent("OpenUINewCharacter", OpenUINewCharacter)


function CloseUINewCharacter()
    ShowMouseHub(false)
    LockPlayerInput(false)
    SetWebVisibility(new_character, WEB_HIDDEN)


    RemoveCamUi(GetPlayerId())
end

function OnWebLoadComplete(webid)
    local playerId = GetPlayerId()
    
	if (new_character == webid) then
        Delay(500, function(webid, playerid)
            local min_age = __CharacterConfig.form.min_age
            local max_age = __CharacterConfig.form.max_age
        
            ExecuteWebJS(new_character, "setFormAge('"..max_age.."', '"..min_age.."')")
		end, new_character, playerId)
	end
end
AddEvent("OnWebLoadComplete", OnWebLoadComplete)

-- package manager
function OnPlayerSpawn()
    new_character = CreateWebUI(0, 0, 0, 0, 1, 60)
    LoadWebFile(new_character,'http://asset/' .. GetPackageName() .. '/dialog/files/ui_new_character.html')
    SetWebAlignment(new_character, 0.0, 0.0)
    SetWebAnchors(new_character, 0.0, 0.0, 1.0, 1.0)
    SetWebVisibility(new_character, WEB_HIDDEN)
end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)

function setupCamUi(player)
    local x, y, z  = GetPlayerLocation(player)
    ShowChat(false)
    CallRemoteEvent("setupCamUi")
    CallRemoteEvent("saveCurrentCharacter")
    SetCameraLocation(x - 200, y - 30, z + 70,true)
    SetCameraRotation(- 20, 0, 0, true)

end

function RemoveCamUi(player)
    ShowChat(true)
    CallRemoteEvent("RemoveCamUi")
    SetCameraLocation(0, 0, 0, false)
    SetCameraRotation(0, 0, 0, false)
end

-- call ui
function CallInfoValid()
    CallRemoteEvent("create_charactere")
    CloseUINewCharacter()
end
AddEvent("CallInfoValid", CallInfoValid)

function CallInfoError(error_json)
    CallRemoteEvent("ErrorClient", error_json)
end
AddEvent("CallInfoError", CallInfoError)

function CallRefrechCharacterPreview(info_json)
    CallRemoteEvent("refrech_charactere", info_json)
end
AddEvent("CallRefrechCharacterPreview", CallRefrechCharacterPreview)

function CallChangeGender(gender)
    ExecuteWebJS(new_character, "clearPartSelect()")
    
    
    for i, v in pairs(__CharacterConfig.clothing[gender]) do
        local part = i
        for _, v in ipairs(v) do
            local name = GetClothingNameByVar(gender, part, v)
            ExecuteWebJS(new_character, "setPartSelection('"..part.."','"..name.."','"..v.."')")
        end
    end

    for i, v in ipairs(__CharacterConfig.form.color) do
        ExecuteWebJS(new_character, "setColorSelection('"..v.."')")
    end

    CallRemoteEvent("changeGender", gender)
end
AddEvent("CallChangeGender", CallChangeGender )

function CallRotate(dir)
    CallRemoteEvent("RotateCharacter", dir)
end
AddEvent("CallRotate", CallRotate)


function CallSetCam(pos)
    CallRemoteEvent("SetCam", pos)
end
AddEvent("CallSetCam", CallSetCam)

