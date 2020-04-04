function admin_fc(player, disable)
	local level = 1
	local _disable = false

	if(AdminLevel(player, level)) then
		if disable ~= nil then
			_disable = true
		end
		_disable = not _disable

		SetPlayerSpectate(player, _disable)
		AddAdminLog(player, GetPlayerName(player).." spectate")
	end
end

function admin_pos(player)
	local level = 1

	if(AdminLevel(player, level)) then
		AddAdminLog(player, " save pos")
		local x, y, z = GetPlayerLocation(player)
		local h = GetPlayerHeading(player)
		local text = x..", "..y..", "..z..", "..h
		file = io.open("pos.txt", "a")
		file:write(text, "\n")
		file:close()
	end
end