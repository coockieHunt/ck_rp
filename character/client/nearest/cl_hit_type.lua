function GetHitType()
    local mult1 = 30
    local mult2 = 110
    local x, y, z = GetPlayerLocation()
    local fx,fy,fz = GetPlayerForwardVector(GetPlayerId())
    local hittype, hitid, impactX1, impactY1, impactZ1 = LineTrace(x+fx*mult1,y+fy*mult1,z+fz*mult1,x+fx*mult2,y+fy*mult2,z+fz*mult2)
    CallRemoteEvent("UpdateHitType", hittype, hitid)
end

AddEvent("OnGameTick", function(DeltaSeconds)
    GetHitType()
end)