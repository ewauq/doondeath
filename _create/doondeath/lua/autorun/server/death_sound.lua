--
-- GM:PostPlayerDeath( Player ply )
--
-- Called right after GM:DoPlayerDeath and GM:PlayerSilentDeath.
-- The player is considered dead when this is hook is called, Player:Alive will return false.
--
-- http://wiki.garrysmod.com/page/GM/PostPlayerDeath
--
hook.Add("PostPlayerDeath", "DOD_DeathSounds_PostPlayerDeath_sv", function(ply)

    if GetConVar("dod_death_sounds_enable"):GetBool() then

        -- Getting the player's gender
        -- 0 = auto-detect | 1 = male | 2 = female | 3 = zombie
        local gender = tonumber(ply:GetInfo("dod_player_gender"))

        -- Sanitization
        if !table.contains({0, 1, 2, 3}, gender) then
            ply:ConCommand("dod_player_gender 0")
            gender = 0
        end

        -- Gender auto-detection
        if gender == 0 then

            -- Player's gender by default
            gender = 1

            -- Female model detection
            for _, val in pairs(female_models) do
				if string.match(ply:GetModel(), val) then gender = 2 end
			end

            -- Zombie model detection
            for _, val in pairs(zombie_models) do
				if string.match(ply:GetModel(), val) then gender = 3 end
			end

        end

        -- Playing the Sound
        rnd = math.random(1, table.count(death_sounds[gender]))
        pitch = math.random(sound_pitch[gender][1], sound_pitch[gender][2])
        ply:EmitSound(death_sounds[gender][rnd], 100, pitch)

    end

end)

--
-- GM:PlayerDeathSound()
--
-- Returns whether or not the default death sound should be muted.
--
-- https://wiki.garrysmod.com/page/GM/PlayerDeathSound
--
hook.Add("PlayerDeathSound", "DOD_DeathSounds_PlayerDeathSound_sv", function(ply, attacker, dmg)

    if !GetConVar("dod_beep_death_sound_enable"):GetBool() then
        return true
    end

end)
