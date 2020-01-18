---- get player info
function getplayer(player)
    local steam_id = tostring(GetPlayerSteamId(player))
    for key, valeu in pairs(playerData) do
        if(valeu.steamId == steam_id) then
            return valeu
        end
    end
end

---- sav
function OnPlayerSpawn(playerid)
    CreateTimer(function(playerid)
        SaveAccountPlayer(playerid)
        LogPlayerChat(playerid, "info", "auto", "auto save account")
	end, Config_other_account:case("save_time"), playerid)
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

    local query = mariadb_prepare(db, Request_account:case("SaveAccount"),
        Data.cash,
        Data.cash_account,
        Data.health,
        Data.armor,
		Data.steamId
	)
        
	mariadb_query(db, query)
end