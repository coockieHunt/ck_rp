AddRemoteEvent("Exucute", function(playerid, json)
    local data = json_decode(json)
    local func = data['func']


    if(func == 'car') then
        if(isnil(data['id'])) then
            AddPlayerChat(playerid, "none id")
        else
            local am = false
            local b = false
            if(data['autopilote'] == 'on') then am = true end
            if(data['boost'] == 'on') then b = true end
            
            admin_car_spawn(playerid, data['id'], am, b, data['color'])
        end
    end
end)
