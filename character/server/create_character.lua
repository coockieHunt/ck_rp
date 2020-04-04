local save_playerHeading

function create_charactere(player, json)
    local data = json_decode(json)

    local p = getplayer(player)

    local FullName = data.fn .. " " .. data.n


    p:setName(FullName)
    SetPlayerName(player, FullName)

    ChangeClothingPlayer(player, player, "kind", data.k)
    ChangeClothingPresetPlayer(player, player, data.k, tonumber(data.p))
    ChangeClothingPlayer(player, player, "hair", data.h)

    ChangeClothingColorPlayer(player, player, "hair", data.hc)
    ChangeClothingColorPlayer(player, player, "shirt", data.hs)
    ChangeClothingColorPlayer(player, player, "pants", data.hp)

    SetPlayerClothing(player)

    AddPlayerChat(player, "saved stuff")
end
AddRemoteEvent("create_charactere", create_charactere)

function setupCamUi(player)
    local x, y, z  = GetPlayerLocation(player)
    save_playerHeading = GetPlayerHeading(player)

    SetPlayerHeading(player, 170)
    SetPlayerDimension(player, tonumber(player) + 1)
end
AddRemoteEvent("setupCamUi", setupCamUi)

function RemoveCamUi(player)
    SetPlayerDimension(player, 0)
    SetPlayerHeading(player, save_playerHeading)
end
AddRemoteEvent("RemoveCamUi", RemoveCamUi)


function refrech_charactere(player, json)
    local data = json_decode(json)
    local p = getplayer(player)

   

end
AddRemoteEvent("refrech_charactere", refrech_charactere)