
data:extend({
  {
    type = "ammo",
    name = "laser-basic-ammo",
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/firearm-magazine.png",
	  },
	  {
		icon = "__base__/graphics/icons/battery.png",
		tint = {r=1.0, g=0.0, b=0.0},
		scale = 0.45,
	  },
	},
    icon_size = 64,
    ammo_type =
    {
      category = "beam-gun",
      target_type = "direction",
      clamp_position = true,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "laser-gun-basic-projectile",
            starting_speed = 2.5,
            direction_deviation = 0.03,
            range_deviation = 0.08,
            max_range = 50
          }
        }
      }
    },
    subgroup = DyDs.."ammo-bullet-basic",
    order = "laser-1-ammo",
    stack_size = 100,
    magazine_size = 100,
  },
  {
    type = "projectile",
    name = "laser-gun-basic-projectile",
    flags = {"not-on-map"},
    acceleration = 0.03,
    collision_box = {{-0.25, -0.25}, {0.25, 0.25}},
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
            type = "damage",
            damage = { amount = 12.5, type = "laser"}
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
  },
})