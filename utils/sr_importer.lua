-- by dictateurfou
local importedFile = {}

function import(filename)
	if(importedFile[filename] == nil) then
		local f = assert(loadfile("packages/"..filename))
		importedFile[filename] = true
		print("-- loadead " .. filename)
		return f()
	end
end

import("utils/log.lua")
import("utils/system.lua")
import("account/config_account.lua")
import("account/server/sr_account.lua")
import("account/server/sr_account_manager.lua")
import("hub/server/sr_hub.lua")
import("cmd/server/sr_admin.lua")
import("cmd/server/sr_client.lua")
import("cmd/server/sr_teleport.lua")