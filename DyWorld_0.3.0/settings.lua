
--settings.startup["DyWorld_Debug"].value
--settings.startup["DyWorld_Defense"].value
--settings.startup["DyWorld_Enemies"].value
--settings.startup["DyWorld_Modules"].value
--settings.startup["DyWorld_Warfare"].value
--settings.startup["DyWorld_Processing"].value
--settings.startup["DyWorld_Power"].value
--settings.startup["DyWorld_Logistics"].value
--settings.startup["DyWorld_Extraction"].value
--settings.startup["DyWorld_Story"].value
--settings.startup["DyWorld_Needs"].value
--settings.player["DyWorld_User_Tick_Stat_GUI"].value

-- can use: "runtime-global", "startup"

data:extend({
	{
		type = "bool-setting",
		name = "DyWorld_Debug",
		setting_type = "startup",
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Defense",
		setting_type = "startup",
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Enemies",
		setting_type = "startup",
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Modules",
		setting_type = "startup",
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Warfare",
		setting_type = "startup",
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Processing",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Power",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Logistics",
		setting_type = "startup",
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Extraction",
		setting_type = "startup",
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Story",
		setting_type = "startup",
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Needs",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "int-setting",
		name = "DyWorld_User_Tick_Stat_GUI",
		setting_type = "runtime-per-user",
		default_value = 1,
		minimum_value = 1,
		maximum_value = 3600,
	},
})