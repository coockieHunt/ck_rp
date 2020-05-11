local module = {
    name = "dropped item",
    id = "droped_item",
    select = "entity",
    level = 1
}

function module:GetName()
    return module.name
end

function module:GetSelect()
    return module.select
end

function module:GetId()
    return module.id
end

function module:GetLevel()
    return module.level
end

-- func
function module:OnBuild()
    AddForm('droped_items', "droped", "droped_id", {})
    AddForm('select', 'action', 'action', {
        ['default_option'] = "tp",

        ['options'] = {
            ['tp'] = "teleport to",
            ['del'] = "delete",
        }
    })
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local id = data['droped_id']	
    local act = data['action']	

    if(act == "tp") then	
        admin_teleport_droped_Item(playerId, id)	
    end	

    if(act == "del") then	
        admin_delete_droped_Item(playerId, id)	
    end

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
