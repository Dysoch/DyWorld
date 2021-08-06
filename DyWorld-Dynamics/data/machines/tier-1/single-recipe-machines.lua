
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