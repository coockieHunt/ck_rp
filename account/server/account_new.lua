function createPlayerAccount(player, name, data)
    if(isnil(data['admin_level'])) then data['admin_level'] = 0 end
    local steam_id = tostring(GetPlayerSteamId(player))
    local client_id = GetPlayerBySteamId(steam_id)

    local p = playerData.ClassPlayer.new(
        {
            ["id_client"] = client_id,
            ["name"] = name,
            ["id"] = data['id'],
            ["admin"] = data['admin_level'],
            ["steamId"] = data['steam_id'],
            ["health"] = data['health'],
            ["armor"] = data['armor'],
            ["food"] = data['food'],
            ["thirst"] = data['thirst'],
            ["MaxWeight"] = data['max_weight'],
            ["CurWeight"] = data['cur_weight'],
            ["cash"] =  data['cash'],
            ["cash_account"] =  data['cash_account'],
            ["inventory"] =  data['inventory'],
            ["clothing"] =  data['clothing'],
            ["clothing_color"] =  data['clothing_color'],
            ["alert_count"] =  0,
            ["active"] =  true,
            ["backup_status"] =  true,
        })

    table.insert(playerData, p)       
end