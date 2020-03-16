AddEvent("OnKeyPress", function(key)
    if key == GetKeyMapServer("interact") then
        local pickup = GetNearestPickUp(125)
        if(pickup == false) then return false end

        if(pickup.type == "droped_item") then
            CallRemoteEvent("GatherDropedItem", pickup.id)
        end
    end
end)

