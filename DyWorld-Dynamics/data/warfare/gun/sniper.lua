

 ----- 860mm Gun -----

local DyWorld_Prototype = DyDs_CopyPrototype("gun", "pistol", "860mm-gun", true)
	DyWorld_Prototype.attack_parameters.cooldown = (60/1)
	DyWorld_Prototype.attack_parameters.range = 120
	DyWorld_Prototype.stack_size = 1
	DyWorld_Prototype.subgroup = DyDs.."guns"
	DyWorld_Prototype.order = "2"
	DyWorld_Prototype.attack_parameters.ammo_category = "860mm"
	DyWorld_Prototype.icon = DyDs_path_icon.."860mm-gun.png"

data:extend({
  DyWorld_Prototype,
  {
    type = "recipe",
    name = "860mm-gun",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 5},
        {type = "item", name = "titanium-plate", amount = 2},
        {type = "item", name = "control-board-2", amount = 1},
      },
      result = "860mm-gun",
	  result_count = 1,
	  energy_required = 2.5,
	  enabled = false,
    },
  },
})