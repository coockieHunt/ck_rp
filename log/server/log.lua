function AddAdminLog(player, msg)
    local text = FormatLogAdmin(player, msg)
    
    file = io.open(_Log_file.admin, "a")
    file:write(text, "\n")
    file:close()
end

function AddLoginLog(player)
	local time = GetSystemTime()
    local text = "[login] ("..time..") - connected "..GetPlayerName(player)

    file = io.open(_Log_file.login, "a")
	file:write(text, "\n")
	file:close()
end

function LogCommandeChat(player, cmd, exists)
    local time = GetSystemTime()
    local text = "[commande] ("..time..") - "..GetPlayerName(player).. " execut Command '/"..cmd.."'"

    if not exists then
        AddPlayerChat(player, ('<span color="#D76735">[server] </>%s command not exist '):format(cmd))
	end

    file = io.open(_Log_file.commande, "a")
	file:write(text, "\n")
	file:close()
end

--function 
function FormatLogAdmin(player, msg)
    local time = os.time(os.date('*t'))
    local steam_id = GetPlayerSteamId(player)
    local name = GetPlayerName(player)
    
    local rslt = "[admin] ("..steam_id.." | "..name.." - ".. time..") - "..msg 
    return rslt
end


