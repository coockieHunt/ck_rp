---- get player info
function getplayer(player)
    local steam_id = tostring(GetPlayerSteamId(tonumber(player)))
    for key, value in pairs(playerData) do
        if(value.steamId == steam_id) then
            return value
        end
    end
    return KickPlayer(player, "😨 An error occured while loading your account 😨 (EC 003)")
end


function SaveAccountPlayer(player, filter)
    if isnil(filter) then filter = "all" end

    local query
    local steam_id = tostring(GetPlayerSteamId(player))
    local Data = {}
    for key, value in pairs(playerData) do
        if(value.steamId == steam_id) then
            Data = value
        end
    end

    if filter == "all" then
        query = mariadb_prepare(db, _RequestSql.SaveAccount,
            Data.name,
            Data.cash,
            Data.cash_account,
            Data.health,
            Data.armor,
            Data.food,
            Data.thirst,
            Data.MaxWeight,
            Data.CurWeight,
            Data.inventory,
            Data.clothing,
            Data.steamId
        )
            
    end

    if filter == "inventoy" then
        query = mariadb_prepare(db, _RequestSql.SaveAccountInventory,
            Data.MaxWeight,
            Data.CurWeight,
            Data.inventory,
            Data.steamId
        )
    end

    if filter == "clothing" then
        query = mariadb_prepare(db, _RequestSql.SaveAccountClothing,
            Data.clothing,
            Data.steamId
        )
    end

    if filter == "surival" then
        query = mariadb_prepare(db, _RequestSql.SaveAccountSurvival,
            Data.health,
            Data.armor,
            Data.food,
            Data.thirst,
            Data.steamId
        )
    end

    if filter == "cash" then
        query = mariadb_prepare(db, _RequestSql.SaveAccountCash,
            Data.cash,
            Data.cash_account,
            Data.steamId
        )
    end

    mariadb_query(db, query)

    ShowIconSaveClient(player)
end

function DestroyPlayerData(steam_id)
    for key, value in pairs(playerData) do
        if(value.steamId == tostring(steam_id)) then
            table.remove(playerData, key)
        end
    end
end

function OnPlayerQuit(player)
    setPlayerActive(player, false)
end
AddEvent("OnPlayerQuit", OnPlayerQuit)

function OnPlayerDamage(player)
    local p = getplayer(player)

    p:setHealth(GetPlayerHealth(player))
    p:setArmor(GetPlayerArmor(player))
end
AddEvent("OnPlayerDamage", OnPlayerDamage)