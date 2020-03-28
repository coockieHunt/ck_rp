local skeletalMesh = {}

local MeshElement = {
    ["body"] = "Body",
    ['hair'] = "Clothing0",
    ['shirt'] = "Clothing1",
    ['accessory'] = "Clothing3",
    ['pants'] = "Clothing4",
    ['shoes'] = "Clothing5"
}

function setSkeletalMesh(type, asset)
    local player = GetPlayerId()
        
    local SkeletalMeshComponent = GetPlayerSkeletalMeshComponent(player, MeshElement[type])
    SkeletalMeshComponent:SetSkeletalMesh(USkeletalMesh.LoadFromAsset(asset))
    SkeletalMeshComponent:SetFloatParameterOnMaterials("PupilScale", 1.5)
end
AddRemoteEvent("setSkeletalMesh", setSkeletalMesh)


function removeSkeletalMesh(type)
    local player = GetPlayerId()
	SkeletalMeshComponent = GetPlayerSkeletalMeshComponent(player, MeshElement[type])
	SkeletalMeshComponent:SetSkeletalMesh(nil)
end
AddRemoteEvent("removeSkeletalMesh", removeSkeletalMesh)




