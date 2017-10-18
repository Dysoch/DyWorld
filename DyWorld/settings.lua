
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
--settings.startup["DyWorld_Metallurgy"].value

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
		default_value = true,
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
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Extraction",
		setting_type = "startup",
		default_value = true,
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
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Metallurgy",
		setting_type = "startup",
		default_value = true,
	},
})