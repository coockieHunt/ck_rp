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
    local droped_id = data['droped_id']	
    local act = data['action']	

    if(act == "tp") then	
        AddAdminLog(playerId, "Teleported item id : " .. droped_id)
        local po_posX, po_posY, po_posZ = GetPickupLocation(droped_id)
      
        admin_tp_to_pos(playerId, po_posX, po_posY, po_posZ)
    end	

    if(act == "del") then	
        AddAdminLog(playerId, "Droped item id : " .. droped_id.. " has been deleted")
        RemoveDropedItem(droped_id)
    end

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
