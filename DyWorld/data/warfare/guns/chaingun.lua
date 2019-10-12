require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

data:extend(
{
  {
    type = "gun",
    name = "chaingun",
    icon = dyworld_path_icon.."sniper.png",
    icon_size = 32,
    flags = {},
    subgroup = dy.."guns",
    order = "chaingun",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = (60 / 100),
      movement_slow_down_factor = 0.6,
      projectile_creation_distance = 0.6,
      range = 25,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0.1},
        creation_distance = -0.5,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      sound =
      {
        {
          filename = "__base__/sound/railgun.ogg",
          volume = 0.8
        }
      }
    },
    stack_size = 1
  },
  {
    type = "recipe",
    name = "chaingun",
    energy_required = 15,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 15},
      {type = "item", name = "gunpowder", amount = 5},
      {type = "item", name = "pistol", amount = 1},
    },
    result = "chaingun"
  },
})
