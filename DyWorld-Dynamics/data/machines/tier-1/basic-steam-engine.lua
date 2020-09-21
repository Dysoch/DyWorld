

local DyWorld_Prototype_1 = DyDs_CopyPrototype("generator", "steam-engine", "basic-steam-engine", true)


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "basic-steam-engine",
    icon = "__base__/graphics/icons/steam-engine.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."steam-engine",
    order = "1",
    place_result = "basic-steam-engine",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "basic-steam-engine",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "bronze-pipe", amount = 1},
        {type = "item", name = "tin-plate", amount = 2},
        {type = "item", name = "iron-plate", amount = 10},
      },
      result = "basic-steam-engine",
	  enabled = false,
	  energy_required = 2,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 3*5},
        {type = "item", name = "bronze-pipe", amount = 1*6},
        {type = "item", name = "tin-plate", amount = 2*4},
        {type = "item", name = "iron-plate", amount = 10*3},
      },
      result = "basic-steam-engine",
	  enabled = false,
	  energy_required = 10,
    },
  },
})