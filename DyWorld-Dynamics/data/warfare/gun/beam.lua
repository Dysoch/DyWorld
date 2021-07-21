

 ----- beam Gun -----

local DyWorld_Prototype_1 = DyDs_CopyPrototype("gun", "pistol", "beam-gun-1", true)
	DyWorld_Prototype_1.attack_parameters = {
      type = "projectile",
      ammo_category = "beam-gun",
      cooldown = 60 / 60,
      movement_slow_down_factor = 0.6,
      projectile_creation_distance = 1.125,
      range = 50,
    }
	DyWorld_Prototype_1.stack_size = 1
	DyWorld_Prototype_1.subgroup = DyDs.."guns"
	DyWorld_Prototype_1.order = "3a"
	DyWorld_Prototype_1.attack_parameters.ammo_category = "beam-gun"
	DyWorld_Prototype_1.icon = DyDs_path_icon.."860mm-gun.png"
	DyWorld_Prototype_1.sound = {filename = "__DyWorld-Dynamics__/sounds/sniper-shot.ogg", volume = 1}

local DyWorld_Prototype_2 = DyDs_CopyPrototype("gun", "pistol", "beam-gun-2", true)
	DyWorld_Prototype_2.attack_parameters = {
      type = "projectile",
      ammo_category = "beam-gun",
      cooldown = 60 / 90,
      movement_slow_down_factor = 0.4,
      projectile_creation_distance = 1.125,
      range = 75,
    }
	DyWorld_Prototype_2.stack_size = 1
	DyWorld_Prototype_2.subgroup = DyDs.."guns"
	DyWorld_Prototype_2.order = "3b"
	DyWorld_Prototype_2.attack_parameters.ammo_category = "beam-gun"
	DyWorld_Prototype_2.icon = DyDs_path_icon.."860mm-gun.png"
	DyWorld_Prototype_2.sound = {filename = "__DyWorld-Dynamics__/sounds/sniper-shot.ogg", volume = 1}

local DyWorld_Prototype_3 = DyDs_CopyPrototype("gun", "pistol", "beam-gun-3", true)
	DyWorld_Prototype_3.attack_parameters = {
      type = "projectile",
      ammo_category = "beam-gun",
      cooldown = 60 / 120,
      movement_slow_down_factor = 0.2,
      projectile_creation_distance = 1.125,
      range = 100,
    }
	DyWorld_Prototype_3.stack_size = 1
	DyWorld_Prototype_3.subgroup = DyDs.."guns"
	DyWorld_Prototype_3.order = "3c"
	DyWorld_Prototype_3.attack_parameters.ammo_category = "beam-gun"
	DyWorld_Prototype_3.icon = DyDs_path_icon.."860mm-gun.png"
	DyWorld_Prototype_3.sound = {filename = "__DyWorld-Dynamics__/sounds/sniper-shot.ogg", volume = 1}

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  DyWorld_Prototype_3,
  {
    type = "recipe",
    name = "beam-gun-1",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 5},
        {type = "item", name = "titanium-plate", amount = 2},
        {type = "item", name = "control-board-2", amount = 1},
      },
      result = "beam-gun-1",
	  result_count = 1,
	  energy_required = 2.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "beam-gun-2",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 5},
        {type = "item", name = "titanium-plate", amount = 2},
        {type = "item", name = "control-board-2", amount = 1},
        {type = "item", name = "beam-gun-1", amount = 1},
      },
      result = "beam-gun-2",
	  result_count = 1,
	  energy_required = 2.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "beam-gun-3",
	category = "assembling-tier-4",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 5},
        {type = "item", name = "titanium-plate", amount = 2},
        {type = "item", name = "control-board-2", amount = 1},
        {type = "item", name = "beam-gun-2", amount = 1},
      },
      result = "beam-gun-3",
	  result_count = 1,
	  energy_required = 2.5,
	  enabled = false,
    },
  },
})