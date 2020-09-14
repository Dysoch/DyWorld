

 ----- 9mm Pistol -----

local DyWorld_Prototype = DyDs_CopyPrototype("gun", "pistol", "9mm-pistol", true)
	DyWorld_Prototype.attack_parameters.cooldown = 12.5
	DyWorld_Prototype.attack_parameters.range = 12.5
	DyWorld_Prototype.stack_size = 1
	DyWorld_Prototype.subgroup = DyDs.."guns"
	DyWorld_Prototype.order = "1"
	DyWorld_Prototype.attack_parameters.ammo_category = "900mm"
	DyWorld_Prototype.icon = DyDs_path_icon.."9mm-pistol.png"

data:extend({
  DyWorld_Prototype,
  {
    type = "recipe",
    name = "9mm-pistol",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 3},
        {type = "item", name = "limestone", amount = 2},
      },
      result = "9mm-pistol",
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
      result = "9mm-pistol",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})