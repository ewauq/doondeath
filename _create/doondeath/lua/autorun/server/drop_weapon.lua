--
-- GM:DoPlayerDeath( Player ply, Entity attacker, CTakeDamageInfo dmg )
--
-- Handles the player's death.
-- Player:Alive returns true when this is called and the player will be considered dead right after this hook.
-- See GM:PostPlayerDeath for a hook in which the player is 100% dead. See also GM:PlayerDeath.
--
-- https://wiki.garrysmod.com/page/GM/DoPlayerDeath
--
hook.Add("DoPlayerDeath", "DOD_DropWeapons_DoPlayerDeath_sv", function(ply, attacker, dmg)

    -- If Drop on Death is disabled
    if !GetConVar("dod_drop_on_death_enable"):GetBool() then return end

    local mode = GetConVar("dod_drop_on_death_mode"):GetInt()

    -- Sanitization
    if !table.contains({0, 1}, mode) then
        RunConsoleCommand("dod_drop_on_death_mode", "0")
        mode = 0
    end

    -- Classic dropping mode
    if mode == 0 or mode == 1 then

        -- Setting the current weapon as the first entity of the list
        local weps = {}
        table.insert(weps, ply:GetActiveWeapon())

        for _, wep in pairs(ply:GetWeapons()) do
            if wep != ply:GetActiveWeapon() then table.insert(weps, wep) end
        end

        -- Browsing all stored weapons
        for k, wep in pairs(weps) do

            if IsValid(wep) then

                ply:StripWeapon(wep:GetClass())

                -- Using ply:DropWeapon() may causes several errors and bone glitches
                -- it is better to create a new valid entity
                local ent = ents.Create(wep:GetClass())

                ent:SetClip1(wep:Clip1())
                ent:SetClip2(wep:Clip2())
                ent:SetPos(ply:GetPos())
                ent:Spawn()

                -- Physical properties
                if IsValid(ent:GetPhysicsObject()) then
                    ent:SetCollisionGroup(COLLISION_GROUP_WORLD)
            		ent:GetPhysicsObject():SetMass(200)
            		ent:GetPhysicsObject():SetVelocityInstantaneous(ply:GetVelocity())
            		ent:GetPhysicsObject():SetDragCoefficient(math.random(0, 100))
                end

                -- Stocking the entity to remove it later
                dropped_weapons[ent:EntIndex()] = ent

                timer.Create("del_" .. ent:EntIndex(), GetConVar("dod_weapon_stay_duration"):GetInt(), 1, function()
        			if ent:IsValid() then ent:Remove() end
        		end)

            end

            -- If we want to drop only the active weapon
            if mode == 1 then return end

            -- Weapon dropping limit
            if k == GetConVar("dod_max_dropped_weapons"):GetInt() then return end

        end

    end

end)


--
-- GM:EntityRemoved( Entity ent )
--
-- Called right before the removal of an entity.
--
-- https://wiki.garrysmod.com/page/GM/EntityRemoved
--
hook.Add("EntityRemoved", "DOD_DropWeapons_EntityRemoved_sv", function(ent)

    if ent:EntIndex() == -1 then return end

	-- Removing dropped entities
    for key, val in pairs(dropped_weapons) do
        if ent:EntIndex() == key then dropped_weapons[key] = nil end
    end

end)
