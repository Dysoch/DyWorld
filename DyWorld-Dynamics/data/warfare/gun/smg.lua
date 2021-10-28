

 ----- 762mm Gun -----

local DyWorld_Prototype = DyDs_CopyPrototype("gun", "pistol", "762mm-gun", true)
	DyWorld_Prototype.attack_parameters.cooldown = (60/20)
	DyWorld_Prototype.attack_parameters.range = 21.5
	DyWorld_Prototype.stack_size = 1
	DyWorld_Prototype.subgroup = DyDs.."guns"
	DyWorld_Prototype.order = "2"
	DyWorld_Prototype.attack_parameters.ammo_category = "762mm"
	DyWorld_Prototype.icon = DyDs_path_icon.."762mm-gun.png"

data:extend({
  DyWorld_Prototype,
  {
    type = "recipe",
    name = "762mm-gun",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 5},
        {type = "item", name = "tin-plate", amount = 2},
        {type = "item", name = "control-board-1", amount = 1},
      },
      result = "762mm-gun",
	  result_count = 1,
	  energy_required = 2.5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 5*5},
        {type = "item", name = "tin-plate", amount = 2*5},
        {type = "item", name = "control-board-1", amount = 1*5},
      },
      result = "762mm-gun",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})