function IfInventorContainsItem(inventory, var_item, count)
    if not isnil(inventory[var_item]) and inventory[var_item] >= count then
        return true
    else
        return false
    end
end


function AddPlayerItem(target, var, quantity)
    local item_info = getItemInfo(var)
    local p = getplayer(target)
    local json = p.inventory
    local max_weight = p.MaxWeight


    if item_info ~= false then
        local old_inventory = DecodeInventory(json)

        local ItemVar = item_info.var
        local new_quantity


        if not isnil(old_inventory[ItemVar]) then
            local old_quantity = old_inventory[ItemVar]
            new_quantity = old_inventory[ItemVar] + quantity
        else
            new_quantity = quantity
        end

        old_inventory[ItemVar] = math.floor(new_quantity)          

        local new_weight = CheckIfWeightToHeavy(max_weight, old_inventory)
        if new_weight ~= false then
            if new_weight[1] then
                SaveInventory(target, EncodeInventory(old_inventory))
                SaveHeightInventory(target, new_weight[2])
                item_info:OnCreate(target, new_quantity)

                return {true, new_quantity}
            else
                SendAlert(
                    target, 
                    'info', 
                    'items', 
                    _("item_height_to_heavy", new_weight[2])
                )
                return {false, new_weight[2]}
            end
        else
            KickPlayer(target, "EC004 item weight not valide please contatct admin")
            return false
        end
    else
        SendAlert(
            target, 
            'error', 
            'server', 
            _("item_var_not_valid", var)
        )

        return false
    end
end

function RemovePlayerItem(target, var, quantity)
    local item_info = getItemInfo(var)
    local p = getplayer(target)

    local json = p.inventory
    local max_weight = p.MaxWeight

    if item_info ~= false then
        local inventory_decode = DecodeInventory(json)

        local ItemVar = item_info.var
        local new_quantity
        

        if not isnil(inventory_decode[ItemVar]) then
            local old_quantity = inventory_decode[ItemVar]
            new_quantity = inventory_decode[ItemVar] - tonumber(quantity)

            if new_quantity <= 0 then
                if new_quantity == 0 then
                    inventory_decode[ItemVar] = nil
                else
                    SendAlert(
                        target, 
                        'info', 
                        'info', 
                        _("item_to_hight_remove", 
                            quantity, 
                            item_info.name, 
                            inventory_decode[ItemVar]
                        )
                    )
                end
            else
                inventory_decode[ItemVar] = math.floor(new_quantity)      
            end

            local new_weight = CheckIfWeightToHeavy(max_weight, inventory_decode)
            if new_weight ~= false then
                if new_weight[1] then
                    local new_inventory = EncodeInventory(inventory_decode)
                    SaveInventory(target, new_inventory)
                    SaveHeightInventory(target, new_weight[2])
                    item_info:OnDestroy(target, new_quantity)
                    return true
                else
                    SendAlert(
                        target, 
                        'warning', 
                        'items', 
                        _("item_height_to_heavy", new_weight[2])
                    )
                    return false
                end
            else
                KickPlayer(target, "EC004 item weight not valide please contatct admin")
                return false
            end

        else
            SendAlert(
                target, 
                'error', 
                'server', 
                _("item_not_exist_player_inventory", item_info.name)
            )
        end
    else
        SendAlert(
            target, 
            'error', 
            'server', 
            _("item_var_not_valid", var)
        )
    end
end