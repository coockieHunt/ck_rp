_DialogList = {}

function OnPlayerSpawn(playerid)
    for _, dialog in ipairs(_DialogList) do
        CallRemoteEvent(
            playerid,
            "BuildClientDialog", 
            dialog.id, 
            dialog.key, 
            dialog.dysplay_on_spawn,
            dialog.type, 
            dialog.view,
            dialog.z_order,
            dialog.frame_rate

        )
    end 
end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)

function OnCreateDialog(playerId, DialogId)
    for _, dialog in ipairs(_DialogList) do
        if dialog.id == DialogId then
            dialog:onCreate(playerId, DialogId)
        end
    end 
end
AddRemoteEvent("OnCreateDialog", OnCreateDialog)

function OnLoadComplete(playerId, DialogId)
    for _, dialog in ipairs(_DialogList) do
        if dialog.id == DialogId then
            dialog:OnLoadComplete(playerId, DialogId)
        end
    end 
end
AddRemoteEvent("OnLoadComplete", OnLoadComplete)

function OnOpenDialog(playerId, DialogId, id)
    for _, dialog in ipairs(_DialogList) do
        if dialog.id == DialogId then
            local open = dialog:onOpen(playerId, DialogId)
            if isnil(open) then open = true end
            CallRemoteEvent(playerId, "SetClientVisibility", id, open)
        end
    end 
end
AddRemoteEvent("OnOpenDialog", OnOpenDialog)

function OnCloseDialog(playerId, DialogId, id)
    for _, dialog in ipairs(_DialogList) do
        if dialog.id == DialogId then
            dialog:OnClose(playerId, DialogId)
            CallRemoteEvent(playerId, "SetClientVisibility", id, false)
        end
    end 
end
AddRemoteEvent("OnCloseDialog", OnCloseDialog)


function AddDialog(dialog)
    table.insert(_DialogList, dialog)
end
