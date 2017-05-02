
--settings.startup["DyWorld-debug"].value
--settings.startup["DyWorld-resource-water"].value
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
		name = "DyWorld-resource-water",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "DyWorld-hell",
		setting_type = "runtime-global",
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "DyWorld-enemy-war",
		setting_type = "runtime-global",
		default_value = true,
	},
})