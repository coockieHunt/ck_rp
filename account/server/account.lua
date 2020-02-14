-- setup var
playerData = {}

-- import package
playerData.ClassPlayer = import("account/class/player.lua")
db = import("database/connect.lua")

---- check player account
function OnPlayerSteamAuth(player)
    local steam_id = tostring(GetPlayerSteamId(player))
    
    if(steam_id == 0)then
        KickPlayer(player, "🚨 You are not connected steam 🚨")
    end
	local query = mariadb_prepare(db, _RequestSql.IfplayerAccountExist,
        steam_id)

    mariadb_async_query(db, query, OnAccountConnect, player)
end
AddEvent("OnPlayerSteamAuth", OnPlayerSteamAuth)

---- manage player account
function OnAccountConnect(player)
    if(mariadb_get_row_count() == 0)then
        CreatePlayerAccount(player)
    else
        LoadPlayerAccount(player)
    end
end

function OnPlayerDamage(player)
    local p = getplayer(player)

    p:setHealth(GetPlayerHealth(player))
    p:setArmor(GetPlayerArmor(player))
end
AddEvent("OnPlayerDamage", OnPlayerDamage)

-- new account
function CreatePlayerAccount(player)
    local steam_id = tostring(GetPlayerSteamId(player))
    local player_name = GetPlayerName(player)

    print("[SERVER] create new account steam_id : " ..steam_id)

    local query = mariadb_prepare(db,  _RequestSql.CreatePlayerAccount,
        steam_id,
        _New_account.health,
        _New_account.armor,
        player_name,
        _New_account.cash,
        _New_account.cash_account
    )

    mariadb_query(db, query)
    local id = mariadb_get_insert_id()


    SetPlayerName(player, player_name)
    SetPlayerHealth(player, _New_account.health)
    SetPlayerArmor(player, new_player_armor)

    local client_id = GetPlayerBySteamId(steam_id)

    createPlayerAcoount(client_id, id, 0, steam_id, _New_account.health, _New_account.armor, player_name, _New_account.cash, _New_account.cash_account)

end

-- load account

function LoadPlayerAccount(player)
    
    local steam_id = tostring(GetPlayerSteamId(player))

    print("> Load player account ("..steam_id..") ")


	local query = mariadb_prepare(db,  _RequestSql.GetPlayerAccount,
        steam_id)

	mariadb_async_query(db, query, OnAccountLoaded, player)
end

function OnAccountLoaded(player)
    if (mariadb_get_row_count() == 0) then
		KickPlayer(player, "😨 An error occured while loading your account 😨")
    else
        local steam_id = tostring(GetPlayerSteamId(player))
        local player_name = GetPlayerName(player)
        local result = mariadb_get_assoc(1)
        

        if(result['player_name'] ~= player_name) then
            player_name = result['player_name']
        end


        SetPlayerName(player, player_name)
        SetPlayerArmor(player, tonumber(result['armor']))
        SetPlayerHealth(player, tonumber(result['health']))

        local client_id = GetPlayerBySteamId(steam_id)

        createPlayerAcoount(client_id, result['id'], result['admin_level'], result['steam_id'], result['health'], result['armor'], player_name, result['cash'], result['cash_account'])
        AddPlayerChatAll( ('<span color="#%s">%s </>%s'):format("0438CE", GetPlayerName(player), " a rejoint le serveur"))
	end
end

---- Manage account list
--add
function createPlayerAcoount(client_id, id, admin, steamId, health, armor, name, cash, cash_account)
    
    local p = playerData.ClassPlayer.new(
        {
            ["id"] = id,
            ["id_client"] = client_id,
            ["admin"] = admin,
            ["steamId"] = steamId,
            ["health"] = health,
            ["armor"] = armor,
            ["name"] = name,
            ["cash"] =  cash,
            ["cash_account"] =  cash_account
        })

    table.insert(playerData, p)       
end

--remove
function OnPlayerQuit(player)
    DestroyPlayerData(player)
end
AddEvent("OnPlayerQuit", OnPlayerQuit)

function DestroyPlayerData(player)
    local steam_id = tostring(GetPlayerSteamId(player))
    for key, value in pairs(playerData) do
        if(value.steamId == steam_id) then
            table.remove(playerData, key)
        end
    end
end
