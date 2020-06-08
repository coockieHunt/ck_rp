-- setup var
playerData = {}

-- import package
playerData.ClassPlayer = import("account/class/player.lua")
db = import("database/connect.lua")

---- check player account
function OnPlayerSteamAuth(player)
    local steam_id = tostring(GetPlayerSteamId(player))
    
    if(steam_id == 0)then
        KickPlayer(player, "🚨 You are not connected steam 🚨 (EC 001)")
    end
	local query = mariadb_prepare(db, _RequestSql.IfplayerAccountExist,
        steam_id)

    mariadb_async_query(db, query, OnAccountConnect, player)
end
AddEvent("OnPlayerSteamAuth", OnPlayerSteamAuth)

function OnAccountConnect(player)
    if mariadb_get_row_count() == 0 then
        CreatePlayerAccount(player)
    else
        local steam_id = tostring(GetPlayerSteamId(player))

        local query = mariadb_prepare(db, _RequestSql.CheckIfBanAccount, steam_id)

        mariadb_async_query(db, query, IfAccountBan, player)
    end
end

function IfAccountBan(player)
    if mariadb_get_row_count() == 0 then
        LoadPlayerAccount(player)
    else
        local steam_id = tostring(GetPlayerSteamId(player))

        print("> An entry and detected for account (".. steam_id ..") in the ban list. verification .. ")

        local result = mariadb_get_assoc(1)
        local sql_date = result["end"]

        local ban_status = os.difftime(DateTimeConvertLua(sql_date),  GetSystemTime())

        if ban_status < 0 then
            print("> ban deadline has been exceeded entry deactivation")

            local query = mariadb_prepare(db, _RequestSql.SetActiveBanAccount,
                0,
                result["id"]
            )

            mariadb_query(db, query)

            LoadPlayerAccount(player)
        else
            print("> entry is valid player kicked")
            KickPlayer(player, "ban until : " ..result["end"] .." [" ..result["by"] .." | "..result["reason"] .."]")
        end
    end
end

function LoadPlayerAccount(player)
    
    local steam_id = tostring(GetPlayerSteamId(player))

    if(IfCachedPlayer(player)) then
        print("> Load player account by CACHE ("..steam_id..") ")
        OnAccountLoadedCache(player)
    else
        print("> Load player account by SQL ("..steam_id..") ")
        local query = mariadb_prepare(db,  _RequestSql.GetPlayerAccount, steam_id)

        mariadb_async_query(db, query, OnAccountLoadedSql, player)
    end
end

function OnAccountLoadedCache(player)
    local p = getplayer(player)

    local ValidClothing = SetPlayerClothing(player)
    if (ValidClothing ~= true) then
        print("> character not create, opening character customize dialog on the player client")
        OpenDialogClient(player, "newCharacter")
    end

    player_name = p.name
    SetPlayerArmor(player, p:getHealth())
    SetPlayerHealth(player, p:getArmor())
    setPlayerActive(player, true)
	OnPlayerLoadComplete(player)
end

function OnAccountLoadedSql(player)
    if (mariadb_get_row_count() == 0) then
        KickPlayer(player, "😨 An error occured while loading your account 😨 (EC 002)")
        print("> Error loading player account ("..steam_id..")  ")
    else
        local player_name = GetPlayerName(player)
        local result = mariadb_get_assoc(1)
        

        if(result['player_name'] ~= player_name) then
            player_name = result['player_name']
        end

        SetPlayerName(player, player_name)
        SetPlayerArmor(player, tonumber(result['armor']))
        SetPlayerHealth(player, tonumber(result['health']))

        createPlayerAccount(player, player_name, result)
        local ValidClothing = SetPlayerClothing(player)
        if (ValidClothing ~= true) then
            print("> character not create, opening character customize dialog on the player client")
            OpenDialogClient(player, "newCharacter")
        end

        setPlayerActive(player, true)
        OnPlayerLoadComplete(player)
	end
end


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
            ["coolDown_interact"] =  {},
            ["active"] =  true,
            ["backup_status"] =  true,
            ["hit_type"] =  0,
        })

    table.insert(playerData, p)       
end