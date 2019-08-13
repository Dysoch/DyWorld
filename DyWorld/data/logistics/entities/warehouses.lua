require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

data:extend({
	{
		type = "container",
		name = "warehouse-basic",
		icon = dyworld_path_icon.."warehouse-basic.png",
		icon_size = 32,
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		minable = {mining_time = 2, result = "warehouse-basic"},
		max_health = 450,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		resistances =
		{
			{
				type = "fire",
				percent = 90
			}
		},
		collision_box = {{-2.7, -2.7}, {2.7, 2.7}},
		selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
		fast_replaceable_group = "container",
		inventory_size = 1800,
		scale_info_icons = true,
		picture =
		{
			filename = dyworld_path_entity.."warehouse-basic.png",
			priority = "high",
			width = 260,
			height = 240,
			shift = {1.0, -0.3},
		},
		circuit_wire_max_distance = 7.5,
		circuit_wire_connection_point =
		{
			shadow =
			{
				red = {2.52, 0.65},
				green = {2.01, 0.65}
			},
			wire =
			{
				red = {2.22, 0.32},
				green = {1.71, 0.32}
			}
		},
	},
})

function createLogisticContainer(name, logistic_type)
	local p = table.deepcopy(data.raw["container"][name.."-basic"])
	p.name = name.."-"..logistic_type
	p.minable.result = p.name
	p.icon = dyworld_path_icon..p.name..".png"
	p.picture.filename = dyworld_path_entity..p.name..".png"
	p.type = "logistic-container"
	p.logistic_mode = logistic_type
	return p
end


local warehouse_passive_provider_Entity = createLogisticContainer("warehouse", "passive-provider")


data:extend({
	warehouse_passive_provider_Entity,
	{
		type = "item",
		name = "warehouse-basic",
		icon = dyworld_path_icon.."warehouse-basic.png",
		icon_size = 32,
		subgroup = "storage",
		order = "warehouse-basic",
		place_result = "warehouse-basic",
		stack_size = 50,
	},
	{
		type = "item",
		name = "warehouse-passive-provider",
		icon = dyworld_path_icon.."warehouse-passive-provider.png",
		icon_size = 32,
		subgroup = "logistic-network",
		order = "warehouse-passive-provider",
		place_result = "warehouse-passive-provider",
		stack_size = 50,
	},
	{ 
		type = "recipe",
		name = "warehouse-basic",
		enabled = false,
		ingredients =
		{
			{ "steel-plate", 200 },
			{ "stone-brick", 40 },
			{ "iron-stick", 85 },
		},
		energy_required = 30,
		result = "warehouse-basic",
	},
	{ 
		type = "recipe",
		name = "warehouse-passive-provider",
		enabled = false,
		ingredients =
		{
			{ "warehouse-basic", 1 },
			{ "logistic-chest-passive-provider", 1 },
			{ "steel-plate", 10 },
			{ "iron-stick", 15 },
		},
		energy_required = 5,
		result = "warehouse-passive-provider",
	},
	{
		type = "technology",
		name = "warehouse-research",
		icon = dyworld_path_tech.."warehouse-research.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "warehouse-basic",
			},
		},
		prerequisites = { "steel-processing" },
		unit =
		{
			count = 50,
			ingredients =
			{
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
			},
			time = 30
		},
		order = "c-a"
	},
	{
		type = "technology",
		name = "warehouse-logistics-research-1",
		icon = dyworld_path_tech.."warehouse-logistics-research.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "warehouse-passive-provider",
			},
		},
		prerequisites = { "warehouse-research", "robotics" },
		unit =
		{
			count = 150,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
			},
			time = 30
		},
		order = "c-k-a"
	},
})