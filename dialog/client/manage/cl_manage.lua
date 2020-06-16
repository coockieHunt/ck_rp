function CloseDialog(webid)
    local dialog = __dialogList[webid]

    if GetWebVisibility(dialog.ui) ~= WEB_HIDDEN then
        CallRemoteEvent("OnCloseDialog", webid, dialog.ui)
    end
end
AddRemoteEvent("CloseDialog", CloseDialog)

function OpenDialog(webid)
    local dialog = __dialogList[webid]

    if GetWebVisibility(dialog.ui) ~= WEB_VISIBLE then
        CallRemoteEvent("OnOpenDialog", webid, dialog.ui)
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

AddEvent("OnShowMainMenu", function ()
    -- for _, v in pairs(GetAllWebUI()) do
    --     for id, data in pairs(__dialogList) do
    --         if (data.ui == v) then
    --             if data.type ~= "permanent" then
    --                 if GetWebVisibility(data.ui) == WEB_VISIBLE then
    --                     AddPlayerChat(id)
    --                     SetClientVisibility(v, false)
    --                     CallRemoteEvent("OnCloseDialog", id, data.ui)

    --                 end
    --             end
    --         end
    --     end
    -- end

    ShowMouse(true)
    FreezePlayerInput(true)
end)

AddEvent("OnHideMainMenu", function ()
    ShowMouse(false)
    FreezePlayerInput(false)
end)