function admin_GetBanList(player)
	local _disable = false

    if(not isnil(player)) then
        local steamId = tostring(GetPlayerSteamId(player))
        local query = mariadb_prepare(db, _RequestSql.CheckIfBanAccountAll, steamId)

        mariadb_async_query(db, query, buildList, player)
    end
end

function buildList(player)
    if (mariadb_get_row_count() == 0) then
        print("empty")
    else
        local count = mariadb_get_row_count()

        for i = 1, count do
            local result = mariadb_get_assoc(i)
            CallRemoteEvent(player, "setBanList", result['active'], result['by'], result['at'], result['end'], result['reason'])
        end

	end
end
