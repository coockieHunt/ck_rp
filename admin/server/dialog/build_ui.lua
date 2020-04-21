AddRemoteEvent("BuildDialog", function(player)
    local TableList = {}


    for id, name in pairs(_Dialog_admin["drop_down"]) do
        CallRemoteEvent(player, "BuildDropDown", id, name)
    end

    for id, table in pairs(_Dialog_admin["section"]) do
        local cur_id = id

        local name
        local section_id
        local admin_level

        for id, value in pairs(table) do
            if id == "name" then name = value end
            if id == "drop_down_id" then section_id = value end
            if id == "level" then admin_level = value end
        end
        if CheckIfAdminSufficient(cur_id, player) then CallRemoteEvent(player, "BuildNav", name, cur_id, section_id) end
        CallRemoteEvent(player, "BuildSection", cur_id)
    end

    for section_id, tableSection in pairs(_Dialog_admin["section"]) do
        for type, data in ipairs(tableSection["form"]) do
            local type, name, custom, id = data["type"], data['name'], data['custom'], data['id']
            if type == "spacer" then
                CallRemoteEvent(player, "BuildSpacer", section_id, data["title"])
            end

            if type == "text" or type == "color" then
                CallRemoteEvent(player, "BuildInput", section_id, type, id, custom, name)
            end
        
            if type == "player" or type == "vehicles" or type == "weapons" or type == "preset_pos" or type == "items" or type == "player_cache" then
                CallRemoteEvent(player, "BuildGameSelect", section_id, type, id, custom, name)
            end
    
            if type == "select" then
                local options = "[" 
                for id, value in pairs(data['options']) do
                    options = options .. "{"
                    options = options .. "'" .. value .. "':'" .. id .. "'"
                    options = options .. "},"
                end
    
                options = options:sub(1, -2) .. "]" 
    
                CallRemoteEvent(player, "BuildSelect", section_id, id, custom, name, options)
            end

            if type == "checkbox" then
                CallRemoteEvent(player, "BuildCheckbox", section_id, name, id, data['checked'])
            end
        end
    end

    CallRemoteEvent(player, "ExecCallStack")
    CallRemoteEvent(player, "BuildEnd")
end)