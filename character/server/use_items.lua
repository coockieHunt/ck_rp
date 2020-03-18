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
                    consumeItem(player, food, thirst)
                end)
            end
        end
    end
end
AddRemoteEvent("UseItem", UseItem)

function consumeItem(player, food, thirst)
    AddFood(player, food)
end