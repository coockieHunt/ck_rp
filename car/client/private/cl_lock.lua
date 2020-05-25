function OnKeyPress(key)
    if key == "L" then
        CallRemoteEvent('lock_unlock_vehicle_nearest', nereast)
    end
end
AddEvent("OnKeyPress", OnKeyPress)