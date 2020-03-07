-- CREDIT
    -- author : vugi99
    -- link : https://github.com/vugi99/onset-drift
-- END

local mult = 0.000012 -- drift variable

AddEvent("OnGameTick",function()
    for k, v in pairs(GetAllVehicles()) do
    if (GetVehicleModelName(v)~="Helicopter_01" and GetVehicleModelName(v)~="Helicopter_02" and GetVehicleModelName(v)~="Helicopter_03") then
    if GetVehicleDriver(v)~=0 then
       if (GetVehiclePropertyValue(v, "wheelturn")==nil) then
        SetVehiclePropertyValue(v, "wheelturn", "no", true)
       else
        local vx,vy,vz = GetVehicleVelocity(v)
           if vx<0 then
              vx=vx*-1
           end
           if vy<0 then
            vy=vy*-1
          end
          if vz<0 then
            vz=vz*-1
          end
          local fakevel = vx+vy+vz
         if GetVehiclePropertyValue(v, "wheelturn")~="no" then
            if GetVehiclePropertyValue(v, "wheelturn")=="right" then
               SetVehicleAngularVelocity(v, 0, 0, fakevel*mult ,false)
            elseif GetVehiclePropertyValue(v, "wheelturn")=="left" then
               SetVehicleAngularVelocity(v, 0, 0, fakevel*-1*mult ,false)
            end
         end
           
       end
    end
end
end
end)

function updatevehturn(ply,veh,val)
   SetVehiclePropertyValue(veh, "wheelturn", val, true)
end

AddRemoteEvent("Updatewheelturn",updatevehturn)