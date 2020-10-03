



data:extend({
	----- Iron Ores -----
  {
    type = "item",
    name = "asteroid-miner-iron",
    icon = "__base__/graphics/icons/satellite.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "m[satellite]",
    stack_size = 1,
    rocket_launch_products = 
	{
      {type = "item", name = "iron-ore", amount_min = 250, amount_max = 100},
      {type = "item", name = "iron-ore-impure", amount_min = 500, amount_max = 3000},
	},
  },
  {
    type = "recipe",
    name = "asteroid-miner-iron",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-2", amount = 10},
        {type = "item", name = "steel-plate", amount = 80},
        {type = "item", name = "bronze-plate", amount = 20},
      },
      result = "asteroid-miner-iron",
	  enabled = false,
	  energy_required = 25,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "control-board-2", amount = 10*5},
        {type = "item", name = "steel-plate", amount = 80*4},
        {type = "item", name = "bronze-plate", amount = 20*3},
      },
      result = "asteroid-miner-iron",
	  enabled = false,
	  energy_required = 250,
    },
  },
	----- Copper Ores -----
  {
    type = "item",
    name = "asteroid-miner-copper",
    icon = "__base__/graphics/icons/satellite.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "m[satellite]",
    stack_size = 1,
    rocket_launch_products = 
	{
      {type = "item", name = "copper-ore", amount_min = 250, amount_max = 1000},
      {type = "item", name = "copper-ore-impure", amount_min = 500, amount_max = 3000},
	},
  },
  {
    type = "recipe",
    name = "asteroid-miner-copper",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-2", amount = 10},
        {type = "item", name = "steel-plate", amount = 80},
        {type = "item", name = "bronze-plate", amount = 20},
      },
      result = "asteroid-miner-copper",
	  enabled = false,
	  energy_required = 25,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "control-board-2", amount = 10*5},
        {type = "item", name = "steel-plate", amount = 80*4},
        {type = "item", name = "bronze-plate", amount = 20*3},
      },
      result = "asteroid-miner-copper",
	  enabled = false,
	  energy_required = 250,
    },
  },
	----- Tin Ores -----
  {
    type = "item",
    name = "asteroid-miner-tin",
    icon = "__base__/graphics/icons/satellite.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "m[satellite]",
    stack_size = 1,
    rocket_launch_products = 
	{
      {type = "item", name = "tin-ore", amount_min = 250, amount_max = 1000},
      {type = "item", name = "tin-ore-impure", amount_min = 500, amount_max = 3000},
	},
  },
  {
    type = "recipe",
    name = "asteroid-miner-tin",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-2", amount = 10},
        {type = "item", name = "steel-plate", amount = 80},
        {type = "item", name = "bronze-plate", amount = 20},
      },
      result = "asteroid-miner-tin",
	  enabled = false,
	  energy_required = 25,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "control-board-2", amount = 10*5},
        {type = "item", name = "steel-plate", amount = 80*4},
        {type = "item", name = "bronze-plate", amount = 20*3},
      },
      result = "asteroid-miner-tin",
	  enabled = false,
	  energy_required = 250,
    },
  },
})