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

function AddPackageLog(package, type, bool)
	local text
	local log_file_text
	local time = GetSystemTime()

	if(bool) then
		if(type == "package") then text = "loadead package : "..package end
		if(type == "file") then text = "loadead script : "..package end
		log_file_text = "[pacakge] (".. time..") - "..package
	else
		if(type == "package") then text = " /!\\ package not found : "..package end
		if(type == "file") then text = "/!\\ script not found : "..package end
		log_file_text = "[pacakge] (".. time..") - /!\\ "..package.." not found"
		ServerExit("error loading server file")
	end

	print("-- " .. text)
	
    file = io.open(_Pacakge.log_file, "a")
	file:write(log_file_text, "\n")
	file:close()
end

import("utils/system.lua")
import("utils/json.lua")

function packagesImport(packageName)
	if(_Import_packag == nil) then
		local package = false
		local folder = "packages/ck_rp/"..packageName
		if(FolderExist(folder)) then
			if(_Pacakge.display_console) then AddPackageLog(packageName, "package", true) end
			local filesPacakge = GetFilesFolder(folder)
			if(has_value(filesPacakge, _Pacakge.server_folder)) then

				filesPacakgeServer = GetFilesFolder(folder.."/".._Pacakge.server_folder)

				for index, value in ipairs(filesPacakgeServer) do

					if(GetFileExtension(value) == ".lua") then 
						import(packageName.."/".._Pacakge.server_folder.."/"..value)
					else
						local subDir = GetFilesFolder(folder.."/".._Pacakge.server_folder.."/"..value)
						for index, SubValue in ipairs(subDir) do
							import(packageName.."/".._Pacakge.server_folder.."/"..value.."/"..SubValue)
						end
					end

				end
			end
		else
			if(_Pacakge.display_console) then AddPackageLog(packageName, "package", false) end
		end
	end
end

function OnPackageStart()
	for i, v in ipairs (_Import_package) do
		packagesImport(v)
	end
end
AddEvent("OnPackageStart", OnPackageStart)


