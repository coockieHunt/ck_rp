local module = {
    name = "health | armor",
    id = "health_armor",
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
        ['default_option'] = 'healt',

        options = {
            healt = "healt",
            armor = "armor",
        }
    })
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local amount = tonumber(data['amount'])
    local target = data['target']
    local type = data['action']

    if type == "healt" then
        AddAdminLog(playerId, GetPlayerName(playerId).." set heal ".. GetPlayerName(target) .." | " .. amount)
        SetPlayerHealth(target, amount)
        local p = getplayer(target)

        if amount < 0 then amount = 0 end
        if amount > 100 then amount = 100 end

        p:setHealth(amount)

        RefrechSurvivalIventoryUi(target)
        RefrechWarningSurvivalUi(target)
    else
        AddAdminLog(playerId, GetPlayerName(playerId).." set armor ".. GetPlayerName(target) .." | " .. amount)
        SetPlayerArmor(target, amount)
        local p = getplayer(target)
    
        if amount < 0 then amount = 0 end
        if amount > 100 then amount = 100 end
    
        p:setArmor(amount)
        
        RefrechSurvivalIventoryUi(target)
        RefrechWarningSurvivalUi(target)
    end

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
