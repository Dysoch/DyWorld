
--settings.startup["DyWorld_Combat_Overhaul"].value

-- can use: "runtime-global", "startup"

data:extend({
	----- Debug Settings -----
	{
		type = "bool-setting",
		name = "DyWorld_Debug",
		setting_type = "startup",
		default_value = false,
	},
	
	----- Content Altering Settings -----
	
	----- Game Altering Settings -----
	{
		type = "bool-setting",
		name = "DyWorld_Combat_Overhaul",
		setting_type = "startup",
		default_value = false,
	},
	----- Map Settings -----
    --[[{
        type = "bool-setting",
        name = "DyWorld_Loot_Deconstruct",
		order = "a",
        setting_type = "runtime-global",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "DyWorld_Loot_Deconstruct_Message",
		order = "a",
        setting_type = "runtime-global",
        default_value = false
    },
	{
		type = "int-setting",
		name = "DyWorld_Loot_Deconstruct_Timer",
        setting_type = "runtime-global",
		default_value = 60,
        maximum_value = 300,
        minimum_value = 5,
	},]]--
	----- Per Player Settings -----
   {
        type = "bool-setting",
        name = "DyWorld_Phase_Messages",
		order = "a",
        setting_type = "runtime-per-user",
        default_value = true
    },
   {
        type = "bool-setting",
        name = "DyWorld_Attack_Messages",
		order = "a",
        setting_type = "runtime-per-user",
        default_value = true
    },
})

