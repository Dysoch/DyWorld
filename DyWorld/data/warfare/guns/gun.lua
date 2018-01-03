require ("data.core.prototypes.gunshot-sounds")

data:extend(
{
  {
    type = "gun",
    name = dy.."minigun",
    icon = "__base__/graphics/icons/submachine-gun.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "gun",
    order = "a[basic-clips]-c[minigun]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 0.5,
      movement_slow_down_factor = 0.7,
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
      projectile_creation_distance = 1.125,
      range = 25,
      sound = make_light_gunshot_sounds(),
    },
    stack_size = 5
  }
}
)
