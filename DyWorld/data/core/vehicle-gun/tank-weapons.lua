require "data/prefix"

for i = 1,Max_Tiers do
data:extend(
{
  {
    type = "gun",
    name = dy.."tank-machine-gun-"..i,
	localised_name = {"looped-name.tank-machine-gun", {i}},
    icon = "__base__/graphics/icons/submachine-gun.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory", "hidden"},
    subgroup = "gun",
    order = "a[basic-clips]-b[tank-machine-gun]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 7 - i,
      movement_slow_down_factor = 0.7,
      damage_modifier = (1 + (0.5 * i)),
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
      projectile_center = {-0.15625, -0.07812},
      projectile_creation_distance = 1,
      range = (25 + (5 * i)),
      sound = make_heavy_gunshot_sounds(),
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = dy.."tank-shotgun-"..i,
	localised_name = {"looped-name.tank-shotgun", {i}},
    icon = "__base__/graphics/icons/shotgun.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory", "hidden"},
    subgroup = "gun",
    order = "a[basic-clips]-b[tank-machine-gun]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "shotgun-shell",
      cooldown = (60 - (i * 5)),
      movement_slow_down_factor = 0.7,
      damage_modifier = (2 + (0.5 * i)),
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
      projectile_center = {-0.15625, -0.07812},
      projectile_creation_distance = 1,
      range = (16 + (4 * i)),
      sound = make_heavy_gunshot_sounds(),
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = dy.."tank-flamethrower-"..i,
	localised_name = {"looped-name.tank-flamethrower", {i}},
    icon = "__base__/graphics/icons/flamethrower.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory", "hidden"},
    subgroup = "gun",
    order = "b[flamethrower]-b[tank-flamethrower]",
    attack_parameters =
    {
      type = "stream",
      ammo_category = "flamethrower",
      cooldown = 1,
      projectile_creation_distance = 0.6,
      gun_barrel_length = 1.4,
      gun_center_shift = { -0.17, -1.15 },
      range = (6 + (3 * i)),
      min_range = 3,
      cyclic_sound =
      {
        begin_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-start.ogg",
            volume = 1
          }
        },
        middle_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-mid.ogg",
            volume = 1
          }
        },
        end_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-end.ogg",
            volume = 1
          }
        }
      }
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = dy.."tank-cannon-"..i,
	localised_name = {"looped-name.tank-cannon", {i}},
    icon = "__base__/graphics/icons/tank-cannon.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory", "hidden"},
    subgroup = "gun",
    order = "z[tank]-a[cannon]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "cannon-shell",
      cooldown = (90 - (10 * i)),
      movement_slow_down_factor = 0,
      projectile_creation_distance = 1.6,
      projectile_center = {-0.15625, -0.07812},
      range = (20 + (5 * i)),
      sound =
      {
        {
          filename = "__base__/sound/fight/tank-cannon.ogg",
          volume = 1.0
        }
      },
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = dy.."tank-rocket-launcher-"..i,
	localised_name = {"looped-name.tank-rocket-launcher", {i}},
    icon = "__base__/graphics/icons/rocket-launcher.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory", "hidden"},
    subgroup = "gun",
    order = "z[tank]-a[cannon]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      movement_slow_down_factor = 0.8,
      cooldown = (90 - (10 * i)),
      projectile_creation_distance = 0.6,
      range = (32 + (8 * i)),
      projectile_center = {-0.17, 0},
      sound =
      {
        {
          filename = "__base__/sound/fight/rocket-launcher.ogg",
          volume = 0.7
        }
      }
    },
    stack_size = 1
  },
}
)
end

data:extend(
{
  {
    type = "gun",
    name = dy.."artillery-tank-cannon",
	localised_name = {"looped-name.tank-artillery"},
    icon = "__base__/graphics/icons/tank-cannon.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory", "hidden"},
    subgroup = "gun",
    order = "z[artillery]-a[cannon]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "artillery-shell",
      cooldown = 120,
      movement_slow_down_factor = 0,
      projectile_creation_distance = 1.6,
      projectile_center = {-0.15625, -0.07812},
      range = 10 * 32,
      min_range = 1 * 32,
      projectile_creation_parameters = require("data.core.prototypes.artillery-cannon-muzzle-flash-shifting"),
      sound =
      {
        {
          filename = "__base__/sound/fight/tank-cannon.ogg",
          volume = 1.0
        }
      },
    },
    stack_size = 1
  },
}
)
