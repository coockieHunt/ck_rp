function AdminLevel(playerid, level)
    local data = getplayer(playerid)
    
	if(tonumber(data.admin) < tonumber(level)) then
		return false
	else
		return true
	end
end