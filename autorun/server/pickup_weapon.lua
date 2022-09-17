--
-- GM:PlayerCanPickupWeapon( Player ply, Weapon wep )
--
-- Returns whether or not a player is allowed to pick up a weapon.
--
-- http://wiki.garrysmod.com/page/GM/PlayerCanPickupWeapon
--
hook.Add("PlayerCanPickupWeapon", "DOD_PickupWeapon_PlayerCanPickupWeapon_sv", function(ply, wep)

    local mode = GetConVar("dod_pickup_mode"):GetInt()

    -- Sanitization
    if !table.contains({0, 1}, mode) then
        RunConsoleCommand("dod_pickup_mode", "0")
        mode = 0
    end

    -- Pickup Mode : USE
    if mode == 0 then

        for key, ent in pairs(dropped_weapons) do
			if key == wep:EntIndex() then return false end
		end

    -- Pickup Mode : Walking on it
    else

        for key, ent in pairs(dropped_weapons) do

			if key == wep:EntIndex() then
                -- Excluding weapon only from pickup by walking
				if wep:IsWeapon() and !GetConVar("dod_pickup_dropped_weapons_enable"):GetBool() then return false end

				dropped_weapons[key] = nil
				timer.Remove("del_"..key)
			end

		end

		return true

    end

end)


--
-- GM:KeyPress( Player ply, number key )
--
-- Called whenever a player pressed a key included within the IN keys.
--
-- http://wiki.garrysmod.com/page/GM/KeyPress
--
hook.Add("KeyPress", "DOD_PickupWeapon_KeyPress_sv", function(ply, key)

	if key == IN_USE then

		local ent = ply:GetEyeTrace().Entity
		local distance = ply:GetPos():Distance(ply:GetEyeTrace().Entity:GetPos())

		-- Manual weapon pickup
		if ply:IsValid()
			and ent:IsWeapon()
			and distance <= 50
            and GetConVar("dod_pickup_dropped_weapons_enable"):GetBool() then

			ply:Give(ent:GetClass())
			ent:Remove()
			timer.Remove("del_" .. ent:EntIndex())

		end

	end

end)
