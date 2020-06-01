function CloseDialog(webid)
    local dialog = __dialogList[webid]

    if GetWebVisibility(dialog.ui) ~= WEB_HIDDEN then
        SetWebVisibility(dialog.ui , WEB_HIDDEN)
        CallRemoteEvent("OnCloseDialog", dialog.ui, dialog)
    end
end
AddRemoteEvent("CloseDialog", CloseDialog)

function OpenDialog(webid)
    local dialog = __dialogList[webid]

    if GetWebVisibility(dialog.ui) ~= WEB_VISIBLE then
        CallRemoteEvent("OnCloseDialog", dialog.ui, dialog)
    end
end
AddRemoteEvent("OpenDialog", OpenDialog)

function DestroyWebUI(webid)
    local dialog = __dialogList[webid]

    SetWebVisibility(dialog.ui , WEB_HIDDEN)
    DestroyWebUI(dialog.ui)
end
AddRemoteEvent("DestroyWebUI", DestroyWebUI)

function ExecWebJs(webid, cmd)
    local dialog = __dialogList[webid]

    ExecuteWebJS(dialog.ui, cmd)
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
