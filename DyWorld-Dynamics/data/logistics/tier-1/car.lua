

local DyWorld_Prototype_1 = DyDs_CopyPrototype("car", "car", "car-1", true)

DyWorld_Prototype_1.max_health = 500
DyWorld_Prototype_1.guns = {"vehicle-9mm-gun"}
DyWorld_Prototype_1.burner.fuel_category = "carbon"


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item-with-entity-data",
    name = "car-1",
    icon = "__base__/graphics/icons/car.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."vehicles",
    order = "1",
    place_result = "car-1",
    stack_size = 1,
  },
  {
    type = "recipe",
    name = "car-1",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 25},
        {type = "item", name = "engine-unit", amount = 1},
        {type = "item", name = "control-board-1", amount = 1},
      },
      result = "car-1",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 25 * 5},
        {type = "item", name = "engine-unit", amount = 6 * 5},
        {type = "item", name = "control-board-1", amount = 3 * 5},
      },
      result = "car-1",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})