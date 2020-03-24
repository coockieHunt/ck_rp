function UseItem(player, item_id)
    if(CheckIfValidItem(item_id) and IfAccountOwnItem(player, item_id)) then
        local item = GetItems(item_id)

        if(item ~= false) then
            local type = item.type

            local food = item.food
            local thirst = item.thirst
            local health = item.health

            local time

            if(food > 0 or thirst > 0 or health > 0) then
                
                CallRemoteEvent(player, "FreezePlayer", true)

                time = GetConsumeTime(item_id)
                CeateProgressBar(player, time)

                if type == 'food' or type == 'drinks' then
                    local x, y, z = GetPlayerLocation(player)
    
                    local obj = CreateObject(item.model, x, y, z)
                    local hand_pos = GetItemHandPos('use', item_id)
    
                    SetObjectAttached(obj, ATTACH_PLAYER, player, 
                        hand_pos['x'], 
                        hand_pos['y'], 
                        hand_pos['z'], 
                        hand_pos['rx'],  
                        hand_pos['ry'], 
                        hand_pos['rz'], 
                        "hand_r"
                    )
    
                    SetPlayerAnimation(player, _Eat_animation.animation_id)
                    RemovePlayerItem(player, player, item_id, 1)

                    Delay(_Eat_animation.atach_time, function()
                        DestroyObject(obj)
                    end)
                end

                if type == 'medic' then
                    SetPlayerAnimation(player, _Medic_animation.animation_id)
                    RemovePlayerItem(player, player, item_id, 1)
                    time = GetConsumeTime(item_id)

                    CeateProgressBar(player, time)
                end

                Delay(time, function()
                    CallRemoteEvent(player, "FreezePlayer", false)
                    consumeItem(player,item.name, food, thirst, health)
                end)
            end
        end
    end
end
AddRemoteEvent("UseItem", UseItem)

function consumeItem(player, item_name, food, thirst, health)
    local symbol
    local alert_dys

    local alert = {
        food = {
            value = food
        },

        thirst = {
            value = thirst
        },

        health = {
            value = health
        }
    }

    alert_dys = string.format("you have consumed <strong>%s</strong>:", item_name)

    for k, v in pairs(alert) do
        local negativ = false
        
        local color
        local display

        local value = v.value 

        if (value >= 0) then
            if value == 0 then
                color = "black"
                symbol = ""
            else
                color = "green"
                symbol = "+ "
            end
        else
            negativ = true
            color = "red"
            symbol = ""
        end

        local format = string.format('<br>  - %s :<span style="color:%s">%s %s</span>', k, color, symbol, value)

        alert_dys =  string.format('%s %s', alert_dys, format)

        if (k == 'food') then
            ManageFood(player, negativ, value)
        end

        if (k == 'thirst') then
            ManageThirst(player, negativ, value)
        end

        if (k == 'health') then
            ManageHealth(player, negativ, value)
        end

    end

    SendAlert(player, "info", "Consume", alert_dys)
end