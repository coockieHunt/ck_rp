local module = {
    name = "info",
    id = "account_info",
    select = "account",
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
    AddForm('select', 'view', 'view', {
        options = {
            cash = "cash",
            cash_account = "cash account",
            health = "health",
            armor = "armor",
            food = "food",
            thirst = "thirst",
            MaxWeight = "MaxWeight",
            CurWeight = "CurWeight",
            inventory = "inventory",
            clothing = "clothing",
            steamId = "steamId",
        }
    })
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local target = data['target']

    local pt = getplayer(tonumber(target))

    AddPlayerChat(playerId, pt[data['view']])
    
    CloseAdminDialog(playerId)
end

AddAdminModule(module)
