local save_playerHeading

local save_curent_character

local wall
local floor

function create_charactere(player, json)
    AddPlayerChat(player, "saved stuff")
    SaveAccountPlayer(player)
end
AddRemoteEvent("create_charactere", create_charactere)

function refrech_charactere(player, json)
    local data = json_decode(json)
    local p = getplayer(player)

    ChangeClothingPlayer(player, player, "hair", getIdByVar(data.gender, "hair", data.hair))
    ChangeClothingPlayer(player, player, "shirt", getIdByVar(data.gender, "shirt", data.shirt))
    ChangeClothingPlayer(player, player, "pants", getIdByVar(data.gender, "pants", data.pants))
    ChangeClothingPlayer(player, player, "shoes", getIdByVar(data.gender, "shoes", data.shoes))
    ChangeClothingPlayer(player, player, "body", getIdByVar(data.gender, "body", data.body))

    ChangeClothingColorPlayer(player, player, "hair", data.hairColor)
    ChangeClothingColorPlayer(player, player, "shirt", data.shirtColor)
    ChangeClothingColorPlayer(player, player, "pants", data.pantsColor)

    SetPlayerClothing(player)
end
AddRemoteEvent("refrech_charactere", refrech_charactere)

function changeGender(player, gender)
  


end
AddRemoteEvent("changeGender", changeGender)


function ErrorClient(player, json)
    local data = json_decode(json)

    local alert = ""

    local formKey = {
        ["fn"] = "First name", 
        ["n"] = "Name", 
        ["a"] = "Age",
        ["g"] = "Gender",
    }

    local formError = {
        ["nn"] = "must be a numeric value", 
        ["ath"] = "to hight", 
        ["atl"] = "to low", 
        ["empty"] = "must not be empty",
        ["ws"] = "must not contain spaces",
    }

    for k, v in pairs(data) do
        alert = string.format('%s <strong>%s</strong> : %s<br>', alert, formKey[v[1]], formError[v[2]])
    end

    SendAlert(player, "warning", "Error form", alert)
end
AddRemoteEvent("ErrorClient", ErrorClient)

function RotateCharacter(player, dir)
    local curentPh = GetPlayerHeading(player)


    local newPh = 0

    local step = _Character_creation.form.rotate_step

    if(dir == "right")then
        newPh = curentPh + step
    end

    if(dir == "left")then
        newPh = curentPh - step
    end

    SetPlayerHeading(player, newPh)
end
AddRemoteEvent("RotateCharacter", RotateCharacter)

function SetCam(player, dir)
    if(dir == "head") then
        CallRemoteEvent(player, "SetCameraHead")
    end

    if(dir == "body") then
        CallRemoteEvent(player, "SetCameraBody")
    end

    if(dir == "reset") then
        SetPlayerHeading(player, 170)
    end
end
AddRemoteEvent("SetCam", SetCam)
