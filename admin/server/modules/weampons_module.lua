local module = {
    name = "weapons",
    id = "weapons",
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
    AddForm('weapons', "weapon", "weapon", {})
    AddForm('text', 'amount', 'amount', {
        ['default_value'] = "100",
    })
    AddForm('select', 'slot', 'slot', {
        ['default_option'] = '2',

        ["options"] = {
            ["1"] = "1",
            ["2"] = "2",
            ["3"] = "3",
        }
    })
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
	AddAdminLog(data.target, "spawn weapon id : " .. data.weapon .. " slot: " ..tonumber(data.slot).. " ammo: " .. data.amount)
	SetPlayerWeapon(data.target, data.weapon, data.amount, true, tonumber(data.slot), true)

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
