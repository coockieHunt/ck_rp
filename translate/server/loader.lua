local language = "english"

local translate = {}
translate_ready = false;

function OnPlayerJoin(playerId)

    local file = ("packages/"..GetPackageName().."/translate/server/local/"..language..".json")
    local fileContent = readFile(file)

    if fileContent == nil then
        if language ~= "english" then
            fileContent = readFile("packages/"..GetPackageName().."/translate/server/local/english.json")
        else
            ServerExit("Server shutdown translate file not valide")
        end
    end

    local translate_list = json_decode(fileContent)

    OnTranslateStart(playerId)
       

        translate = translate_list
        sendClient(playerId, translate_list)
    OnTranslateEnd(playerId)
end
AddEvent("OnPlayerJoin", OnPlayerJoin)

function sendClient(playerId, list)
    -- print(list.hello_string_test)
    CallRemoteEvent(playerId, "GetTranslate", list)
end

function _(string)
    return translate[string]
end

function OnTranslateStart(playerId)
    AddPlayerChat(playerId, "Loading translate please wait ...")
end

function OnTranslateEnd(playerId)
    AddPlayerChat(playerId, "Loading translate end !!")
    translate_ready = true
end