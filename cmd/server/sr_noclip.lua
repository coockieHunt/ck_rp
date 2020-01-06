local noclipers = {}

function noclip(ply)
    if(AdminLevel(player, 1)) then return AddPlayerChat(player, "not admin")end
    print_cmd("noclip", ply, ply)
	AdminLog(GetPlayerName(ply) .. " enter noclip mode")
    if (noclipers[tostring(ply)]==nil) then
        noclipers[tostring(ply)] = true
   CallRemoteEvent(ply, "Setnoclip" , true )
    else
        if (noclipers[tostring(ply)]==true) then
            noclipers[tostring(ply)] = false
            CallRemoteEvent(ply, "Setnoclip" , false )
        else
            noclipers[tostring(ply)] = true
             CallRemoteEvent(ply, "Setnoclip" , true )
        end
    end
end

AddRemoteEvent("Setnoclipserver", function(ply,bool)
    noclipers[tostring(ply)] = bool
  end)
AddCommand("noclip", noclip)

function tp_noc(ply,x,y,z)
    SetPlayerLocation(ply, x, y, z)
end

AddRemoteEvent("tp_noc", tp_noc )

--utils
function AdminLevel(playerid, level)
	local data = getplayer(playerid)

	if(tonumber(data.admin) < tonumber(level)) then
		return true
	end

	return false
end

function AdminLog(print)
	local time = os.time(os.date("!*t"))
	file = io.open("admin_log.txt", "a")
	file:write("[admin] ("..time..") : "..print, "\n")
	file:close()
end

function print_cmd(spawn, id, player)
	print("> [ADMIN] cmd spawn "..spawn..", id : "..id..", player : "..GetPlayerName(player).." ")
end