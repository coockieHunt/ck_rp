-- local mult1 = 30
-- local mult2 = 110

-- AddEvent("OnGameTick",function(ds)
--     local x, y, z = GetPlayerLocation()
--     local fx,fy,fz = GetPlayerForwardVector(GetPlayerId())
--     local hittype, hitid, impactX1, impactY1, impactZ1 = LineTrace(x+fx*mult1,y+fy*mult1,z+fz*mult1,x+fx*mult2,y+fy*mult2,z+fz*mult2)
--     local line = DrawLine3D(x+fx*mult1,y+fy*mult1,z+fz*mult1,x+fx*mult2,y+fy*mult2,z+fz*mult2)
    
--     if(hitid ~= 0) then
--         SetDrawColor("0xff0000")
--     else
--         SetDrawColor("0x22ff00")
--     end
-- end)