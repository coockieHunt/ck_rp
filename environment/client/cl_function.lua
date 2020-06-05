function setTimeClient(time)
    SetTime(time)
end
AddRemoteEvent("setTimeClient", setTimeClient)


function setStarsBrightClient(brightness)
    SetStarsBrightness(brightness)
end
AddRemoteEvent("setStarsBrightClient", setStarsBrightClient)


function setFogDensityClient(FogDensity)
    SetFogDensity(FogDensity)
end
AddRemoteEvent("setFogDensityClient", setFogDensityClient)
