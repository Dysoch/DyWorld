



local DyWorld_Prototype = DyDs_CopyPrototype("ammo-turret", "gun-turret", "basic-9mm-turret", true)
	DyWorld_Prototype.attack_parameters.cooldown = 6
	DyWorld_Prototype.attack_parameters.range = 15
	DyWorld_Prototype.attack_parameters.ammo_category = "900mm"

data:extend({
  DyWorld_Prototype,
  {
    type = "item",
    name = "basic-9mm-turret",
    icon = "__base__/graphics/icons/gun-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."turret-gun",
    order = "basic-9mm-turret",
    place_result = "basic-9mm-turret",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "basic-9mm-turret",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 5},
        {type = "item", name = "limestone", amount = 3},
        {type = "item", name = "9mm-pistol", amount = 1},
      },
      result = "basic-9mm-turret",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 17},
        {type = "item", name = "limestone", amount = 11},
        {type = "item", name = "9mm-pistol", amount = 1},
      },
      result = "basic-9mm-turret",
	  result_count = 1,
	  energy_required = 15,
	  enabled = false,
    },
  },
})