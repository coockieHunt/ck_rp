function AdminLevel(playerid, level)
    local data = getplayer(playerid)
    
	if(tonumber(data.admin) < tonumber(level)) then
		return false
	else
		return true
	end
end

function OpenAdminMenu(playerId)
	if(AdminLevel(playerId, 1)) then
		CallRemoteEvent(playerId, 'OpenAdminMenuClient')
	end
end
AddRemoteEvent('OpenAdminMenu', OpenAdminMenu)
