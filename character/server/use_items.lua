function UseItem(player, item_id)
    if(CheckIfValidItem(item_id)) then
        local item = GetItems(item_id)

        if(item ~= false) then
            local food = item.food
            local thirst = item.thirst

            if(food > 0 or thirst > 0) then
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
                    consumeItem(player,item.name, food, thirst)
                end)
            end
        end
    end
end
AddRemoteEvent("UseItem", UseItem)

function consumeItem(player, item_name, food, thirst)
    local negativ = false
    local food_alert
    local thirst_alert

    if(food ~= 0) then
        if(food < 0) then 
            negativ = true
            food_alert = string.format('food :<span style="color:red">%q</span><br>', food)
        else
            negativ = false
            food_alert = string.format('food :<span style="color:green">+ %q</span><br>', food)
        end
        ManageFood(player, negativ, food)
    end

    if(thirst ~= 0) then
        if(thirst < 0) then 
            negativ = true 
            thirst_alert = string.format('thirst : <span style="color:red">%q</span>', thirst)
        else
            negativ = false
            thirst_alert = string.format('thirst : <span style="color:green">+ %q</span>', thirst)
        end
        ManageThirst(player, negativ, thirst)
    end

    if(thirst == 0) then thirst_alert = string.format('thirst : <span style="color:black">0</span>', thirst) end
    if(food == 0) then food_alert = string.format('food :<span style="color:black">0</span><br>', food) end

    local formatAlert = ('you have consumed <strong>%s</strong>:<br> %s %s'):format(item_name, food_alert, thirst_alert)

    SendAlert(player, "info", "Consume", formatAlert)
end