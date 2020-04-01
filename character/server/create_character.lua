function create_charactere(player, json)
    local data = json_decode(json)

    print(data.n)
    print(data.fn)
    print(data.a)
    print(data.k)

 
end
AddRemoteEvent("create_charactere", create_charactere)
