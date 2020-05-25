-- master list modules
_moduleList = {}

-- section module content
local content_section = {}

AddRemoteEvent("BuildAdminDialog", function(playerId)
    local data = getplayer(playerId)

    if(tonumber(data.admin) > 0) then
        CallRemoteEvent(playerId, "BuildTitleBar", "your admin levels : " .. data.admin)


        for _, table in ipairs(_Dialog_admin.module_select) do
            CallRemoteEvent(playerId, "BuildDropDown", table.id, table.name)
        end 
    
        for _, module in ipairs(_moduleList) do
            if AdminLevel(playerId,module:GetLevel() ) then
                AddSection(playerId, module:GetId(), module:GetName(), module:GetSelect())
                module:OnBuild()
                BuildForm(playerId, module:GetId())
            end
        end 
    
        CallRemoteEvent(playerId, "ExecCallStack")
        CallRemoteEvent(playerId, "BuildEnd")
        local alert = _("admin_dialog_build_end_notify", _Dialog_admin.key)
        SendAlert(playerId, 'admin', 'server', alert)
    end
end)

function BuildForm(playerId, section_id)
    for _, form in ipairs(content_section) do
        local type, id, name, data = form['type'], form['id'], form['name'], form['data']

        if tablelength(data) > 0 then data = json_encode(data) else data = "" end

        if type == "text" or type == "color" then
            CallRemoteEvent(playerId, "BuildInput", section_id, type, id, data, name)
        end

        if type == "spacer" then
            CallRemoteEvent(playerId, "BuildSpacer", section_id, name, data)
        end

        if type == "player" or type == "vehicles" or type == "weapons" or type == "preset_pos" or type == "items" or type == "player_cache" or type == "droped_items" or type == "car_world_list" then
            CallRemoteEvent(playerId, "BuildGameSelect", section_id, type, id, data, name)
        end

        if type == "select" then
            CallRemoteEvent(playerId, "BuildSelect", section_id, id, data, name)
        end

        if type == "checkbox" then
            CallRemoteEvent(playerId, "BuildCheckbox", section_id, name, id, data)
        end
    end 
    content_section = {}
end

function AddForm(type, name, id, data)
    table.insert(content_section, {['type'] = type, ['id'] = id, ['name'] = name, ['data'] = data})
end

function AddSection(playerId, id, name, select)
    CallRemoteEvent(playerId, "BuildNav", name, id, select) 
    CallRemoteEvent(playerId, "BuildSection", id)
end

function BuildEndPlayerChat(playerId, key)
    CallRemoteEvent(playerId, _Dialog_admin.key)
end
