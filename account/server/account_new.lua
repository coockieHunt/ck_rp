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
        _New_account.weight_character,
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