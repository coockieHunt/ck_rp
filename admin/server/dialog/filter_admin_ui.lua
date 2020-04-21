AddRemoteEvent("Exucute", function(playerid, json)
    local data = json_decode(json)
    local func = data['func']

    if(CheckIfAdminSufficient(func, playerid)) then
        if(func == 'car_spawn') then
            if(isnil(data['car_id'])) then
                AddPlayerChat(playerid, "none id")
            else
                local AutoMount = false
                local boost = false
                if(data['AutoMount'] == 'on') then AutoMount = true end
                if(data['boost'] == 'on') then boost = true end
                print(data['AutoMount'])
                admin_car_spawn(playerid, data['car_id'], AutoMount, boost, data['color'])
            end
        end
    
        if(func == 'health_armor') then
            if(isnil(data['target'])) then
                AddPlayerChat(playerid, "none id")
            else
                local amount = data['amount']
                local target = data['target']
                local type = data['type']
                
                if type == "healt" then
                    admin_heal(playerid, target, amount)
                else
                    admin_armor(playerid,target , amount)
                end
            end
        end
    
        if(func == 'food_thirst') then
            if(isnil(data['target'])) then
                AddPlayerChat(playerid, "none id")
            else
    
                local amount = data['amount']
                local target = data['target']
                local type = data['type']
                
                if type == "food" then
                    admin_food(playerid, target, amount)
                else
                    admin_thirst(playerid, target, amount)
                end
            end
        end
    
        if(func == 'weapon') then
            if(isnil(data['target'])) then
                AddPlayerChat(playerid, "none id")
            else
                local target = data['target']
                local weapons_id = data['weapons_id']
                local slot = string.sub(data['slot'], -1)
                local ammo = data['ammo']
                
                admin_weapon_spawn(target, weapons_id, slot, ammo)
            end
        end
    
        if(func == 'kill') then
            if(isnil(data['target'])) then
                AddPlayerChat(playerid, "none id")
            else
                local p = data['target']
                
                admin_kill(playerid, p)
            end
        end
    
        if(func == 'tp_pos') then
            if(isnil(data['target']) or isnil(data['x']) or isnil(data['y'])or isnil(data['x'])) then
                AddPlayerChat(playerid, "none id")
            else
                local target = data['target']
    
                local x = data['x']
                local y = data['y']
                local z = data['z']
                
                admin_tp_to_pos(target, x, y, z)
            end
        end
    
        if(func == 'tp_to') then
            if(isnil(data['main']) or isnil(data['to'])) then
                AddPlayerChat(playerid, "none id")
            else
                local main = data['main']
                local to = data['to']
    
                admin_tp_to(main, to)
            end
        end
    
        if(func == 'tp_preset') then
            if(isnil(data['target']) or isnil(data['preset_id'])) then
                AddPlayerChat(playerid, "none id")
            else
                local target = data['target']
                local preset_id = data['preset_id']
    
                get_admin_tp_preset_pos(playerid, target, preset_id)
            end
        end
    
        if(func == 'give_remove_item') then
            if(isnil(data['target']) or isnil(data['quantity']) or isnil(data['item_id']) or isnil(data['quantity'])) then
                AddPlayerChat(playerid, "none id")
            else
                local target = data['target']
                local quantity = data['quantity']
                local items_id = data['item_id']
                local action = data['action']
    
                if action == "give" then
                    admin_addItem(playerid, target, items_id, quantity)
                else
                    admin_removeItem(playerid, target, items_id, quantity)
                end
    
            end
        end
    
        if(func == 'cache_remove') then
            if(isnil(data['target'])) then
                AddPlayerChat(playerid, "none id")
            else
                local target = data['target']
                admin_remove_cache_player(playerid, target)
            end
        end
    
        if(func == 'change_time') then
            if(isnil(data['time'])) then
                AddPlayerChat(playerid, "none time")
            else
                local time = data['time']
                local time = tonumber(time)
                if time > 24 or time < 0 then
                    AddPlayerChat(playerid, "error time <0 - 24>")
                    return false
                end
    
                admin_change_time(playerid, time)
            end
        end
    
        if(func == 'drop_object_items_action') then
            if(isnil(data['droped_id']) or isnil(data['action'])) then
                AddPlayerChat(playerid, "none id")
            else
                local id = data['droped_id']
                local act = data['action']
    
                if(act == "tp") then
                    admin_teleport_droped_Item(playerid, id)
                end
    
                if(act == "del") then
                    admin_delete_droped_Item(playerid, id)
                end
            end
        end
    end

   
 end)