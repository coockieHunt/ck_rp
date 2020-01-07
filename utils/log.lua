local admin_log_file = "admin_log.txt"
local login_log_file = "login_log.txt"

function AddAdminLog(player, msg)
    local text = FormatLog(player, msg)
    
    print(". " .. text)

    file = io.open(admin_log_file, "a")
	file:write(text, "\n")
	file:close()
end

function AddLoginLog(player)
	local time = GetSystemTime()
    local text = "[login] ("..time..") - connected"..player

    print(". " .. text)

    file = io.open(admin_log_file, "a")
	file:write(text, "\n")
	file:close()
end

--function 
function FormatLog(player, msg)
    local time = GetSystemTime()
    local steam_id = GetPlayerSteamId(player)
    local name = GetPlayerName(player)
    
    local rslt = "[admin] ("..steam_id.." | "..name.." - ".. time..") - "..msg 
    return rslt
end


