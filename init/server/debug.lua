-- manage
local vehicle_debug = {}
local warn_alert = ' /!\\ :: WARNING DEBUG MODE ENABLED :: /!\\'

function OnPackageStart()
    if IfDebugMode() then 
        print(warn_alert)

        spawn_car_debug()
    end 

    return false
end
AddEvent("OnPackageStart", OnPackageStart)

function OnPlayerSpawn(playerid)
    if IfDebugMode() then 
        AddPlayerChat(playerid, warn_alert)
    end 
end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)

-- vehcile
function spawn_car_debug()
    if not IfDebugMode() then return false end 

    local vehicle = CreateVehicle(19, 117404, 163024, 2987, 25)
    local vehicle_fuel_tank = GetFuelTankById(25)
    SetVehicleLicensePlate(vehicle, "DEBUG")
    SetVehicleHealth(vehicle, 100)
    SetFuel(vehicle, 50)
    table.insert(vehicle_debug, vehicle)
    

    local vehicle_1 = CreateVehicle(25, 117219, 163561, 2987, 25)
    local vehicle_1_fuel_tank = GetFuelTankById(25)
    SetVehicleLicensePlate(vehicle_1, "DEBUG")
    SetVehicleHealth(vehicle_1, 5000)
    SetFuel(vehicle_1, 100)
    table.insert(vehicle_debug, vehicle_1)

    local upgrade = {
        boost = true,
        backfire = true
    }

    upgrade = json_encode(upgrade)

    SetVehiclePropertyValue(vehicle, "debug", true, true)
    SetVehiclePropertyValue(vehicle_1, "debug", true, true)
    setupVehicule(vehicle, false, '[]', upgrade, vehicle_fuel_tank, 0)
    setupVehicule(vehicle_1, false, '[]', upgrade, vehicle_1_fuel_tank, 0)

    AddPlayerChatAll("[debug] vehcile : " .. tablelength(vehicle_debug)/2 .. " create")
end

function destroy_debug_car(playerId)
    if not IfDebugMode() then return false end 
   
    local number = 0
    for _,v in pairs(vehicle_debug) do
        number = number + 1
        DestroyVehicle(v)
    end
    vehicle_debug = {}
    AddPlayerChatAll("[debug] vehcile : " .. number .. " destroy")
end
AddCommand("debug_destroy_car", destroy_debug_car)


function reset_debug_car(playerId) 
    if not IfDebugMode() then return false end 
    
    destroy_debug_car(playerId)
    spawn_car_debug()
end
AddCommand("debug_reset_car", reset_debug_car)

--fuc
function IfDebugMode()
    if _DEBUG then return true end
    return false
end