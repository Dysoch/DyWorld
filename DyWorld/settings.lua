
--settings.startup["DyWorld_Debug"].value
--settings.startup["DyWorld_Modules"].value
--settings.startup["DyWorld_Warfare"].value
--settings.startup["DyWorld_Warfare_Difficulty"].value
--settings.startup["DyWorld_Stack_Size_Mult"].value
--settings.startup["DyWorld_Processing"].value
--settings.startup["DyWorld_Power"].value
--settings.startup["DyWorld_Logistics"].value
--settings.startup["DyWorld_Extraction"].value
--settings.startup["DyWorld_Story"].value
--settings.startup["DyWorld_Needs"].value
--settings.startup["DyWorld_Metallurgy"].value
--settings.startup["DyWorld_Equipment"].value
--settings.startup["DyWorld_Chemistry"].value
--settings.startup["DyWorld_Hidden_Recipes"].value
--settings.startup["DyWorld_PvP"].value
--settings.startup["DyWorld_Roboport_Standard"].value
--settings.startup["DyWorld_Circuit_Components_Auto_Craft"].value

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
		name = "DyWorld_Modules",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Warfare",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "int-setting",
		name = "DyWorld_Warfare_Difficulty",
		setting_type = "startup",
		default_value = 2,
        maximum_value = 5,
        minimum_value = 1,
		allowed_values = Warfare_Modes,
        order = "DyWorld_Warfare_Difficulty"
	},
	{
		type = "int-setting",
		name = "DyWorld_Stack_Size_Mult",
		setting_type = "startup",
		default_value = 1,
        maximum_value = 5000,
        minimum_value = 1,
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
	{
		type = "bool-setting",
		name = "DyWorld_Equipment",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Chemistry",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Infinite_Resources",
		setting_type = "startup",
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Hidden_Recipes",
		setting_type = "startup",
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Roboport_Standard",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "DyWorld_PvP",
		setting_type = "startup",
		default_value = false,
	},
    {
        type = "bool-setting",
        name = "DyWorld_loaders_snap_to_back",
		order = "a",
        setting_type = "runtime-per-user",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "DyWorld_loaders_snap_to_front",
		order = "b",
        setting_type = "runtime-per-user",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "DyWorld_Circuit_Components_Auto_Craft",
        setting_type = "startup",
        default_value = false
    },
})

Warfare_Modes =
{ 1, 2, 3, 4, 5 }