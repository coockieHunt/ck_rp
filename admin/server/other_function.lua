function admin_fc(player, disable)
	local _disable = false

	if disable ~= nil then
		_disable = true
	end
	_disable = not _disable

	SetPlayerSpectate(player, _disable)
	AddAdminLog(player, GetPlayerName(player).." spectate")
end

function admin_pos(player)
	AddAdminLog(player, " save pos")
	local x, y, z = GetPlayerLocation(player)
	local h = GetPlayerHeading(player)
	local text = x..", "..y..", "..z..", "..h
	file = io.open("pos.txt", "a")
	file:write(text, "\n")
	file:close()
end

function admin_debug(player, print)
	file = io.open("debug.txt", "a")
	file:write(print, "\n")
	file:close()
end

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