
--settings.startup["DyWorld.debug"].value
--settings.global["DyWorld.hell"].value

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
		name = "DyWorld-hell",
		setting_type = "runtime-global",
		default_value = false,
	},
})