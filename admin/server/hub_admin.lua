AddRemoteEvent("Exucute", function(playerid, json)
    local data = json_decode(json)
    local func = data['func']
    if(func == 'car') then
        admin_car_spawn(playerid, data['id'])
    end
           
end)