



data:extend({
	----- Titanium Ores -----
  {
    type = "item",
    name = "asteroid-miner-titanium",
    icon = "__base__/graphics/icons/satellite.png",
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
    icon = "__base__/graphics/icons/satellite.png",
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
    icon = "__base__/graphics/icons/satellite.png",
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
    icon = "__base__/graphics/icons/satellite.png",
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
    icon = "__base__/graphics/icons/satellite.png",
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
    icon = "__base__/graphics/icons/satellite.png",
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
    icon = "__base__/graphics/icons/satellite.png",
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
    icon = "__base__/graphics/icons/satellite.png",
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