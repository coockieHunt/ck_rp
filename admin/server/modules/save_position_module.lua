local module = {
    name = "save pos",
    id = "save_pos",
    select = "tool",
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
    
    AddForm('text', 'name', 'name', {
        ['default_value'] = "unnamed",
    })
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    x, y, z = GetPlayerLocation(data.target)
    h = GetPlayerHeading(data.target)

    file = io.open("SavedCoords.txt", "a")

    if file then
        file:write("["..data.name .."] : " ..x.. ", " ..y.. ", " ..z.. ", " ..h.. "\n")
    end
    file:close()
end

AddAdminModule(module)
