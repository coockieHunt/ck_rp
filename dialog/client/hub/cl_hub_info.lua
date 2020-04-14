local info_ui

function OpenUIInfo()
    if info_ui ~= nil then
        SetWebVisibility(info_ui, WEB_VISIBLE)
    end
end

function CloseUIInfo()
    SetWebVisibility(info_ui, WEB_HIDDEN)
end

AddEvent("OnPlayerSpawn", function(playerid)
    info_ui = CreateWebUI(0,0,0,0,1,16)
    SetWebAlignment(info_ui, 0,0)
    SetWebAnchors(info_ui, 0,0,1,1)
    SetWebURL(info_ui,  'http://asset/' .. GetPackageName() .. '/dialog/files/ui_info.html')
    SetWebVisibility(info_ui, WEB_HIDDEN)
end)

AddEvent("OnKeyPress", function(key)
    if key == GetKeyMapServer("info") then
        if GetWebVisibility(info_ui) == WEB_HIDDEN then
            OpenUIInfo()

            ExecuteWebJS(info_ui, "clearKey()")
            ExecuteWebJS(info_ui, "addKey('inventory', '"..GetKeyMapServer("survival").."')")
            ExecuteWebJS(info_ui, "addKey('interaction', '"..GetKeyMapServer("interact").."')")

        else
            CloseUIInfo()
        end
    end
end)
