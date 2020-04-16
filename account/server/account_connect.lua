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

    print("> create new account ("..steam_id..")")

    local query = mariadb_prepare(db,  _RequestSql.CreatePlayerAccount,
        steam_id,
        _New_account.health,
        _New_account.armor,
        _New_account.food,
        _New_account.thirst,
        _Inventory_account.weight_character,
        0,
        player_name,
        _New_account.cash,
        _New_account.cash_account,
        '{}',
        '{"clothing": {"gender": 0,	"body": 0,	"hair": 0,	"shirt": 0,	"accessory": 0,	"pants": 0,	"shoes": 0	},	"color": {"hair": 0, "shirt": 0, "pants": 0, "shoes": 0	}}'
    )

    mariadb_query(db, query)

    print("> wait for the creation of the account ...")

    Delay(1000, function()
        LoadPlayerAccount(player)
    end)
    
end

-- load account

function LoadPlayerAccount(player)
    
    local steam_id = tostring(GetPlayerSteamId(player))
    AddPlayerChatAll( ('<span color="#%s">%s </>%s'):format("0438CE", GetPlayerName(player), " a rejoint le serveur"))

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
        CallRemoteEvent(player, "OpenUINewCharacter")
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
            CallRemoteEvent(player, "OpenUINewCharacter")
        end

        setPlayerActive(player, true)
        OnPlayerLoadComplete(player)
	end
end
