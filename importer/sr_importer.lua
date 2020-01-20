-- by dictateurfou
local importedFile = {}
local importedPacakge= {}

function import(filename)
	if(importedFile[filename] == nil) then
		local f = assert(loadfile("packages/"..filename))
		importedFile[filename] = true
		return f()
	end
end

function importFile(filename)
	import(filename)
	print("-- loadead " .. filename)
end	

importFile("utils/system.lua")
importFile("importer/config.lua")

function packagesImport(pacakgeName)
	if(importedPacakge[pacakgeName] == nil) then
		local package = false
		if(FolderExist("packages/"..pacakgeName)) then
			print("-- loadead package : " .. pacakgeName)
			package = "packages/"..pacakgeName
			local filesPacakge = GetFilesFolder(package)
			if(has_value(filesPacakge, 'config.lua')) then
				import(pacakgeName.."/"..config_pacakge:case("config_file"))
			end
			if(has_value(filesPacakge, config_pacakge:case("server_folder"))) then
				filesPacakgeServer = GetFilesFolder(package.."/"..config_pacakge:case("server_folder"))
				for index, value in ipairs(filesPacakgeServer) do
					import(pacakgeName.."/"..config_pacakge:case("server_folder").."/"..value)
				end
			end
						
		end
	end
end

packagesImport("log")
packagesImport("init")
packagesImport("account")
packagesImport("hub")
packagesImport("cmd")