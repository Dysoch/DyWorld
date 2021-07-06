


data:extend({
  {
    type = "gun",
    name = "vehicle-9mm-gun",
    icon = DyDs_path_icon.."9mm-gun.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = DyDs.."guns",
    order = "hidden",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "9mm",
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
    type = "gun",
    name = "vehicle-762mm-gun",
    icon = DyDs_path_icon.."762mm-gun.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = DyDs.."guns",
    order = "hidden",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "762mm",
      cooldown = (60/25),
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
      range = 25,
      sound = data.raw.gun["762mm-gun"].attack_parameters.sound
    },
    stack_size = 1
  },
})