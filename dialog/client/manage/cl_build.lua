__dialogList = {}

function BuildClientDialog(id, key, dysplay_on_spawn, type, view, zOrder, frameRate)
    if __dialogList[id] == nil then
        local new_ui = createDialog(view, dysplay_on_spawn, zOrder, frameRate)
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
                    CallRemoteEvent("OnOpenDialog", id, data.ui)
                else
                    CallRemoteEvent("OnCloseDialog", id, data.ui)
                end
            end
        end

        if data.type == "release" then
            if data.key == key then
                if GetWebVisibility(tonumber(data.ui)) == WEB_HIDDEN then
                    CallRemoteEvent("OnOpenDialog", id, data.ui)
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
                    CallRemoteEvent("OnCloseDialog", id, data.ui)
                end
            end
        end
    end
end
AddEvent("OnKeyRelease", OnKeyRelease)

function SetClientVisibility(ui_id, bool)
    if bool then
        SetWebVisibility(ui_id , WEB_VISIBLE)
    else
        SetWebVisibility(ui_id , WEB_HIDDEN)
    end
end
AddRemoteEvent("SetClientVisibility", SetClientVisibility)


function OnWebLoadComplete(webid)
    for id, data in pairs(__dialogList) do
        if (data.ui == webid) then
            Delay(500, function()
                CallRemoteEvent("OnLoadComplete", id)
            end)
        end
    end
end
AddEvent("OnWebLoadComplete", OnWebLoadComplete)


function createDialog(view, dysplay_on_spawn, zOrder, frameRate)
    local ui = CreateWebUI(0, 0, 0, 0, zOrder, frameRate)
    SetWebAlignment(ui , 0,0)
    SetWebAnchors(ui , 0,0,1,1)
    SetWebURL(ui , 'http://asset/' .. GetPackageName() .. '/dialog/files/'..view)
    SetClientVisibility(ui, dysplay_on_spawn)

    return ui
end
