local module = {
    name = "cash (account)",
    id = "cash",
    select = "inventory",
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
    AddForm('player', "target", "target", {})

    AddForm('text', "ammount", "ammount", {
        ['place_holder'] = "max value 1000000"
    })

    AddForm('spacer', 'to', '', {})

    AddForm('select', 'type', 'type',{
        ['default_option'] = "cash_account",
        ['options'] = {
            ['cash'] = "cash",
            ['cash_account'] = "account",
        }
    })

    AddForm('select', 'action', 'action', {
        ['default_option'] = "give",
        ['options'] = {
            ['give'] = "give",
            ['remove'] = "remove",
        }
    })
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)

    if(data['ammount'] <= 1000000) then
        admin_cash(playerId, data['target'], data['ammount'], data['type'], data['action'])

        CloseAdminDialog(playerId)
    end
end

AddAdminModule(module)
