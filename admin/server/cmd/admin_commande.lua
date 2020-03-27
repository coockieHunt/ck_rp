-- spawn clothing
function cmd_set_clothing_preset(player, target, clothing_preset)
    if(isnil(target) or isnil(clothing_preset)) then return AddPlayerChat(player, "Usage: /clothing <target> <clothing id>") end
    admin_clothing_preset(player, target, clothing_preset)
end
AddCommand("clothing", cmd_set_clothing_preset)

-- spawn car
function cmd_car_spawn(player, model, mount, boost, color)
    if(isnil(model)) then return AddPlayerChat(player, "Usage: /car <car id> <:auto mount (true)> <:boost (true)> <:color (0x000)>") end

    if(isnil(mount)) then 
        mount = true 
    else
        mount = toboolean(mount)
    end

    if(isnil(boost)) then 
        boost = true 
    else
        boost = toboolean(boost)
    end

    if(isnil(color)) then color = "000000" end

    admin_car_spawn(player, model, mount, boost, color)
end
AddCommand("car", cmd_car_spawn)


function cmd_admin_weapon(player, weapon, slot, ammo)
    if(isnil(weapon)) then return AddPlayerChat(player, "Usage: /weapon <weapon id> <:slot (2)> <:ammo (150)>") end

    if (isnil(slot)) then slot = 2 end
    if (isnil(ammo)) then ammo = 150 end

    admin_weapon_spawn(player, weapon, slot, ammo)
end
AddCommand("weapon", cmd_admin_weapon)

function cmd_admin_kill(player, target)
    if(isnil(target)) then return AddPlayerChat(player, "Usage: /kill <target player id>") end

    admin_kill(player, target)
end
AddCommand("kill", cmd_admin_kill)

function cmd_admin_anim(player, target, animId)
    if(isnil(target) or isnil(animId)) then return AddPlayerChat(player, "Usage: /anim <target : player id> <animID : anim id>") end

    admin_anim(player, target, animId)
end
 AddCommand("anim", cmd_admin_anim)

 --heal
 function cmd_admin_heal(player, target, num)
    if(isnil(target) or isnil(num)) then return AddPlayerChat(player, "Usage: /heal <target : player id> <num : health player 1-100>") end

    admin_heal(player, target, num)
 end
 AddCommand("heal", cmd_admin_heal)

 --armor
 function cmd_admin_armor(player, target,  num)
    if(isnil(target) or isnil(num)) then return AddPlayerChat(player, "Usage: /armor <target : player id> <num : armor player 1-100>") end

    admin_armor(player, target, num)
 end
 AddCommand("armor", cmd_admin_armor)

 --freecam
 function cmd_admin_fc(player, disable)
    AddPlayerChat(player, "Usage: /armor false (for exit free cam mode)") 
    admin_fc(player, disable)
 end
 AddCommand("freecam", cmd_admin_fc)

 -- rec pos
function cmd_admin_pos(player)
    admin_pos(player)
 end
 AddCommand("pos", cmd_admin_pos)

 -- tp pos
 function cmd_admin_tpPos(player, x, y, z)
    if(isnil(x) or isnil(y) or isnil(z)) then return AddPlayerChat(player, "Usage: /tpPos <x, y, z axis>") end

    dmin_tp_to_pos(player, x, y, z)
end
AddCommand("tpPos", cmd_admin_tpPos)

--tp to player
function cmd_admin_tpTo(main, to)
    if(isnil(main) or isnil(to)) then return AddPlayerChat(player, "Usage: /tpto <main> -} <to> ") end

    admin_tp_to(main, to)
end
AddCommand('tpTo', cmd_admin_tpTo)

--tp to prest pos
function cmd_admin_tp_preset(player, dest)
    if(isnil(dest)) then return AddPlayerChat(player, "Usage: /tp <pos preset> ") end

    admin_tp_preset_pos(player, dest)
end
AddCommand('tp', cmd_admin_tp_preset)
