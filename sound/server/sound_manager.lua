local sound_object = {}

function NewSoun3d(var, file, x, y, z, radius, volume, loop)
	loop = loop or false
	volume = volume or 1.0

	local object = CreateObject(1, x, y, z)

	SetObjectPropertyValue(object, "type", "SoundStream", true)

	SetObjectPropertyValue(object, "var", var, true)
	SetObjectPropertyValue(object, "file", file, true)
	SetObjectPropertyValue(object, "radius", radius, true)
	SetObjectPropertyValue(object, "volume", volume, true)
	SetObjectPropertyValue(object, "loop", loop, true)
	SetObjectStreamDistance(object, radius)

	sound_object[object] = var
end

function DestroySound3d(var)
	for k,v in pairs(sound_object) do
		if v == var then
			DestroyObject(k)
			sound_object[k] = nil
			for _, v in pairs(GetAllPlayers()) do
				CallRemoteEvent(v, 'DestroySound3d', k)
				
			end
		end
    end 
end

function SoundClientFinished(playerId, object)
	local type = GetObjectPropertyValue(object, "type")
	if type == "SoundStream" then
		local var = GetObjectPropertyValue(object, "var")
		if GetObjectPropertyValue(object, "loop") then
			local x,y,z = GetObjectLocation(object)
			local file = GetObjectPropertyValue(object, "file")
			local radius = GetObjectPropertyValue(object, "radius")
			local volume = GetObjectPropertyValue(object, "volume")
			local loop = GetObjectPropertyValue(object, "loop")
			local var = GetObjectPropertyValue(object, "var")

			local new_object = CreateObject(1, x, y, z)

			SetObjectPropertyValue(new_object, "type", "SoundStream", true)

			SetObjectPropertyValue(new_object, "var", var, true)
			SetObjectPropertyValue(new_object, "file", file, true)
			SetObjectPropertyValue(new_object, "radius", radius, true)
			SetObjectPropertyValue(new_object, "volume", volume, true)
			SetObjectPropertyValue(new_object, "loop", loop, true)

			sound_object[new_object] = var
		end

		DestroyObject(object)
		sound_object[object] = nil
	end
end
AddRemoteEvent("SoundClientFinished", SoundClientFinished)