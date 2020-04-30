_DialogList = {}

function OnPlayerSpawn(playerid)
    for _, dialog in ipairs(_DialogList) do
        CallRemoteEvent(
            playerid,
            "BuildClientDialog", 
            dialog:GetId(), 
            dialog:GetKey(), 
            dialog:GetDysplayOnSpawn(),
            dialog:GetType(), 
            dialog:GetView()
        )
    end 

end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)

function OnCreateDialog(playerId, DialogId)
    for _, dialog in ipairs(_DialogList) do
        if dialog:GetId() == DialogId then
            dialog:onCreate(playerId, DialogId)
        end
    end 
end
AddRemoteEvent("OnCreateDialog", OnCreateDialog)


function OnLoadComplete(playerId, DialogId)
    for _, dialog in ipairs(_DialogList) do
        if dialog:GetId() == DialogId then
            dialog:OnLoadComplete(playerId, DialogId)
        end
    end 
end
AddRemoteEvent("OnLoadComplete", OnLoadComplete)

function OnOpenDialog(playerId, DialogId)
    for _, dialog in ipairs(_DialogList) do
        if dialog:GetId() == DialogId then
            dialog:onOpen(playerId, DialogId)
        end
    end 
end
AddRemoteEvent("OnOpenDialog", OnOpenDialog)

function OnCloseDialog(playerId, DialogId)
    for _, dialog in ipairs(_DialogList) do
        if dialog:GetId() == DialogId then
            dialog:OnClose(playerId, DialogId)
        end
    end 
end
AddRemoteEvent("OnCloseDialog", OnCloseDialog)


function AddDialog(dialog)
    table.insert(_DialogList, dialog)
end
