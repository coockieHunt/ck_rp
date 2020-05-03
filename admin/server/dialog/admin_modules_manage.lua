AddRemoteEvent("Exucute_admin_module", function(playerId, json)
    local data = json_decode(json)
    local func = data['func']
    for _, module in ipairs(_moduleList) do
        if module:GetId() == func then
            if AdminLevel(playerId, module:GetLevel() ) then
                AddAdminLog(playerId, "msg")
                module:Onexecute(playerId, data)
            end
        end
    end 
end)

AddRemoteEvent("Open_admin_module", function(playerId, func)
    for _, module in ipairs(_moduleList) do
        if module:GetId() == func then
            module:OnOpen(playerId)
        end
    end 
end)

function AddAdminModule(module)
    table.insert(_moduleList, module)
end

function CloseAdminDialog(playerId)
    CallRemoteEvent(playerId, "CloseDialogAdmin")
end