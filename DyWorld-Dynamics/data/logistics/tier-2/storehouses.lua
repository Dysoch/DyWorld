



data:extend({
	{
		type = "container",
		name = "storehouse-basic",
		icon = DyDs_path_icon.."storehouse-basic.png",
		icon_size = 64,
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		minable = {mining_time = 2, result = "storehouse-basic"},
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
		collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		fast_replaceable_group = "container",
		inventory_size = 500,
		scale_info_icons = true,
		picture =
		{
			filename = DyDs_path_entity.."storehouse-basic.png",
			priority = "high",
			width = 129,
			height = 100,
			shift = {0.421875, 0},
		},
		circuit_wire_max_distance = 7.5,
		circuit_wire_connection_point =
		{
			shadow =
			{
				red = {0.56, -0.6},
				green = {0.26, -0.6}
			},
			wire =
			{
				red = {0.16, -0.9},
				green = {-0.16, -0.9}
			}
		},
	},
})

function createLogisticContainer(name, logistic_type)
	local p = table.deepcopy(data.raw["container"][name.."-basic"])
	p.name = name.."-"..logistic_type
	p.minable.result = p.name
	p.icon = DyDs_path_icon..p.name..".png"
	p.picture.filename = DyDs_path_entity..p.name..".png"
	p.type = "logistic-container"
	p.logistic_mode = logistic_type
	return p
end

local storehouse_active_provider = createLogisticContainer("storehouse", "active-provider")
local storehouse_passive_provider = createLogisticContainer("storehouse", "passive-provider")
local storehouse_storage = createLogisticContainer("storehouse", "storage")
storehouse_storage.logistic_slots_count = 1
local storehouse_buffer = createLogisticContainer("storehouse", "buffer")
storehouse_buffer.logistic_slots_count = 12
local storehouse_requester = createLogisticContainer("storehouse", "requester")
storehouse_requester.logistic_slots_count = 12


data:extend({
	storehouse_active_provider,
	storehouse_passive_provider,
	storehouse_storage,
	storehouse_buffer,
	storehouse_requester,
	{
		type = "item",
		name = "storehouse-basic",
		icon = DyDs_path_icon.."storehouse-basic.png",
		icon_size = 64,
		subgroup = DyDs.."chests-storehouse",
		order = "storehouse-basic",
		place_result = "storehouse-basic",
		stack_size = 50,
	},
	{
		type = "item",
		name = "storehouse-passive-provider",
		icon = DyDs_path_icon.."storehouse-passive-provider.png",
		icon_size = 64,
		subgroup = DyDs.."chests-storehouse",
		order = "storehouse-passive-provider",
		place_result = "storehouse-passive-provider",
		stack_size = 50,
	},
	{
		type = "item",
		name = "storehouse-active-provider",
		icon = DyDs_path_icon.."storehouse-active-provider.png",
		icon_size = 64,
		subgroup = DyDs.."chests-storehouse",
		order = "storehouse-active-provider",
		place_result = "storehouse-active-provider",
		stack_size = 50,
	},
	{
		type = "item",
		name = "storehouse-buffer",
		icon = DyDs_path_icon.."storehouse-buffer.png",
		icon_size = 64,
		subgroup = DyDs.."chests-storehouse",
		order = "storehouse-buffer",
		place_result = "storehouse-buffer",
		stack_size = 50,
	},
	{
		type = "item",
		name = "storehouse-requester",
		icon = DyDs_path_icon.."storehouse-requester.png",
		icon_size = 64,
		subgroup = DyDs.."chests-storehouse",
		order = "storehouse-requester",
		place_result = "storehouse-requester",
		stack_size = 50,
	},
	{
		type = "item",
		name = "storehouse-storage",
		icon = DyDs_path_icon.."storehouse-storage.png",
		icon_size = 64,
		subgroup = DyDs.."chests-storehouse",
		order = "storehouse-storage",
		place_result = "storehouse-storage",
		stack_size = 50,
	},
	{ 
		type = "recipe",
		name = "storehouse-basic",
		enabled = false,
		category = "assembling-tier-2",
		ingredients =
		{
			{ "iron-plate", 200 },
			{ "control-board-1", 25 },
		},
		energy_required = 30,
		result = "storehouse-basic",
	},
	{ 
		type = "recipe",
		name = "storehouse-passive-provider",
		enabled = false,
		category = "assembling-tier-2",
		ingredients =
		{
			{ "storehouse-basic", 1 },
			{ "control-board-2", 12 },
		},
		energy_required = 5,
		result = "storehouse-passive-provider",
	},
	{ 
		type = "recipe",
		name = "storehouse-active-provider",
		enabled = false,
		category = "assembling-tier-2",
		ingredients =
		{
			{ "storehouse-basic", 1 },
			{ "control-board-2", 12 },
		},
		energy_required = 5,
		result = "storehouse-active-provider",
	},
	{ 
		type = "recipe",
		name = "storehouse-storage",
		enabled = false,
		category = "assembling-tier-2",
		ingredients =
		{
			{ "storehouse-basic", 1 },
			{ "control-board-2", 12 },
		},
		energy_required = 5,
		result = "storehouse-storage",
	},
	{ 
		type = "recipe",
		name = "storehouse-requester",
		enabled = false,
		category = "assembling-tier-2",
		ingredients =
		{
			{ "storehouse-basic", 1 },
			{ "control-board-2", 12 },
		},
		energy_required = 5,
		result = "storehouse-requester",
	},
	{ 
		type = "recipe",
		name = "storehouse-buffer",
		enabled = false,
		category = "assembling-tier-2",
		ingredients =
		{
			{ "storehouse-basic", 1 },
			{ "control-board-2", 12 },
		},
		energy_required = 5,
		result = "storehouse-buffer",
	},
})