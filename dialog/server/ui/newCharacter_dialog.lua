local dialog = {
    id = "newCharacter",
    key = "nil",
    type = "press",
    dysplay_on_spawn = false,
    view = "ui_new_character.html"
}

function dialog:GetId()
    return dialog.id
end

function dialog:GetKey()
    return dialog.key
end

function dialog:GetDysplayOnSpawn()
    return dialog.dysplay_on_spawn
end

function dialog:GetView()
    return dialog.view
end

function dialog:GetType()
    return dialog.type
end

function dialog:onCreate(playerId, DialogId)

end

function dialog:onOpen(playerId, DialogId)
    setupCamUi(playerId)
    CloseDialogClient(playerId, "warning")
    CloseDialogClient(playerId, "alert")
end

function dialog:OnClose(playerId, DialogId)
    ShowMouse(playerId, false)
    FreezePlayerInput(playerId, false)

    RemoveCamUi(playerId)

    OpenDialogClient(playerId, "warning")
    OpenDialogClient(playerId, "alert")
end

function dialog:OnLoadComplete(playerId, DialogId)
    local min_age = _Character_creation.form.min_age
    local max_age = _Character_creation.form.max_age

    ExecWebJs(playerId, DialogId, "setFormAge('"..max_age.."', '"..min_age.."')")
end

AddDialog(dialog)

-- func
function ChangeGender(PlayerId, gender)
    ExecWebJs(PlayerId, dialog:GetId(), "clearPartSelect()")

    for i, v in pairs(_Character_creation.clothing[gender]) do
        local part = i
        for _, v in ipairs(v) do
            local name = GetNameByVar(gender, part, v)
            ExecWebJs(PlayerId, dialog:GetId(), "setPartSelection('"..part.."','"..name.."','"..v.."')")
        end
    end

    for i, v in ipairs(_Character_creation.form.color) do
        ExecWebJs(PlayerId, dialog:GetId(), "setColorSelection('"..v.."')")
    end

    local character_creation = _Character_creation.clothing

    ChangeClothingPlayer(PlayerId, PlayerId, "gender", gender)

    for k, v in pairs(character_creation[gender]) do
        ChangeClothingPlayer(PlayerId, PlayerId, k, getIdByVar(gender, k, v[1]))
    end 

    SetPlayerClothing(PlayerId)


end
AddRemoteEvent("ChangeGender", ChangeGender)


function setupCamUi(player)
    ShowMouse(player, true)
    FreezePlayerInput(player, true)

    local x, y, z  = GetPlayerLocation(player)
    local newDimension = tonumber(player) + 1

    setPlayerBackUp(player, false)

    save_playerHeading = GetPlayerHeading(player)
    
    local x, y, z  = GetPlayerLocation(player)
    
    if(_Character_creation.form.scene) then
        wall = CreateObject(1568, x + 320, y, z - 100)
        floor = CreateObject(1568, x + 320, y, z - 55)
    
        SetObjectRotation(floor, 90, 0,0)
        
        SetObjectDimension(wall, newDimension)
        SetObjectDimension(floor, newDimension)
    
        SetObjectScale(wall, 0, 50, 20)
        SetObjectScale(floor, 0, 50, 20)
    end

    SetPlayerHeading(player, 170)
    SetPlayerDimension(player, newDimension)

    CallRemoteEvent(player, "setupCamUi")

end

function RemoveCamUi(player)
    SetPlayerDimension(player, 0)
    SetPlayerHeading(player, save_playerHeading)

    setPlayerBackUp(player, true)

    if(_Character_creation.form.scene) then
        DestroyObject(wall)
        DestroyObject(floor)
    end


    CallRemoteEvent(player, "RemoveCamUi")
end

