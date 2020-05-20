function OnKeyPress(key)
    if key == "E" then
        local nereast = GetNearestPickUp(500)

        if(nereast ~= false) then
            if nereast.type == "droped_item" then
                CallRemoteEvent("GatherDropedItem" , nereast.id)
            end
        end
        
    end
end
AddEvent("OnKeyPress", OnKeyPress)