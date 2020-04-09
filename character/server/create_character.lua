local save_playerHeading

local save_curent_character

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
    local character_creation = _Character_creation.clothing

    ChangeClothingPlayer(player, player, "gender", gender)

    for k, v in pairs(character_creation[gender]) do
        ChangeClothingPlayer(player, player, k, getIdByVar(gender, k, v[1]))
        ChangeClothingPlayer(player, player, k, getIdByVar(gender, k, v[1]))
        ChangeClothingPlayer(player, player, k, getIdByVar(gender, k, v[1]))
        ChangeClothingPlayer(player, player, k, getIdByVar(gender, k, v[1]))
        ChangeClothingPlayer(player, player, k, getIdByVar(gender, k, v[1]))
    end
    ChangeClothingPlayer(player, player, "body", 1)


    SetPlayerClothing(player)

end
AddRemoteEvent("changeGender", changeGender)


function setupCamUi(player)
    local x, y, z  = GetPlayerLocation(player)
    save_playerHeading = GetPlayerHeading(player)
    CallRemoteEvent(player, "removeSkeletalMesh", "body")
    
    SetPlayerHeading(player, 170)
    SetPlayerDimension(player, tonumber(player) + 1)
end
AddRemoteEvent("setupCamUi", setupCamUi)

function RemoveCamUi(player)
    SetPlayerDimension(player, 0)
    SetPlayerHeading(player, save_playerHeading)
end
AddRemoteEvent("RemoveCamUi", RemoveCamUi)

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

