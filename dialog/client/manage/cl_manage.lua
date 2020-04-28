function closeDialog(webid)
    for id, data in pairs(__dialogList) do
        if id == webid then
            SetWebVisibility(data.ui , WEB_HIDDEN)
            CallRemoteEvent("OnCloseDialog", webid)
        end
    end
end
AddRemoteEvent("closeDialog", closeDialog)

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
