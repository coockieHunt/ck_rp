function AddAdminLog(player, msg)
    local text = FormatLog(player, msg)
    
    print(". " .. text)
    LogPlayerChat(player, "ok", "admin", msg)

    file = io.open(config_log_file:case("admin"), "a")
	file:write(text, "\n")
	file:close()
end

function AddLoginLog(player)
	local time = GetSystemTime()
    local text = "[login] ("..time..") - connected"..player

    print(". " .. text)

    file = io.open(config_log_file:case("login"), "a")
	file:write(text, "\n")
	file:close()
end

function LogPlayerChat(player, color, type, message)
    local hex = config_log_color:case(color)
    if(isnil(hex)) then hex = color end
    AddPlayerChat(player, ('<span color="#%s">[%s] </>%s'):format(hex, type, message))
end

--function 
function FormatLog(player, msg)
    local time = GetSystemTime()
    local steam_id = GetPlayerSteamId(player)
    local name = GetPlayerName(player)
    
    local rslt = "[admin] ("..steam_id.." | "..name.." - ".. time..") - "..msg 
    return rslt
end


