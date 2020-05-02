local language = _Language

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
    CallRemoteEvent(playerId, "GetTranslate", list)
end

function _(string, ...)
    local text = translate[string]
    
    if isnil(text) then print('translate error ' .. string) end

    local params = {...}
    for i=1,#params do
        text = text:gsub("{"..i.."}", params[i])
    end

    return text
end

function OnTranslateStart(playerId)
end

function OnTranslateEnd(playerId)
    translate_ready = true
end