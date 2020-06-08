local mult1 = 30
local mult2 = 110

local last_hit_type = 0

AddEvent("OnGameTick",function(ds)
    local x, y, z = GetPlayerLocation()
    local fx,fy,fz = GetPlayerForwardVector(GetPlayerId())
    local hittype, hitid, impactX1, impactY1, impactZ1 = LineTrace(x+fx*mult1,y+fy*mult1,z+fz*mult1,x+fx*mult2,y+fy*mult2,z+fz*mult2)

    if last_type ~= hittype then
        last_hit_type = hittype

        CallRemoteEvent("UpdateHitType", hittype)
        
    end

    if IsGameDevMode() then
        local line = DrawLine3D(x+fx*mult1,y+fy*mult1,z+fz*mult1,x+fx*mult2,y+fy*mult2,z+fz*mult2)

        if(hittype ~= 0) then
            SetDrawColor("0xff0000")
        else
            SetDrawColor("0x22ff00")
        end

        -- if last_type ~= hittype then
        --     AddPlayerChat('type:' ..hittype)
        --     AddPlayerChat('id:' ..hitid)
        -- end
    end
end)