

local DyWorld_Prototype_1 = DyDs_CopyPrototype("radar", "radar", "radar-1", true)
DyWorld_Prototype_1.max_health = 500


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "radar-1",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."radar",
    order = "2",
    place_result = "radar-1",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "radar-1",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "burner-radar", amount = 1},
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "iron-plate", amount = 12},
        {type = "item", name = "bronze-plate", amount = 3},
      },
      result = "radar-1",
	  enabled = false,
	  energy_required = 2,
    },
  },
})