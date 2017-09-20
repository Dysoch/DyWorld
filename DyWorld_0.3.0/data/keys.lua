data:extend({
	-- keybindings
	{
		type = "custom-input",
		name = "DyWorld_Stats",
		key_sequence = "PAD 1"
	},
	{
		type = "custom-input",
		name = "DyWorld_Skills",
		key_sequence = "PAD 2"
	},
	{
		type = "custom-input",
		name = "DyWorld_RoadMap",
		key_sequence = "PAD 3"
	},
})

if settings.startup["DyWorld-debug"].value then
data:extend({
	-- keybindings debug
	{
		type = "custom-input",
		name = "DyWorld_Debug",
		key_sequence = "PAD 0"
	},
	{
		type = "custom-input",
		name = "DyWorld_Debug_LOG",
		key_sequence = "PAD ."
	},
})
end