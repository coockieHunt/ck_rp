function AdminLevel(playerid, level)
    local data = getplayer(playerid)
    
	if(tonumber(data.admin) < tonumber(level)) then
		return false
	else
		return true
	end
end

function CheckIfAdminSufficient(func, playerid)
	local data = getplayer(playerid)

	if(tonumber(data.admin) < tonumber(_Dialog_admin.section[func]["level"])) then
		return false
	else
		return true
	end
end