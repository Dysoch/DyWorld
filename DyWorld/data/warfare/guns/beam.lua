require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Warfare"].value then

data:extend(
{
  {
    type = "gun",
    name = "beam-gun",
    icon = "__base__/graphics/icons/railgun.png",
    icon_size = 64,
    flags = {},
    subgroup = dy.."guns",
    order = "beam-gun",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "beam",
      cooldown = 40,
      range = 24,
      source_direction_count = 64,
      source_offset = {0, -3.423489 / 4},
    },
    stack_size = 1
  },
  {
    type = "recipe",
    name = "beam-gun",
    energy_required = 15,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 15},
      {type = "item", name = "gunpowder", amount = 5},
      {type = "item", name = "pistol", amount = 1},
    },
    result = "beam-gun"
  },
})

end