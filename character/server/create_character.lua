function create_charactere(player, json)
    local data = json_decode(json)

    print(data.n)
    print(data.fn)
    print(data.a)
    print(data.k)
    print(data.p)

    local p = getplayer(player)

    local FullName = data.fn .. " " .. data.n

    p:setName(FullName)
    SetPlayerName(player, FullName)

    ChangeClothingPlayer(player, player, "kind", data.k)
    ChangeClothingPresetPlayer(player, player, data.k, tonumber(data.p))
end
AddRemoteEvent("create_charactere", create_charactere)
