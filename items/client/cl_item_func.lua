function firework(player)
    local x, y, z = GetPlayerLocation()
    CreateFireworks(5, x - 50, y, z, 90, 0, 0)
end
AddRemoteEvent("firework", firework)
