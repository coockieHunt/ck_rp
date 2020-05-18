local module = {
    name = "teleport XYZ",
    id = "tp_pos",
    select = "teleport",
    level = 1
}

function module:GetName()
    return module.name
end

function module:GetSelect()
    return module.select
end

function module:GetId()
    return module.id
end

function module:GetLevel()
    return module.level
end

-- func
function module:OnBuild()
    AddForm('player', "target", "target", {})

    AddForm('spacer', 'positions', 'positions', {})

    AddForm('text', 'x', 'x', {})
    AddForm('text', 'y', 'y', {})
    AddForm('text', 'z', 'z', {})
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local target = data['target']

    local x = data['x']
    local y = data['y']
    local z = data['z']
    
    admin_tp_to_pos(target, x, y, z)

    CloseAdminDialog(playerId)
end

AddRemoteEvent("admin_tp_preset_pos", function(player, target, x, y, z, h)
    admin_tp_to_pos(target, x, y, z)
end)

function admin_tp_to_pos(player, x, y, z)
	local msg = "teleport to x =" .. x ..", y= ".. y ..", z= " .. z
	if (GetPlayerVehicleSeat(player) == 1) then
	local vehicle = GetPlayerVehicle(player)
	SetVehicleLocation(vehicle, x, y, z + 30)
	if (to[4] ~= -1.0) then
		SetVehicleHeading(vehicle, 0)
	end

		SetVehicleLinearVelocity(vehicle, 0.0, 0.0, 0.0, true)
		SetVehicleAngularVelocity(vehicle, 0.0, 0.0, 0.0, true)
		local rx, ry, rz = GetVehicleRotation(vehicle)
		SetVehicleRotation(vehicle, 0.0, ry, 0.0)
	else
		SetPlayerLocation(player, x, y, z)
		if (0 ~= -1.0) then
			SetPlayerHeading(player, 0)
		end
	end
 end

AddAdminModule(module)
