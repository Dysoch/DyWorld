



data:extend({
	----- Random Ores -----
  {
    type = "item",
    name = "asteroid-miner-random",
	icons = {
	  {
		icon = "__base__/graphics/icons/satellite.png",
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."z-space",
    order = "0",
    stack_size = 1,
    rocket_launch_products = 
	{
      {type = "item", name = "titanium-ore-impure", amount_min = 1, amount_max = 1000, probability = 0.05},
      {type = "item", name = "iron-ore-impure", amount_min = 1, amount_max = 1000, probability = 0.125},
      {type = "item", name = "copper-ore-impure", amount_min = 1, amount_max = 1000, probability = 0.135},
      {type = "item", name = "tin-ore-impure", amount_min = 1, amount_max = 1000, probability = 0.13},
      {type = "item", name = "magnesium-ore-impure", amount_min = 1, amount_max = 1000, probability = 0.06},
      {type = "item", name = "aluminium-ore-impure", amount_min = 1, amount_max = 1000, probability = 0.07},
      {type = "item", name = "lignite", amount_min = 1, amount_max = 1000, probability = 0.21},
      {type = "item", name = "coal", amount_min = 1, amount_max = 1000, probability = 0.105},
      {type = "item", name = "sandstone", amount_min = 1, amount_max = 1000, probability = 0.17},
      {type = "item", name = "granite", amount_min = 1, amount_max = 1000, probability = 0.16},
      {type = "item", name = "quartzite", amount_min = 1, amount_max = 1000, probability = 0.14},
      {type = "item", name = "limestone", amount_min = 1, amount_max = 1000, probability = 0.24},
      {type = "item", name = "resin", amount_min = 1, amount_max = 1000, probability = 0.05},
      {type = "item", name = "ilmenite", amount_min = 1, amount_max = 1000, probability = 0.085},
      {type = "item", name = "biotite", amount_min = 1, amount_max = 1000, probability = 0.06},
      {type = "item", name = "sand", amount_min = 1, amount_max = 5000, probability = 0.09},
	},
  },
	----- Titanium Ores -----
  {
    type = "item",
    name = "asteroid-miner-titanium",
	icons = {
	  {
		icon = "__base__/graphics/icons/satellite.png",
	  },
	  {
		icon = data.raw.item["titanium-ore"].icons[1].icon,
		tint = data.raw.item["titanium-ore"].icons[1].tint,
		scale = 0.25,
		shift = {-8, 9},
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."z-space",
    order = "2",
    stack_size = 1,
    rocket_launch_products = 
	{
      {type = "item", name = "titanium-ore-impure", amount_min = 1, amount_max = 1000, probability = 0.80},
	},
  },
	----- Iron Ores -----
  {
    type = "item",
    name = "asteroid-miner-iron",
	icons = {
	  {
		icon = "__base__/graphics/icons/satellite.png",
	  },
	  {
		icon = data.raw.item["iron-ore"].icons[1].icon,
		tint = data.raw.item["iron-ore"].icons[1].tint,
		scale = 0.25,
		shift = {-8, 9},
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."z-space",
    order = "1",
    stack_size = 1,
    rocket_launch_products = 
	{
      {type = "item", name = "iron-ore", amount_min = 1, amount_max = 1000},
      {type = "item", name = "iron-ore-impure", amount_min = 1, amount_max = 1000},
	},
  },
	----- Copper Ores -----
  {
    type = "item",
    name = "asteroid-miner-copper",
	icons = {
	  {
		icon = "__base__/graphics/icons/satellite.png",
	  },
	  {
		icon = data.raw.item["copper-ore"].icons[1].icon,
		tint = data.raw.item["copper-ore"].icons[1].tint,
		scale = 0.25,
		shift = {-8, 9},
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."z-space",
    order = "1",
    stack_size = 1,
    rocket_launch_products = 
	{
      {type = "item", name = "copper-ore", amount_min = 1, amount_max = 1000},
      {type = "item", name = "copper-ore-impure", amount_min = 1, amount_max = 1000},
	},
  },
	----- Tin Ores -----
  {
    type = "item",
    name = "asteroid-miner-tin",
	icons = {
	  {
		icon = "__base__/graphics/icons/satellite.png",
	  },
	  {
		icon = data.raw.tool["tin-ore"].icons[1].icon,
		tint = data.raw.tool["tin-ore"].icons[1].tint,
		scale = 0.25,
		shift = {-8, 9},
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."z-space",
    order = "1",
    stack_size = 1,
    rocket_launch_products = 
	{
      {type = "item", name = "tin-ore", amount_min = 1, amount_max = 1000},
      {type = "item", name = "tin-ore-impure", amount_min = 1, amount_max = 1000},
	},
  },
	----- Stones -----
  {
    type = "item",
    name = "asteroid-miner-stone",
	icons = {
	  {
		icon = "__base__/graphics/icons/satellite.png",
	  },
	  {
		icon = data.raw.tool["limestone"].icons[1].icon,
		tint = data.raw.tool["limestone"].icons[1].tint,
		scale = 0.25,
		shift = {-8, 9},
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."z-space",
    order = "1",
    stack_size = 1,
    rocket_launch_products = 
	{
      {type = "item", name = "limestone", amount_min = 500, amount_max = 2000, probability = 0.75},
      {type = "item", name = "quartzite", amount_min = 50, amount_max = 1000, probability = 0.75},
      {type = "item", name = "granite", amount_min = 25, amount_max = 1000, probability = 0.75},
      {type = "item", name = "sandstone", amount_min = 100, amount_max = 1000, probability = 0.75},
	},
  },
	----- Coals -----
  {
    type = "item",
    name = "asteroid-miner-coal-1",
	icons = {
	  {
		icon = "__base__/graphics/icons/satellite.png",
	  },
	  {
		icon = data.raw.tool["coal"].icon,
		scale = 0.25,
		shift = {-8, 9},
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."z-space",
    order = "1",
    stack_size = 1,
    rocket_launch_products = 
	{
      {type = "item", name = "lignite", amount_min = 250, amount_max = 1000},
      {type = "item", name = "coal", amount_min = 50, amount_max = 1000},
	},
  },
  {
    type = "item",
    name = "asteroid-miner-coal-2",
	icons = {
	  {
		icon = "__base__/graphics/icons/satellite.png",
	  },
	  {
		icon = data.raw.item["lignite"].icons[1].icon,
		tint = data.raw.item["lignite"].icons[1].tint,
		scale = 0.25,
		shift = {-8, 9},
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."z-space",
    order = "1",
    stack_size = 1,
    rocket_launch_products = 
	{
      {type = "item", name = "lignite", amount_min = 250, amount_max = 1000},
	},
  },
  {
    type = "item",
    name = "asteroid-miner-coal-3",
	icons = {
	  {
		icon = "__base__/graphics/icons/satellite.png",
	  },
	  {
		icon = data.raw.tool["coal"].icon,
		scale = 0.25,
		shift = {-8, 9},
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."z-space",
    order = "1",
    stack_size = 1,
    rocket_launch_products = 
	{
      {type = "item", name = "coal", amount_min = 50, amount_max = 1000},
	},
  },
})