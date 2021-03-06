local module = {
    name = "spawn",
    id = "spawn_car",
    select = "car_admin",
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
    
    AddForm('text', "healt <0 - 5000>", "healt", {
        ['default_value'] = "5000",
        ['place_holder'] = 'max 5000',
    })

    AddForm('spacer', "option", "",  {})
    AddForm('checkbox', "boost", "boost",  
        {
            ['checked'] = true
        }
    )
    AddForm('checkbox', "Auto mount", "autoMount",
        {
            ['checked'] = true
        }
    )
    AddForm('checkbox', "back fire", "backfire",
    {
        ['checked'] = true
    }
)
end

function module:OnOpen(playerId)
end

function module:Onexecute(playerId, data)
    local autoMount = false
    local boost = 0
    local backfire = 0
    if(data.autoMount == 'on') then autoMount = true end
    if(data.boost == 'on') then boost = 1 end
    if(data.backfire == 'on') then backfire = 1 end
    local model = tonumber(data.car_id)
    local fuel_tank = GetFuelTankById(data.car_id)

    local vehicle

	local x, y, z = GetPlayerLocation(playerId)
	local h = GetPlayerHeading(playerId)

    if (vehicle == false) then return AddPlayerChat(playerId, "Failed to spawn your vehicle") end
    
    if(autoMount)then
		vehicle = CreateVehicle(model, x, y, z, h)
		SetPlayerInVehicle(playerId, vehicle)
    else
		vehicle = CreateVehicle(model, x , y - 300, z, h - 90.0)
		print("Player location: "..x..", "..y..", "..z)
	end
	
	if(data.color ~= nil) then
		data.color = "0x"..data.color
        SetVehicleColor(vehicle, data.color)
    else
        data.color = 'none'
	end
    
	SetVehicleLicensePlate(vehicle, "ADMIN")
    SetVehicleHealth(vehicle, data.healt)
    SetFuel(vehicle, tonumber(fuel_tank))

    local upgrade = {
        boost = boost,
        backfire = backfire
    }

    upgrade = json_encode(upgrade)

    setupVehicule(vehicle, false, '[]', upgrade, fuel_tank, 0)
    ApplyUpgrade(vehicle, upgrade)

	AddAdminLog(playerId, "spawn car id : ".. model.." | color: ".. data.color .. " | boost : ".. strBool(boost))

    CloseAdminDialog(playerId)
end

AddAdminModule(module)
