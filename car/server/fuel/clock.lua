AddEvent("OnPackageStart", function()
    CreateTimer(function()
        for _,v in pairs(GetAllVehicles()) do
            local engine_state = GetVehicleEngineState(v)
            local fuel = GetFuel(v)

            if fuel == 0 then 
                StopVehicleEngine(v) 
            end

            if engine_state then
                SetFuel(v, fuel - 1)
                print('id : ' .. v .. ' | fuel : ' .. fuel)
            end
        end
    end, 20000)
end)