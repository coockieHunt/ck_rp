local module = {
    name = "food | thirst",
    id = "food_thirst",
    select = "survival",
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
    
    AddForm('text', 'amount', 'amount', {
        ['place_holder'] = 'Amount max 100'
    })

    AddForm('select', 'action', 'action', {
        ['default_option'] = 'food',
        ['options'] = {
            ['food'] = "food",
            ['thirst'] = "thirst",
        }
    })
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local amount = tonumber(data['amount'])
    local target = data['target']
    local action = data['action']

    if type == "food" then
        AddAdminLog(playerId, GetPlayerName(playerId).." set food ".. GetPlayerName(target) .." | " .. amount)
        local p = getplayer(target)
    
        if amount < 0 then amount = 0 end
        if amount > 100 then amount = 100 end
    
        p:setFood(amount)
        
        RefrechSurvivalIventoryUi(target)
        RefrechWarningSurvivalUi(target)
    else
        AddAdminLog(playerId, GetPlayerName(playerId).." set thirst ".. GetPlayerName(target) .." | " .. amount)

        local p = getplayer(target)
    
        if amount < 0 then amount = 0 end
        if amount > 100 then amount = 100 end
    
        p:setThirst(amount)
        
        RefrechSurvivalIventoryUi(target)
        RefrechWarningSurvivalUi(target)
    end

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
