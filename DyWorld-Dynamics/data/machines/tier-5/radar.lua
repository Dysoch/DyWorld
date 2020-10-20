

local DyWorld_Prototype_1 = DyDs_CopyPrototype("radar", "radar", "radar-4", true)
DyWorld_Prototype_1.max_health = 15000
DyWorld_Prototype_1.max_distance_of_sector_revealed = 112
DyWorld_Prototype_1.max_distance_of_nearby_sector_revealed = 9
DyWorld_Prototype_1.energy_usage = "5400kW"


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "radar-4",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."radar",
    order = "5",
    place_result = "radar-4",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "radar-4",
	category = "assembling-tier-5",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "radar-3", amount = 1},
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "iron-plate", amount = 12},
        {type = "item", name = "bronze-plate", amount = 3},
      },
      result = "radar-4",
	  enabled = false,
	  energy_required = 2,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "radar-3", amount = 1},
        {type = "item", name = "control-board-1", amount = 3*5},
        {type = "item", name = "iron-plate", amount = 12*5},
        {type = "item", name = "bronze-plate", amount = 3*5},
      },
      result = "radar-4",
	  enabled = false,
	  energy_required = 10,
    },
  },
})