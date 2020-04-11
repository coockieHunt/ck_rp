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

function IfCachedPlayer(player)
    local steam_id = tostring(GetPlayerSteamId(tonumber(player)))
    for key, value in pairs(playerData) do
        if(value.steamId == steam_id) then
            return true
        end
    end
    return false
end

function OnPackageStart()
        local backup = CreateTimer(function()
            if(tablelength(playerData) > 0) then
                local countSaved = 0
                for key, value in pairs(playerData) do
                    if(value.active and value.backup_status) then
                        countSaved = countSaved + 1
                        SaveAccountPlayer(value.id_client)
                    end
                end
                
                if(countSaved > 0) then print("> Automatic backup account: "..countSaved.." backup") end
            end
        end, _Account_timer.save_account_time)
end
AddEvent("OnPackageStart", OnPackageStart)

function SaveAccountPlayer(player)
	local steam_id = tostring(GetPlayerSteamId(player))
    local Data = {}
    for key, value in pairs(playerData) do
        if(value.steamId == steam_id) then
            Data = value
        end
    end

    local query = mariadb_prepare(db, _RequestSql.SaveAccount,
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