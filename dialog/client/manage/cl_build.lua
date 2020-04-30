__dialogList = {}

function BuildClientDialog(id, key, dysplay_on_spawn, type, view)
    if __dialogList[id] == nil then
        local new_ui = createDialog(view, dysplay_on_spawn)
        CallRemoteEvent("OnCreateDialog", id)
        __dialogList[id] = {['key'] = key, ['type'] = type, ['DysplayOnSpawn'] = dysplay_on_spawn, ['view'] = view, ['ui'] = new_ui}
    end
end
AddRemoteEvent("BuildClientDialog", BuildClientDialog)

function OnKeyPress(key)
    for id, data in pairs(__dialogList) do
        if data.type == "press" then
            if data.key == key then
                if GetWebVisibility(tonumber(data.ui)) == WEB_HIDDEN then
                    SetWebVisibility(data.ui , WEB_VISIBLE)
                    CallRemoteEvent("OnOpenDialog", id)
                else
                    SetWebVisibility(data.ui , WEB_HIDDEN)
                    CallRemoteEvent("OnCloseDialog", id)
                end
            end
        end

        if data.type == "release" then
            if data.key == key then
                if GetWebVisibility(tonumber(data.ui)) == WEB_HIDDEN then
                    SetWebVisibility(data.ui , WEB_VISIBLE)
                    CallRemoteEvent("OnOpenDialog", id)
                end
            end
        end
    end
end
AddEvent("OnKeyPress", OnKeyPress)

function OnKeyRelease(key)
    for id, data in pairs(__dialogList) do
        if data.type == "release" then
            if data.key == key then
                if GetWebVisibility(tonumber(data.ui)) == WEB_VISIBLE then
                    SetWebVisibility(data.ui , WEB_HIDDEN)
                    CallRemoteEvent("OnCloseDialog", id)
                end
            end
        end
    end
end
AddEvent("OnKeyRelease", OnKeyRelease)

function OnWebLoadComplete(webid)
    local playerId = GetPlayerId()
    
    for id, data in pairs(__dialogList) do
        if (data.ui == webid) then
            Delay(500, function()
                CallRemoteEvent("OnLoadComplete", id)
            end)
        end
    end
end
AddEvent("OnWebLoadComplete", OnWebLoadComplete)


function createDialog(view, dysplay_on_spawn)
    local ui = CreateWebUI(0,0,0,0,1,16)
    SetWebAlignment(ui , 0,0)
    SetWebAnchors(ui , 0,0,1,1)
    SetWebURL(ui , 'http://asset/' .. GetPackageName() .. '/dialog/files/'..view)

    
    if dysplay_on_spawn then
        SetWebVisibility(ui , WEB_VISIBLE)
    else
        SetWebVisibility(ui , WEB_HIDDEN)
    end

    return ui
end
