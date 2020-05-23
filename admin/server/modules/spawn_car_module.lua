local module = {
    name = "spawn",
    id = "spawn_car",
    select = "car",
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
    AddForm('vehicles', "vehicles", "car_id", {
        ["default_select"] = 5
    })
    AddForm('color', "color", "color", {})
    AddForm('text', "healt", "healt", {
        ['default_value'] = "5000",
        ['place_holder'] = 'max 5000',
    })
    AddForm('spacer', "option", "",  {})
    AddForm('checkbox', "boost", "boost",  
        {
            ['checked'] = true
        }
    )
    AddForm('checkbox', "Auto mount", "AutoMount",
        {
            ['checked'] = true
        }
    )
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local AutoMount = false
    local boost = false
    if(data.AutoMount == 'on') then AutoMount = true end
    if(data.boost == 'on') then boost = true end
    local model = tonumber(data.car_id)

    local vehicle

	if (model < 1 or model > 26) then return AddPlayerChat(playerId, "Vehicle model "..model.." does not exist.") end

	local x, y, z = GetPlayerLocation(playerId)
	local h = GetPlayerHeading(playerId)

	if (vehicle == false) then return AddPlayerChat(playerId, "Failed to spawn your vehicle") end
	if(AutoMount)then
		vehicle = CreateVehicle(model, x, y, z, h)
		SetPlayerInVehicle(playerId, vehicle)
	else
		vehicle = CreateVehicle(model, x , y - 300, z, h - 90.0)
		print("Player location: "..x..", "..y..", "..z)
	end

	if(boost) then AttachVehicleNitro(vehicle, true) end
	
	if(data.color ~= nil) then
		data.color = "0x"..data.color
        SetVehicleColor(vehicle, data.color)
    else
        data.color = 'none'
	end

	SetVehicleLicensePlate(vehicle, "ADMIN")
	SetVehicleHealth(vehicle, data.healt)

    setupVehicule(vehicle, false, '[]', 0)
	
	AddAdminLog(playerId, "spawn car id : ".. model.." | color: ".. data.color .. " | boost : ".. strBool(boost))

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
