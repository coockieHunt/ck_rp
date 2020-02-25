local key = {}

function GetKeyMapServer(id)
    return key[id]
end

function GetKeyMap(key_config)
    key = key_config
end
AddRemoteEvent("GetKeyMap", GetKeyMap)

local function OnPlayerSpawn()
    CallRemoteEvent('GetServerKeyMap')
end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)