

local DyWorld_Prototype_1 = DyDs_CopyPrototype("radar", "radar", "radar-2", true)
DyWorld_Prototype_1.max_health = 1500
DyWorld_Prototype_1.max_distance_of_sector_revealed = 28
DyWorld_Prototype_1.max_distance_of_nearby_sector_revealed = 5
DyWorld_Prototype_1.energy_usage = "900kW"


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "radar-2",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."radar",
    order = "3",
    place_result = "radar-2",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "radar-2",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "radar-1", amount = 1},
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "iron-plate", amount = 12},
        {type = "item", name = "bronze-plate", amount = 3},
      },
      result = "radar-2",
	  enabled = false,
	  energy_required = 2,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "radar-1", amount = 1},
        {type = "item", name = "control-board-1", amount = 3*5},
        {type = "item", name = "iron-plate", amount = 12*5},
        {type = "item", name = "bronze-plate", amount = 3*5},
      },
      result = "radar-2",
	  enabled = false,
	  energy_required = 10,
    },
  },
})