--
-- Gender death sounds list
--
death_sounds = {}

-- Male death sounds
death_sounds[1] = {
    Sound("vo/npc/male01/ow01.wav"),
    Sound("vo/npc/male01/ow02.wav"),
    Sound("vo/npc/barney/ba_pain01.wav"),
    Sound("vo/npc/barney/ba_pain02.wav"),
    Sound("vo/npc/barney/ba_pain03.wav"),
    Sound("vo/npc/barney/ba_pain04.wav"),
    Sound("vo/npc/barney/ba_pain05.wav"),
    Sound("vo/npc/barney/ba_pain06.wav"),
    Sound("vo/npc/barney/ba_pain07.wav"),
    Sound("vo/npc/barney/ba_pain08.wav"),
    Sound("vo/npc/barney/ba_pain09.wav"),
    Sound("vo/npc/barney/ba_pain10.wav"),
    Sound("vo/npc/male01/pain02.wav"),
    Sound("vo/npc/male01/pain03.wav"),
    Sound("vo/npc/male01/pain04.wav"),
    Sound("vo/npc/male01/pain05.wav"),
    Sound("vo/npc/male01/pain06.wav"),
    Sound("vo/npc/male01/pain07.wav"),
    Sound("vo/npc/male01/pain08.wav"),
    Sound("vo/npc/male01/pain09.wav")
}

-- Female death sounds
death_sounds[2] = {
    Sound("vo/npc/female01/ow01.wav"),
    Sound("vo/npc/female01/ow02.wav"),
    Sound("vo/npc/alyx/hurt04.wav"),
    Sound("vo/npc/alyx/hurt05.wav"),
    Sound("vo/npc/alyx/hurt06.wav"),
    Sound("vo/npc/alyx/hurt08.wav"),
    Sound("vo/npc/female01/pain01.wav"),
    Sound("vo/npc/female01/pain02.wav"),
    Sound("vo/npc/female01/pain03.wav"),
    Sound("vo/npc/female01/pain04.wav"),
    Sound("vo/npc/female01/pain05.wav"),
    Sound("vo/npc/female01/pain06.wav"),
    Sound("vo/npc/female01/pain07.wav"),
    Sound("vo/npc/female01/pain08.wav"),
    Sound("vo/npc/female01/pain09.wav")
}

-- Zombie death sounds
death_sounds[3] = {
    Sound("npc/zombie/zombie_die1.wav"),
    Sound("npc/zombie/zombie_die2.wav"),
    Sound("npc/zombie/zombie_die3.wav"),
    Sound("npc/zombie/zombie_pain1.wav"),
    Sound("npc/zombie/zombie_pain2.wav"),
    Sound("npc/zombie/zombie_pain3.wav"),
    Sound("npc/zombie/zombie_pain4.wav"),
    Sound("npc/zombie/zombie_pain5.wav"),
    Sound("npc/zombie/zombie_pain6.wav")
}

--
-- Death sounds random pitches
--
sound_pitch = {}

sound_pitch[1] = {80, 110} -- male
sound_pitch[2] = {90, 110} -- female
sound_pitch[3] = {70, 125} -- zombie

--
-- Player models list
--
female_models = {
    "alyx",
    "chell",
    "female",
    "medic10",
    "medic11",
    "medic12",
    "medic13",
    "medic14",
    "medic15",
    "mossman"
}

zombie_models = {
    "charple",
    "corpse",
    "skeleton",
    "zombi"
}

-- made global for other lua scripts
dropped_weapons = {}

--
-- Server cvars
--
CreateConVar("dod_death_sounds_enable", 1, FCVAR_ARCHIVE, "Plays a custom death sound depending of the player's gender.")
CreateConVar("dod_beep_death_sound_enable", 0, FCVAR_ARCHIVE, "Plays the suit beep-beeep-beeep on the player's death.")
CreateConVar("dod_drop_on_death_enable", 1, FCVAR_ARCHIVE, "Allows to drop weapons on death.")
CreateConVar("dod_drop_on_death_mode", 1, FCVAR_ARCHIVE, "Weapon drop on death mode: 0 = drop all weapons, 1 = drop the active weapon only, 3 = stock all weapons in a crate")
CreateConVar("dod_max_dropped_weapons", 25, FCVAR_ARCHIVE, "Set the limit of dropped weapons at the same time. (25 by default)")
CreateConVar("dod_weapon_stay_duration", 60, FCVAR_ARCHIVE, "Set how long a dropped weapon stay on the floor before being removed. (60 seconds by default)")
CreateConVar("dod_pickup_mode", 0, FCVAR_ARCHIVE, "Weapon pickup mode: 0 = Pickup using USE key, 1 = Pickup by walking on it")
CreateConVar("dod_pickup_dropped_weapons_enable", 1, FCVAR_ARCHIVE, "Allows the player to pickup dropped weapons")
