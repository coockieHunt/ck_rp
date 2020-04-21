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