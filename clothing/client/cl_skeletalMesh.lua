function setSkeletalMesh(type, asset)
    local player = GetPlayerId()

    local SkeletalMeshComponent = GetPlayerSkeletalMeshComponent(player, __SkeletalMesh[type])
    SkeletalMeshComponent:SetSkeletalMesh(USkeletalMesh.LoadFromAsset(asset))
    SkeletalMeshComponent:SetFloatParameterOnMaterials("PupilScale", 1.5)
end
AddRemoteEvent("setSkeletalMesh", setSkeletalMesh)

function setSkeletalMeshColor(type, color)
    local player = GetPlayerId()
    local material = "Clothing Color"

    local SkeletalMeshComponent = GetPlayerSkeletalMeshComponent(player, __SkeletalMesh[type])

    if(type == "hair") then material = "Hair Color" end

    local r, g, b, a = HexToRGBAFloat("0x"..color)
    SkeletalMeshComponent:SetColorParameterOnMaterials(material, FLinearColor(r, g, b, a))
end
AddRemoteEvent("setSkeletalMeshColor", setSkeletalMeshColor)

function removeSkeletalMesh(type)
    local player = GetPlayerId()
	SkeletalMeshComponent = GetPlayerSkeletalMeshComponent(player, __SkeletalMesh[type])
	SkeletalMeshComponent:SetSkeletalMesh(nil)
end
AddRemoteEvent("removeSkeletalMesh", removeSkeletalMesh)




