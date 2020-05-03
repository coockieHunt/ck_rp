function AddAdminLog(player, msg)
    local text = FormatLogAdmin(player, msg)
    
    if get_os_name() == "Windows" then
        file = io.open(_Log_file.folder.."/".._Log_file.admin, "a")
        file:write(text, "\n")
        file:close()
    end

    if get_os_name() == "Linux" then
        
    end
end

function AddLoginLog(player)
	local time = GetSystemTime()
    local text = "[login] ("..time..") - connected "..GetPlayerName(player)

    print(". " .. text)

    -- file = io.open(_Log_file.folder.."/".._Log_file.login, "a")
	-- file:write(text, "\n")
	-- file:close()
end

function LogPlayerChat(player, color, type, message)
    local hex = _Log_color[color]
    if(isnil(hex)) then hex = color end
    AddPlayerChat(player, ('<span color="#%s">[%s] </>%s'):format(hex, type, message))
end

function LogPlayerChatAll(player, color, type, message)
    local hex = _Log_color[color]
    if(isnil(hex)) then hex = color end
    AddPlayerChat(player, ('<span color="#%s">[%s] </>%s'):format(hex, type, message))
end

function LogCommandeChat(player, cmd, exists)
    local time = GetSystemTime()
    local text = "[commande] ("..time..") - "..GetPlayerName(player).. " execut Command '/"..cmd.."'"

    if not exists then
        LogPlayerChat(player, 'warning', "cmd", "Command '/"..cmd.."' not found!")
	end

    -- file = io.open(_Log_file.folder.."/".._Log_file.folder, "a")
	-- file:write(text, "\n")
	-- file:close()
end

--function 
function FormatLogAdmin(player, msg)
    local time = GetSystemTime()
    local steam_id = GetPlayerSteamId(player)
    local name = GetPlayerName(player)
    
    local rslt = "[admin] ("..steam_id.." | "..name.." - ".. time..") - "..msg 
    return rslt
end


