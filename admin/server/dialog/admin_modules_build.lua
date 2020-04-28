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
        CallRemoteEvent(playerId, "BuidlEndPlayerChat", _Dialog_admin.key)
    end
end)

function BuildForm(playerId, section_id)
    for _, form in ipairs(content_section) do
        local type, id, name, data = form['type'], form['id'], form['name'], form.data 
        local custom = ""

        if type == "text" or type == "color" then
            CallRemoteEvent(playerId, "BuildInput", section_id, type, id, "", name)
        end

        if type == "spacer" then
            CallRemoteEvent(playerId, "BuildSpacer", section_id, name)
        end

        if type == "player" or type == "vehicles" or type == "weapons" or type == "preset_pos" or type == "items" or type == "player_cache" or type == "droped_items" then
            CallRemoteEvent(playerId, "BuildGameSelect", section_id, type, id, custom, name)
        end

        if type == "select" then
            local optionsBuild = "[]"

            if(not isnil(data['options'])) then
                local options = data['options']

                if(tablelength(options) > 0) then
                    optionsBuild = "[" 
        
                    for id, value in pairs(options) do
                        optionsBuild = optionsBuild .. "{"
                        optionsBuild = optionsBuild .. "'" .. value .. "':'" .. id .. "'"
                        optionsBuild = optionsBuild .. "},"
                    end
        
                    optionsBuild = optionsBuild:sub(1, -2) .. "]" 
                end
            end
            
            CallRemoteEvent(playerId, "BuildSelect", section_id, id, custom, name, optionsBuild)
        end

        if type == "checkbox" then
            local checked = false
            if(not isnil(data['checked'])) then checked = data['checked'] end
            CallRemoteEvent(playerId, "BuildCheckbox", section_id, name, id, checked)
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
