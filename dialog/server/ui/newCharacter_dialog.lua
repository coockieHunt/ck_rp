local dialog = {
    id = "newCharacter",
    key = false,
    type = 'permanent',
    dysplay_on_spawn = false,
    view = "ui_new_character.html",
    z_order = 2,
    frame_rate = 60
}

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
    ExecWebJs(PlayerId, dialog.id, "clearPartSelect()")

    local clothing = {}

    for part, data in pairs(_Character_creation.clothing[gender]) do
        local list = {}


        if gender == 'men' then list = _Clothing_men end
        if gender == 'women' then list = _Clothing_women end

        if type(data) == 'boolean' and data == true then
            local first_element = list[part][1]['var']

            clothing[part] = first_element

            for _, v in ipairs(list[part]) do
                local var = v['var']
                local name = v['name']
    
                ExecWebJs(PlayerId, dialog.id, "setPartSelection('"..part.."','"..name.."','"..var.."')")
            end
        end

        if type(data) == 'table' and data ~= true then
            local first_element = data[1]

            clothing[part] = first_element

            for _, var in ipairs(data) do
                local name = GetNameByVar(gender, part, var)
    
                ExecWebJs(PlayerId, dialog.id, "setPartSelection('"..part.."','"..name.."','"..var.."')")
            end
        end

    end

    for i, v in ipairs(_Character_creation.form.color) do
        ExecWebJs(PlayerId, dialog.id, "setColorSelection('"..v.."')")
    end

    for NewPart, NewId in pairs(clothing) do
        local var =  getIdByVar(gender, NewPart, NewId)
        ChangeClothingPlayer(PlayerId, PlayerId, NewPart, var)
    end

    ChangeClothingPlayer(PlayerId, PlayerId, "gender", gender)


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

