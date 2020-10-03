

local DyWorld_Prototype_1 = DyDs_CopyPrototype("rocket-silo", "rocket-silo", "rocket-silo-4", true)
local DyWorld_Prototype_2 = DyDs_CopyPrototype("rocket-silo-rocket", "rocket-silo-rocket", "rocket-silo-rocket-4", true)

DyWorld_Prototype_1.rocket_parts_required = 25
DyWorld_Prototype_1.fixed_recipe = "rocket-part-4"
DyWorld_Prototype_1.rocket_entity = "rocket-silo-rocket-4"

DyWorld_Prototype_1.rocket_result_inventory_size = 40
DyWorld_Prototype_2.inventory_size = 5

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  {
    type = "item",
    name = "rocket-silo-4",
    icon = "__base__/graphics/icons/rocket-silo.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."labs",
    order = "4",
    place_result = "rocket-silo-4",
    stack_size = 1,
  },
  {
    type = "item",
    name = "rocket-part-4",
    icon = "__base__/graphics/icons/rocket-part.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "intermediate-product",
    order = "q[rocket-part]",
    stack_size = 5
  },
  {
    type = "recipe",
    name = "rocket-silo-4",
	category = "assembling-tier-5",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-2", amount = 10},
        {type = "item", name = "steel-plate", amount = 80},
        {type = "item", name = "bronze-plate", amount = 20},
      },
      result = "rocket-silo-4",
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
      result = "rocket-silo-4",
	  enabled = false,
	  energy_required = 250,
    },
  },
  {
    type = "recipe",
    name = "rocket-part-4",
	category = "rocket-building",
    hidden = true,
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-2", amount = 5},
        {type = "item", name = "steel-plate", amount = 20},
        {type = "item", name = "bronze-plate", amount = 15},
      },
      result = "rocket-part-4",
	  enabled = false,
      hidden = true,
	  energy_required = 5,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "control-board-2", amount = 5*4},
        {type = "item", name = "steel-plate", amount = 20*5},
        {type = "item", name = "bronze-plate", amount = 15*4},
      },
      result = "rocket-part-4",
	  enabled = false,
      hidden = true,
	  energy_required = 25,
    },
  },
})