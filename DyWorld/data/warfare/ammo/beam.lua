require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

data:extend(
{
  {
    type = "ammo",
    name = "beam-basic-ammo",
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/firearm-magazine.png",
	  },
	  {
		icon = "__base__/graphics/icons/battery.png",
		tint = {r=1.0, g=0.0, b=0.0},
		scale = 0.9,
	  },
	},
    icon_size = 32,
    ammo_type =
    {
      category = "beam",
      target_type = "position",
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "beam",
            beam = "electric-beam",
            starting_speed = 2.5,
            direction_deviation = 0.03,
            range_deviation = 0.08,
            max_range = 25
          }
        }
      }
    },
    subgroup = dy.."ammo-laser",
    order = "beam-1-ammo",
    stack_size = 100,
    magazine_size = 100,
  },
  --[[{
    type = "projectile",
    name = "laser-gun-basic-projectile",
    flags = {"not-on-map"},
    acceleration = 0.03,
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    direction_only = false,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "laser-bubble"
          },
          {
            type = "damage",
            damage = { amount = 25, type = "laser"}
          }
        }
      }
    },
    light = {intensity = 0.5, size = 10},
    animation =
    {
      filename = "__base__/graphics/entity/laser/laser-to-tint-medium.png",
      tint = {r=1.0, g=0.0, b=0.0},
      frame_count = 1,
      width = 12,
      height = 33,
      priority = "high",
      blend_mode = "additive"
    }
  },]]--
})

data:extend(
{
  {
    type = "recipe",
    name = "beam-basic-ammo",
    energy_required = 2.5,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 5},
      {type = "item", name = "gunpowder", amount = 5},
    },
    result = "beam-basic-ammo"
  },
})