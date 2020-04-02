local save_playerHeading

function create_charactere(player, json)
    local data = json_decode(json)

    local p = getplayer(player)

    local FullName = data.fn .. " " .. data.n

    p:setName(FullName)
    SetPlayerName(player, FullName)

    ChangeClothingPlayer(player, player, "kind", data.k)
    ChangeClothingPresetPlayer(player, player, data.k, tonumber(data.p))
    -- ChangeClothingPlayer(player, player, "hair", data.h)
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
    SetPlayerDimension(player, 1)
    if(save_playerHeading ~= nil) then
        SetPlayerHeading(player, save_playerHeading)
    end
end
AddRemoteEvent("RemoveCamUi", RemoveCamUi)

