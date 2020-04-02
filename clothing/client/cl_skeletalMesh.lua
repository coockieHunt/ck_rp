function setSkeletalMesh(type, asset)
    local player = GetPlayerId()
    
    local SkeletalMeshComponent = GetPlayerSkeletalMeshComponent(player, __SkeletalMesh[type])
    SkeletalMeshComponent:SetSkeletalMesh(USkeletalMesh.LoadFromAsset(asset))
    SkeletalMeshComponent:SetFloatParameterOnMaterials("PupilScale", 1.5)
end
AddRemoteEvent("setSkeletalMesh", setSkeletalMesh)

function SetColor(type, color)
end

function removeSkeletalMesh(type)
    local player = GetPlayerId()
	SkeletalMeshComponent = GetPlayerSkeletalMeshComponent(player, __SkeletalMesh[type])
	SkeletalMeshComponent:SetSkeletalMesh(nil)
end
AddRemoteEvent("removeSkeletalMesh", removeSkeletalMesh)




