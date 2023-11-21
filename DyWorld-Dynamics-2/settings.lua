
--settings.startup["DyWorld_Debug"].value

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
	{
		type = "bool-setting",
		name = "DyWorld_Story",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "int-setting",
		name = "DyWorld_Fire_Setting",
		setting_type = "startup",
		default_value = 60000,
        maximum_value = 60000,
        minimum_value = 100,
	},
	
	----- Game Altering Settings -----
	--[[{
		type = "bool-setting",
		name = "DyWorld_Combat_Overhaul",
		setting_type = "startup",
		default_value = false,
	},]]--
	--[[{
		type = "bool-setting",
		name = "DyWorld_Light_Setting",
		setting_type = "startup",
		default_value = false,
	},]]--
	--[[{
		type = "bool-setting",
		name = "DyWorld_Show_Resistances",
		setting_type = "startup",
		default_value = false,
	},]]--
	--[[{
		type = "bool-setting",
		name = "DyWorld_Tech_Upgrade",
		setting_type = "startup",
		default_value = true,
	},]]--
	--[[{
		type = "bool-setting",
		name = "DyWorld_Realistic_Recipes",
		setting_type = "startup",
		default_value = false,
	},]]--
	--[[{
		type = "int-setting",
		name = "DyWorld_Expensive_Modifier",
		setting_type = "startup",
		default_value = 5,
        maximum_value = 1000,
        minimum_value = 1,
	},]]--
	--[[{
		type = "int-setting",
		name = "DyWorld_Expensive_Tech_Modifier",
		setting_type = "startup",
		default_value = 1,
        maximum_value = 100000,
        minimum_value = 0.1,
	},]]--
	--[[{
		type = "string-setting",
		name = "DyWorld_Difficulty",
		setting_type = "startup",
		default_value = "Easy",
		allowed_values = {"Easy", "Normal", "Hard"},
	},]]--
	----- Map Settings -----
    --[[{
        type = "bool-setting",
        name = "DyWorld_Autosave_Story",
        setting_type = "runtime-global",
        default_value = true,
    },]]--
	--[[{
		type = "string-setting",
		name = "DyWorld_Attack_Difficulty",
        setting_type = "runtime-global",
		default_value = "Easy",
		allowed_values = {"Peaceful", "Easy", "Medium", "Hard", "Death"},
	},]]--
	--[[{
		type = "string-setting",
		name = "DyWorld_Surival_Difficulty",
        setting_type = "runtime-global",
		default_value = "Normal",
		allowed_values = {"Off", "Easy", "Normal", "Hard", "Insane"},
	},]]--
    --[[{
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
        name = "DyWorld_DIS_Trash",
		order = "a",
        setting_type = "runtime-per-user",
        default_value = true
    },
   --[[{
        type = "bool-setting",
        name = "DyWorld_Attack_Messages",
		order = "a",
        setting_type = "runtime-per-user",
        default_value = true
    },]]--
})

