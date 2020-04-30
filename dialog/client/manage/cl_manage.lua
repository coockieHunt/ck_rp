function CloseDialog(webid)
    for id, data in pairs(__dialogList) do
        if id == webid then
            SetWebVisibility(data.ui , WEB_HIDDEN)
            CallRemoteEvent("OnCloseDialog", id)
        end
    end
end
AddRemoteEvent("CloseDialog", CloseDialog)

function OpenDialog(webid)
    for id, data in pairs(__dialogList) do
        if id == webid then
            SetWebVisibility(data.ui , WEB_VISIBLE)
            CallRemoteEvent("OnOpenDialog", id)
        end
    end
end
AddRemoteEvent("OpenDialog", OpenDialog)

function DestroyWebUI(webid)
    for id, data in pairs(__dialogList) do
        if id == webid then
            SetWebVisibility(data.ui , WEB_HIDDEN)
            DestroyWebUI(data.ui)
        end
    end
end
AddRemoteEvent("DestroyWebUI", DestroyWebUI)

function ExecWebJs(webid, cmd)
    for id, data in pairs(__dialogList) do
        if id == webid then
            ExecuteWebJS(data.ui, cmd)
        end
    end
end
AddRemoteEvent("ExecWebJs", ExecWebJs)

function ShowMouse(bool)
    ShowMouseCursor(bool)

    if(bool) then
        SetInputMode(INPUT_GAMEANDUI)
    else
        SetInputMode(INPUT_GAME)
    end
end
AddRemoteEvent("ShowMouse", ShowMouse)


function FreezePlayerInput(bool)
    SetIgnoreLookInput(bool)
    SetIgnoreMoveInput(bool)
end
AddRemoteEvent("FreezePlayerInput", FreezePlayerInput)

