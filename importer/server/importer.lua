-- by dictateurfou
local importedFile = {}
local importedPacakge= {}

function import(filename)
	if(importedFile[filename] == nil) then
		local f = assert(loadfile("packages/ck_rp/"..filename))
		importedFile[filename] = true
		return f()
	end
end

import("config.lua")


function AddPackageLog(package, type)
	local text = ""
    local time = GetSystemTime()

	if(type == "package") then text = "loadead package : "..package end
	if(type == "file") then text = "loadead script : "..package end

	print("-- " .. text)
	
    file = io.open(_Pacakge.log_file, "a")
	file:write("[pacakge] (".. time..") - "..package, "\n")
	file:close()
end



import("utils/system.lua")
import("utils/json.lua")

function importFile(filename)
	import(filename)
	if(_Pacakge.display_console) then AddPackageLog(filename, "file") end
end	

function packagesImport(packageName)
	if(_Import_packag == nil) then
		local package = false
		if(FolderExist("packages/ck_rp/"..packageName)) then
			if(_Pacakge.display_console) then AddPackageLog(packageName, "package") end
			package = "packages/ck_rp/"..packageName
			local filesPacakge = GetFilesFolder(package)
			if(has_value(filesPacakge, _Pacakge.server_folder)) then
				filesPacakgeServer = GetFilesFolder(package.."/".._Pacakge.server_folder)
				for index, value in ipairs(filesPacakgeServer) do
					import(packageName.."/".._Pacakge.server_folder.."/"..value)
				end
			end
						
		end
	end
end

function OnPackageStart()
	for i, v in ipairs (_Import_package) do
		packagesImport(v)
	end
end
AddEvent("OnPackageStart", OnPackageStart)


