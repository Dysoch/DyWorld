

 ----- 1853mm Gun -----

local DyWorld_Prototype = DyDs_CopyPrototype("gun", "shotgun", "1853mm-gun", true)
	DyWorld_Prototype.attack_parameters.cooldown = (60/1)
	DyWorld_Prototype.attack_parameters.range = 30
	DyWorld_Prototype.stack_size = 1
	DyWorld_Prototype.subgroup = DyDs.."guns"
	DyWorld_Prototype.order = "3"
	DyWorld_Prototype.attack_parameters.ammo_category = "1853mm"
	DyWorld_Prototype.icon = "__base__/graphics/icons/shotgun.png"

data:extend({
  DyWorld_Prototype,
  {
    type = "recipe",
    name = "1853mm-gun",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 5},
        {type = "item", name = "tin-plate", amount = 2},
        {type = "item", name = "control-board-1", amount = 1},
      },
      result = "1853mm-gun",
	  result_count = 1,
	  energy_required = 2.5,
	  enabled = false,
    },
  },
})