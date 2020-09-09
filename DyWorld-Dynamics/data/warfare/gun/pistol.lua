

 ----- Basic Pistol -----

local DyWorld_Prototype = DyDs_CopyPrototype("gun", "pistol", "basic-pistol", true)
	DyWorld_Prototype.attack_parameters.cooldown = 12.5
	DyWorld_Prototype.attack_parameters.range = 12.5
	DyWorld_Prototype.stack_size = 1

data:extend({
  DyWorld_Prototype,
  {
    type = "recipe",
    name = "basic-pistol",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 3},
        {type = "item", name = "limestone", amount = 2},
      },
      result = "basic-pistol",
	  result_count = 1,
	  energy_required = 2.5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 7},
        {type = "item", name = "limestone", amount = 5},
      },
      result = "basic-pistol",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})