

local DyWorld_Prototype_1 = DyDs_CopyPrototype("radar", "radar", "radar-3", true)
DyWorld_Prototype_1.max_health = 4500
DyWorld_Prototype_1.max_distance_of_sector_revealed = 56
DyWorld_Prototype_1.max_distance_of_nearby_sector_revealed = 7
DyWorld_Prototype_1.energy_usage = "2700kW"
DyWorld_Prototype_1.next_upgrade = "radar-4"
DyWorld_Prototype_1.fast_replaceable_group = "radar"


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "radar-3",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."radar",
    order = "4",
    place_result = "radar-3",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "radar-3",
	category = "assembling-tier-4",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "radar-2", amount = 1},
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "iron-plate", amount = 12},
        {type = "item", name = "bronze-plate", amount = 3},
      },
      result = "radar-3",
	  enabled = false,
	  energy_required = 2,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "radar-2", amount = 1},
        {type = "item", name = "control-board-1", amount = 3*5},
        {type = "item", name = "iron-plate", amount = 12*5},
        {type = "item", name = "bronze-plate", amount = 3*5},
      },
      result = "radar-3",
	  enabled = false,
	  energy_required = 10,
    },
  },
})