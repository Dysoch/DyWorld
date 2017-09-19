
--settings.startup["DyWorld-debug"].value
--settings.startup["DyWorld-resource-water"].value
--settings.startup["DyWorld-modules"].value
--settings.global["DyWorld-hell"].value
--settings.global["DyWorld-enemy-war"].value

-- can use: "runtime-global", "startup"

data:extend({
	{
		type = "bool-setting",
		name = "DyWorld-debug",
		setting_type = "startup",
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "DyWorld-Defense",
		setting_type = "startup",
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "DyWorld-Enemies",
		setting_type = "startup",
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "DyWorld-Modules",
		setting_type = "startup",
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "DyWorld-Warfare",
		setting_type = "startup",
		default_value = false,
	},
})