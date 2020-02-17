-- CREDIT
    -- author : vugi99
    -- link : https://github.com/vugi99/onset-drift
-- END
local lastone = nil

AddEvent("OnGameTick",function() 
    if GetPlayerVehicle(GetPlayerId()) ~= 0 then
        local veh = GetPlayerVehicle(GetPlayerId())
        if (GetVehiclePropertyValue(veh, "wheelturn")~=nil) then
            if IsVehicleInAir(veh) then
                if lastone~="no" then
                    CallRemoteEvent("Updatewheelturn",veh,"no")
                    lastone="no"
                end 
            elseif (GetVehicleWheelSteerAngle(veh, 4)==0.0 and GetVehicleWheelSteerAngle(veh, 1)==0.0) then
                if lastone~="no" then
                CallRemoteEvent("Updatewheelturn",veh,"no")
                lastone="no"
                end
            elseif (GetVehicleWheelSteerAngle(veh, 4) > 0) then
                if lastone~="right" then
                CallRemoteEvent("Updatewheelturn",veh,"right")
                lastone="right"
                end
            else
                if lastone~="left" then
                CallRemoteEvent("Updatewheelturn",veh,"left")
                lastone="left"
                end
            end
        end
    end
end)