

local DyWorld_Prototype_1 = DyDs_CopyPrototype("car", "car", "car-1", true)

DyWorld_Prototype_1.max_health = 500
DyWorld_Prototype_1.guns = {"vehicle-9mm-gun"}
DyWorld_Prototype_1.burner.fuel_category = "carbon"


data:extend({
  DyWorld_Prototype_1,
  {
    type = "gun",
    name = "vehicle-9mm-gun",
    icon = DyDs_path_icon.."9mm-pistol.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = DyDs.."guns",
    order = "hidden",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "900mm",
      cooldown = 10,
      movement_slow_down_factor = 0.7,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0},
        creation_distance = -0.6875,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_creation_distance = 0.65,
      range = 13,
      sound = data.raw.gun["9mm-pistol"].attack_parameters.sound
    },
    stack_size = 1
  },
  {
    type = "item-with-entity-data",
    name = "car-1",
    icon = "__base__/graphics/icons/car.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."inserter-tier-1",
    order = "1",
    place_result = "car-1",
    stack_size = 1,
  },
  {
    type = "recipe",
    name = "car-1",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 2},
        {type = "item", name = "bronze-gear", amount = 1},
        {type = "item", name = "control-board-1", amount = 1},
      },
      result = "car-1",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 12},
        {type = "item", name = "bronze-gear", amount = 6},
        {type = "item", name = "control-board-1", amount = 3},
      },
      result = "car-1",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})