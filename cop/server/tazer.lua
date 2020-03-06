-- CREDIT
    -- author : FinnCoding
    -- link : https://github.com/FinnCoding/OnsetRagdoll
-- END
function OnTazerShot(player, weapon, hittype, hitid)	
	if (hittype == HIT_PLAYER) then
		if (weapon == 21) then
			SetPlayerRagdoll(hitid, true)
        Delay(_Cop_weapon.tazed_time, function() 
            SetPlayerRagdoll(hitid, false)
		end)
	end        
	end
end
AddEvent("OnPlayerWeaponShot", OnTazerShot)