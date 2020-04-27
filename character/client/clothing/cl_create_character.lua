function SetCameraHead()
    local x, y, z  = GetPlayerLocation(GetPlayerId())
    SetCameraLocation(x - 50, y - 20, z + 80,true)
    SetCameraRotation(0, 0, 0, true) 
end
AddRemoteEvent("SetCameraHead", SetCameraHead)


function SetCameraBody()
    local x, y, z  = GetPlayerLocation(GetPlayerId())
    SetCameraLocation(x - 200, y - 30, z + 70,true)
    SetCameraRotation(- 20, 0, 0, true) 
end
AddRemoteEvent("SetCameraBody", SetCameraBody)
