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

---- sav
function OnPlayerSpawn(playerid)
    CreateTimer(function(playerid)
        SaveAccountPlayer(playerid)
	end, _Account_timer.save_account_time, playerid)
end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)

function SaveAccountPlayer(player)
	local steam_id = tostring(GetPlayerSteamId(player))
    local Data = {}
    for key, value in pairs(playerData) do
        if(value.steamId == steam_id) then
            Data = value
        end
    end

    local query = mariadb_prepare(db, _RequestSql.SaveAccount,
        Data.cash,
        Data.cash_account,
        Data.health,
        Data.armor,
        Data.food,
        Data.thirst,
        Data.MaxWeight,
        Data.CurWeight,
        Data.inventory,
        Data.steamId
	)
        
    mariadb_query(db, query)
    
    ShowIconSaveClient(player)
end