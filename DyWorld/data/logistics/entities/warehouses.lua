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
		inventory_size = 2200,
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

local warehouse_active_provider = createLogisticContainer("warehouse", "active-provider")
local warehouse_passive_provider = createLogisticContainer("warehouse", "passive-provider")
local warehouse_storage = createLogisticContainer("warehouse", "storage")
warehouse_storage.logistic_slots_count = 1
local warehouse_buffer = createLogisticContainer("warehouse", "buffer")
warehouse_buffer.logistic_slots_count = 24
local warehouse_requester = createLogisticContainer("warehouse", "requester")
warehouse_requester.logistic_slots_count = 24


data:extend({
	warehouse_active_provider,
	warehouse_passive_provider,
	warehouse_storage,
	warehouse_buffer,
	warehouse_requester,
	{
		type = "item",
		name = "warehouse-basic",
		icon = dyworld_path_icon.."warehouse-basic.png",
		icon_size = 32,
		subgroup = dy.."chests-warehouse",
		order = "warehouse-basic",
		place_result = "warehouse-basic",
		stack_size = 50,
	},
	{
		type = "item",
		name = "warehouse-passive-provider",
		icon = dyworld_path_icon.."warehouse-passive-provider.png",
		icon_size = 32,
		subgroup = dy.."chests-warehouse",
		order = "warehouse-passive-provider",
		place_result = "warehouse-passive-provider",
		stack_size = 50,
	},
	{
		type = "item",
		name = "warehouse-active-provider",
		icon = dyworld_path_icon.."warehouse-active-provider.png",
		icon_size = 32,
		subgroup = dy.."chests-warehouse",
		order = "warehouse-active-provider",
		place_result = "warehouse-active-provider",
		stack_size = 50,
	},
	{
		type = "item",
		name = "warehouse-buffer",
		icon = dyworld_path_icon.."warehouse-buffer.png",
		icon_size = 32,
		subgroup = dy.."chests-warehouse",
		order = "warehouse-buffer",
		place_result = "warehouse-buffer",
		stack_size = 50,
	},
	{
		type = "item",
		name = "warehouse-requester",
		icon = dyworld_path_icon.."warehouse-requester.png",
		icon_size = 32,
		subgroup = dy.."chests-warehouse",
		order = "warehouse-requester",
		place_result = "warehouse-requester",
		stack_size = 50,
	},
	{
		type = "item",
		name = "warehouse-storage",
		icon = dyworld_path_icon.."warehouse-storage.png",
		icon_size = 32,
		subgroup = dy.."chests-warehouse",
		order = "warehouse-storage",
		place_result = "warehouse-storage",
		stack_size = 50,
	},
	{ 
		type = "recipe",
		name = "warehouse-basic",
		enabled = false,
		ingredients =
		{
			{ "steel-plate", 200 },
			{ "concrete", 40 },
			{ "tin-plate", 20 },
			{ "basic-control-board", 50 },
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
			{ "electronic-control-board", 25 },
			{ "frame", 15 },
		},
		energy_required = 5,
		result = "warehouse-passive-provider",
	},
	{ 
		type = "recipe",
		name = "warehouse-active-provider",
		enabled = false,
		ingredients =
		{
			{ "warehouse-basic", 1 },
			{ "tough-control-board", 25 },
			{ "logistic-unit", 1 },
		},
		energy_required = 5,
		result = "warehouse-active-provider",
	},
	{ 
		type = "recipe",
		name = "warehouse-storage",
		enabled = false,
		ingredients =
		{
			{ "warehouse-basic", 1 },
			{ "advanced-control-board", 25 },
			{ "housing", 2 },
		},
		energy_required = 5,
		result = "warehouse-storage",
	},
	{ 
		type = "recipe",
		name = "warehouse-requester",
		enabled = false,
		ingredients =
		{
			{ "warehouse-basic", 1 },
			{ "advanced-control-board", 25 },
			{ "housing", 2 },
		},
		energy_required = 5,
		result = "warehouse-requester",
	},
	{ 
		type = "recipe",
		name = "warehouse-buffer",
		enabled = false,
		ingredients =
		{
			{ "warehouse-basic", 1 },
			{ "tough-control-board", 25 },
			{ "logistic-unit", 1 },
		},
		energy_required = 5,
		result = "warehouse-buffer",
	},
})

DyWorld_Add_To_Tech("storage-solutions-2", "warehouse-basic")
DyWorld_Add_To_Tech("storage-solutions-3", "warehouse-passive-provider")
DyWorld_Add_To_Tech("storage-solutions-4", "warehouse-storage")
DyWorld_Add_To_Tech("storage-solutions-4", "warehouse-requester")
DyWorld_Add_To_Tech("storage-solutions-5", "warehouse-active-provider")
DyWorld_Add_To_Tech("storage-solutions-5", "warehouse-buffer")