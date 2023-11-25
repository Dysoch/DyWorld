
local DyWorld_Prototype_1 = DyDs_CopyPrototype("assembling-machine", "assembling-machine-1", "rain-collector", true)
DyWorld_Prototype_1.icon = "__base__/graphics/icons/assembling-machine-3.png"
DyWorld_Prototype_1.crafting_categories = {"rain-collector"}
DyWorld_Prototype_1.energy_usage = "1W"
DyWorld_Prototype_1.crafting_speed = 1
DyWorld_Prototype_1.fixed_recipe = "rain-collecting"
DyWorld_Prototype_1.fast_replaceable_group = "crafting"
DyWorld_Prototype_1.next_upgrade = nil
DyWorld_Prototype_1.resistances = Resist_Tier_1(5)
DyWorld_Prototype_1.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value
DyWorld_Prototype_1.energy_source = {type = "void"}

data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "rain-collector",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."assemblers",
    order = "9999",
    place_result = "rain-collector",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "rain-collector",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 12},
      },
      result = "rain-collector",
	  enabled = false,
	  energy_required = 12.5,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 45},
        {type = "item", name = "bronze-pipe", amount = 8},
      },
      result = "rain-collector",
	  enabled = false,
	  energy_required = 12.5,
    },
  },
  {
    type = "recipe",
    name = "rain-collecting",
	category = "rain-collector",
	main_product = "bottle-dirty-water",
	allow_decomposition = false,
	hide_from_player_crafting = true,
	hide_from_stats = true,
    normal =
    {
      ingredients =
      {
      },
      results = 
      {
        {type = "item", name = "bottle-dirty-water", amount_min = 1, amount_max = 1, probability = 0.001},
        {type = "item", name = "bottle-clean-water", amount_min = 1, amount_max = 1, probability = 0.0001},
        {type = "item", name = "bottle-mineral-water", amount_min = 1, amount_max = 1, probability = 0.00001},
      },
	  energy_required = 0.25,
	  main_product = "bottle-dirty-water",
	  enabled = false,
	  allow_decomposition = false,
	  hide_from_player_crafting = true,
	  hide_from_stats = true,
    },
  },
})

local DyWorld_Prototype_2 = DyDs_CopyPrototype("assembling-machine", "assembling-machine-1", "soil-miner", true)
DyWorld_Prototype_2.icon = "__base__/graphics/icons/assembling-machine-3.png"
DyWorld_Prototype_2.crafting_categories = {"soil-miner"}
DyWorld_Prototype_2.energy_usage = "500kW"
DyWorld_Prototype_2.crafting_speed = 1
DyWorld_Prototype_2.fixed_recipe = "soil-mining"
DyWorld_Prototype_2.fast_replaceable_group = "crafting"
DyWorld_Prototype_2.next_upgrade = nil
DyWorld_Prototype_2.resistances = Resist_Tier_1(5)
DyWorld_Prototype_2.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value
DyWorld_Prototype_2.energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = Dy_Sett.Difficulty == "Easy" and 5 or Dy_Sett.Difficulty == "Normal" and 15 or Dy_Sett.Difficulty == "Hard" and 45 or 5,
    }

data:extend({
  DyWorld_Prototype_2,
  {
    type = "item",
    name = "soil-miner",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."assemblers",
    order = "9999",
    place_result = "soil-miner",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "soil-miner",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-2", amount = 3},
        {type = "item", name = "steel-plate", amount = 8},
        {type = "item", name = "titanium-plate", amount = 12},
      },
      result = "soil-miner",
	  enabled = false,
	  energy_required = 12.5,
    },
  },
})

local DyWorld_Prototype_3 = DyDs_CopyPrototype("assembling-machine", "assembling-machine-1", "fish-farm", true)
DyWorld_Prototype_3.icon = "__base__/graphics/icons/assembling-machine-3.png"
DyWorld_Prototype_3.crafting_categories = {"fish-miner"}
DyWorld_Prototype_3.crafting_speed = 1
DyWorld_Prototype_3.fixed_recipe = "fish-mining"
DyWorld_Prototype_3.fast_replaceable_group = "crafting"
DyWorld_Prototype_3.next_upgrade = nil
DyWorld_Prototype_3.resistances = Resist_Tier_1(5)
DyWorld_Prototype_3.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value
DyWorld_Prototype_3.animation = {
      layers =
      {
	    {
		  filename = DyDs_path_entity.."fish-farm.png",
		  priority = "extra-high",
		  width = 500,
		  height = 500,
		}
	  }
	}
DyWorld_Prototype_3.working_sound = nil
DyWorld_Prototype_3.energy_source = {
      type = "void",
    }
DyWorld_Prototype_3.collision_box = {{-7, -7}, {7, 7}}
DyWorld_Prototype_3.selection_box = {{-7, -7}, {7, 7}}
DyWorld_Prototype_3.emissions_per_second = -0.1
    
data:extend({
  DyWorld_Prototype_3,
  {
    type = "item",
    name = "fish-farm",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."assemblers",
    order = "9999",
    place_result = "fish-farm",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "fish-farm",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "steel-plate", amount = 8},
        {type = "item", name = "bronze-plate", amount = 12},
      },
      result = "fish-farm",
	  enabled = false,
	  energy_required = 12.5,
    },
  },
  {
    type = "recipe",
    name = "soil-mining",
	category = "soil-miner",
	main_product = "soil",
	allow_decomposition = false,
	hide_from_player_crafting = true,
    normal =
    {
      ingredients =
      {
      },
      results = 
      {
        {type = "item", name = "bio-waste", amount_min = 1, amount_max = 100, probability = 0.02},
        {type = "item", name = "soil", amount_min = 1, amount_max = 100},
        {type = "item", name = "acidic-residue", amount_min = 1, amount_max = 10, probability = 0.05},
      },
	  energy_required = 30,
	  main_product = "soil",
	  allow_decomposition = false,
	  hide_from_player_crafting = true,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "fish-mining",
	category = "fish-miner",
	main_product = "raw-fish-pike",
	allow_decomposition = false,
	hide_from_player_crafting = true,
    normal =
    {
      ingredients =
      {
      },
      results = 
      {
        {type = "item", name = "bio-waste", amount_min = 1, amount_max = 100, probability = 0.02},
        {type = "item", name = "raw-fish-pike", amount_min = 1, amount_max = 10, probability = 0.75},
        {type = "item", name = "raw-fish-salmon", amount_min = 1, amount_max = 10, probability = 0.5},
      },
	  energy_required = 30,
	  main_product = "raw-fish-pike",
	  allow_decomposition = false,
	  hide_from_player_crafting = true,
	  enabled = false,
    },
  },
})

DyWorld_ATTA("fish-mining", {"piscis-farm"})
DyWorld_ATTA("fish-farm", {"piscis-farm"})