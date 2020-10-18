



local DyWorld_Prototype_1 = DyDs_CopyPrototype("ammo-turret", "gun-turret", "basic-9mm-turret", true)
	DyWorld_Prototype_1.attack_parameters.cooldown = 6
	DyWorld_Prototype_1.automated_ammo_count = 100
	DyWorld_Prototype_1.attack_parameters.range = 15
	DyWorld_Prototype_1.attack_parameters.ammo_category = "900mm"
local DyWorld_Prototype_2 = DyDs_CopyPrototype("ammo-turret", "gun-turret", "basic-762mm-turret", true)
	DyWorld_Prototype_2.attack_parameters.cooldown = (60/30)
	DyWorld_Prototype_2.automated_ammo_count = 100
	DyWorld_Prototype_2.attack_parameters.range = 25
	DyWorld_Prototype_2.attack_parameters.ammo_category = "762mm"
local DyWorld_Prototype_3 = DyDs_CopyPrototype("ammo-turret", "gun-turret", "advanced-762mm-turret", true)
	DyWorld_Prototype_3.attack_parameters.cooldown = (60/60)
	DyWorld_Prototype_3.automated_ammo_count = 100
	DyWorld_Prototype_3.attack_parameters.range = 30
	DyWorld_Prototype_3.attack_parameters.ammo_category = "762mm"

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  DyWorld_Prototype_3,
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
  {
    type = "item",
    name = "basic-762mm-turret",
    icon = "__base__/graphics/icons/gun-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."turret-gun",
    order = "basic-762mm-turret",
    place_result = "basic-762mm-turret",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "basic-762mm-turret",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 15},
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "762mm-gun", amount = 1},
      },
      result = "basic-762mm-turret",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 21},
        {type = "item", name = "control-board-1", amount = 11},
        {type = "item", name = "762mm-gun", amount = 1},
      },
      result = "basic-762mm-turret",
	  result_count = 1,
	  energy_required = 15,
	  enabled = false,
    },
  },
  {
    type = "item",
    name = "advanced-762mm-turret",
    icon = "__base__/graphics/icons/gun-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."turret-gun",
    order = "advanced-762mm-turret",
    place_result = "advanced-762mm-turret",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "advanced-762mm-turret",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 45},
        {type = "item", name = "control-board-2", amount = 3},
        {type = "item", name = "basic-762mm-turret", amount = 1},
      },
      result = "advanced-762mm-turret",
	  result_count = 1,
	  energy_required = 15,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 45*3},
        {type = "item", name = "control-board-2", amount = 3*5},
        {type = "item", name = "basic-762mm-turret", amount = 1},
      },
      result = "advanced-762mm-turret",
	  result_count = 1,
	  energy_required = 55,
	  enabled = false,
    },
  },
})