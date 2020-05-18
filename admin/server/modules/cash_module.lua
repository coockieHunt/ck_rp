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

    if(tonumber(data['ammount']) <= 1000000) then
        local target = data['target']

        local p = getplayer(target)

        local new_val = 0
        ammount = tonumber(data['ammount'])
    
        if data['type'] == "cash" then 
            local old_cash = p["cash"]
            local new_cash
    
    
            if data['action'] == "give" then
                new_val = old_cash + ammount
            else
                new_val = old_cash - ammount
            end
        else
            local old_cash_account = p["cash_account"]
            local new_cash_account 
    
            if data['action'] == "give" then
                new_val = old_cash_account + ammount
            else
                new_val = old_cash_account - ammount
            end
        end
    
        if new_val < 0 then new_val = 0 end
    
        AddAdminLog(playerId, GetPlayerName(playerId).." ".. data['action'] .." | ammount: ".. ammount .. "  ".. data['type'])
    
        p[data['type']] = math.floor(new_val)
    
        SaveAccountPlayer(target, "cash")

        CloseAdminDialog(playerId)
    end
end

AddAdminModule(module)
