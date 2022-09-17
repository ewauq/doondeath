--
-- GM:HUDShouldDraw( string name )
--
-- Called when the Gamemode is about to draw a given element on the client's HUD (heads-up display).
--
-- http://wiki.garrysmod.com/page/GM/HUDShouldDraw
--
hook.Add("HUDShouldDraw", "DOD_Red_Screen_cl", function(name)

    if GetConVar("dod_red_screen_on_death_enable"):GetBool() then return end

    if(name == "CHudDamageIndicator") then
        print(name)
        return false
    end

end)
