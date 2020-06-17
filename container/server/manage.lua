Container_master_list = {}

function createContainer(id, name, weight)
    local params = {
        name = name,
        weight = weight,
        items = json_encode({})
    }

    Container_master_list[id] = params
end

function OpenContainer(playerId, id_container)
    OpenDialogClient(playerId, "container")
    SetupContainer(playerId, id_container)
end
AddCommand("oc", OpenContainer)

function GetContainer(id_container)
    if not isnil(Container_master_list[id_container]) then return Container_master_list[id_container] end

    return false
end

function GetAllContainer()
    for i,v in ipairs(Container_master_list) do
       print(i, v.name, v.weight, v.items)
    end
end
AddCommand("gac", GetAllContainer)

function AddItemInContainer(id_container, item_id, quantity)
    local inv_cont = Container_master_list[id_container].items

    local old_container = json_decode(inv_cont)

    local new_quantity

    if not isnil(old_container[item_id]) then
        local old_quantity = old_container[item_id]
        new_quantity = math.floor(old_quantity + quantity)
    else
        new_quantity = math.floor(quantity)
    end

    old_container[item_id] = new_quantity 

    Container_master_list[id_container].items = json_encode(old_container)
end

function RemoveItemInContainer(id_container, item_id, quantity)
    local inv_cont = Container_master_list[id_container].items

    local old_container = json_decode(inv_cont)

    local new_quantity

    if not isnil(old_container[item_id]) then
        local old_quantity = old_container[item_id]
        new_quantity = math.floor(old_quantity - quantity)
        if new_quantity <= 0 then
            old_container[item_id] = nil
        else
            old_container[item_id] = new_quantity 
        end
    end

    Container_master_list[id_container].items = json_encode(old_container)
end

function MoveItemContainer(playerId, side, item_id, quantity, container_id)
    print(playerId, side, item_id, quantity, container_id)

    if side == "player" then
        print("move " .. item_id .. " * " .. quantity .." to container ".. container_id )
        RemovePlayerItem(playerId, item_id, quantity)
        AddItemInContainer(container_id, item_id, quantity)
    end

    if side == "container" then
        print("move " .. item_id .. " * " .. quantity .." to player ".. container_id )
        AddPlayerItem(playerId, item_id, quantity)
        RemoveItemInContainer(container_id, item_id, quantity)
    end
end
AddRemoteEvent("MoveItemContainer", MoveItemContainer)
