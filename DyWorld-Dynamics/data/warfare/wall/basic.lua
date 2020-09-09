

 ----- Basic Pistol -----

local DyWorld_Prototype = DyDs_CopyPrototype("wall", "stone-wall", "basic-wall", true)
	DyWorld_Prototype.max_health = 250

data:extend({
  DyWorld_Prototype,
  {
    type = "item",
    name = "basic-wall",
    icon = "__base__/graphics/icons/wall.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."wall",
    order = "basic-ballistic-turret",
    place_result = "basic-wall",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "basic-wall",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "stone-brick", amount = 5},
        {type = "item", name = "limestone", amount = 1},
      },
      result = "basic-wall",
	  result_count = 2,
	  energy_required = 1,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "stone-brick", amount = 10},
        {type = "item", name = "limestone", amount = 2},
      },
      result = "basic-wall",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})