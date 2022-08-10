
data:extend({	
	----- Content Altering Settings -----
	
	----- Game Altering Settings -----
	{
		type = "string-setting",
		name = "DyCore_Sett_Loot",
		setting_type = "startup",
		default_value = "1",
		allowed_values = {"0.25", "0.5", "1", "1.5", "2", "2.5", "3", "4", "5", "10"},
	},
	{
		type = "string-setting",
		name = "DyCore_Sett_Health_Enemy",
		setting_type = "startup",
		default_value = "1",
		allowed_values = {"0.25", "0.5", "1", "1.5", "2", "2.5", "3", "4", "5", "10"},
	},
	{
		type = "string-setting",
		name = "DyCore_Sett_Health_Player",
		setting_type = "startup",
		default_value = "1",
		allowed_values = {"0.25", "0.5", "1", "1.5", "2", "2.5", "3", "4", "5", "10"},
	},
	{
		type = "string-setting",
		name = "DyCore_Sett_Stacksize",
		setting_type = "startup",
		default_value = "1",
		allowed_values = {"0.25", "0.5", "1", "1.5", "2", "2.5", "3", "4", "5", "10"},
	},
	----- Map Settings -----
    --[[{
        type = "bool-setting",
        name = "DyWorld_Autosave_Story",
        setting_type = "runtime-global",
        default_value = true,
    },]]--
	----- Per Player Settings -----
    --[[{
        type = "bool-setting",
        name = "DyWorld_Attack_Messages",
		order = "a",
        setting_type = "runtime-per-user",
        default_value = true
    },]]--
})

