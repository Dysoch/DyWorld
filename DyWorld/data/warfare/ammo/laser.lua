require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Warfare"].value then

data:extend(
{
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
		scale = 0.9,
	  },
	},
    icon_size = 32,
    ammo_type =
    {
      category = "laser",
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
            max_range = 25
          }
        }
      }
    },
    subgroup = dy.."ammo-laser",
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
  },
  {
    type = "ammo",
    name = "laser-advanced-ammo",
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
      category = "laser",
      target_type = "direction",
      clamp_position = true,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "laser-gun-advanced-projectile",
            starting_speed = 2.5,
            direction_deviation = 0.03,
            range_deviation = 0.13,
            max_range = 50
          }
        }
      }
    },
    subgroup = dy.."ammo-laser",
    order = "laser-2-ammo",
    stack_size = 100,
    magazine_size = 200,
  },
  {
    type = "projectile",
    name = "laser-gun-advanced-projectile",
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
            type = "create-entity",
            entity_name = "laser-bubble"
          },
          {
            type = "damage",
            damage = { amount = 100, type = "laser"}
          },
          {
            type = "damage",
            damage = { amount = 25, type = "electric"}
          },
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
  {
    type = "ammo",
    name = "laser-basic-shotgun-ammo",
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/firearm-magazine.png",
	  },
	  {
		icon = "__base__/graphics/icons/battery.png",
		tint = {r=1.0, g=1.0, b=0.0},
		scale = 0.9,
	  },
	},
    icon_size = 32,
    ammo_type =
    {
      category = "laser",
      target_type = "direction",
      clamp_position = true,
      action =
      {
        {
          type = "direct",
          repeat_count = 10,
          action_delivery =
          {
            type = "projectile",
            projectile = "laser-gun-basic-shotgun-projectile",
            starting_speed = 2.5,
            direction_deviation = 0.3,
            range_deviation = 0.08,
            max_range = 35
          }
        }
      }
    },
    subgroup = dy.."ammo-laser",
    order = "laser-3-ammo",
    stack_size = 100,
    magazine_size = 100,
  },
  {
    type = "projectile",
    name = "laser-gun-basic-shotgun-projectile",
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
      tint = {r=1.0, g=1.0, b=0.0},
      frame_count = 1,
      width = 12,
      height = 33,
      priority = "high",
      blend_mode = "additive"
    }
  },
  {
    type = "ammo",
    name = "laser-advanced-shotgun-ammo",
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/firearm-magazine.png",
	  },
	  {
		icon = "__base__/graphics/icons/battery.png",
		tint = {r=1.0, g=1.0, b=0.0},
		scale = 0.9,
	  },
	},
    icon_size = 32,
    ammo_type =
    {
      category = "laser",
      target_type = "direction",
      clamp_position = true,
      action =
      {
        {
          type = "direct",
          repeat_count = 15,
          action_delivery =
          {
            type = "projectile",
            projectile = "laser-gun-advanced-shotgun-projectile",
            starting_speed = 2.5,
            direction_deviation = 0.15,
            range_deviation = 0.13,
            max_range = 60
          }
        }
      }
    },
    subgroup = dy.."ammo-laser",
    order = "laser-4-ammo",
    stack_size = 100,
    magazine_size = 200,
  },
  {
    type = "projectile",
    name = "laser-gun-advanced-shotgun-projectile",
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
            type = "create-entity",
            entity_name = "laser-bubble"
          },
          {
            type = "damage",
            damage = { amount = 100, type = "laser"}
          },
          {
            type = "damage",
            damage = { amount = 25, type = "electric"}
          },
        }
      }
    },
    light = {intensity = 0.5, size = 10},
    animation =
    {
      filename = "__base__/graphics/entity/laser/laser-to-tint-medium.png",
      tint = {r=1.0, g=1.0, b=0.0},
      frame_count = 1,
      width = 12,
      height = 33,
      priority = "high",
      blend_mode = "additive"
    }
  },
})

data:extend(
{
  {
    type = "recipe",
    name = "laser-basic-ammo",
    energy_required = 2.5,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 5},
      {type = "item", name = "gunpowder", amount = 5},
    },
    result = "laser-basic-ammo"
  },
  {
    type = "recipe",
    name = "laser-advanced-ammo",
    energy_required = 2.5,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 5},
      {type = "item", name = "gunpowder", amount = 5},
    },
    result = "laser-advanced-ammo"
  },
  {
    type = "recipe",
    name = "laser-basic-shotgun-ammo",
    energy_required = 2.5,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 5},
      {type = "item", name = "gunpowder", amount = 5},
    },
    result = "laser-basic-shotgun-ammo"
  },
  {
    type = "recipe",
    name = "laser-advanced-shotgun-ammo",
    energy_required = 2.5,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 5},
      {type = "item", name = "gunpowder", amount = 5},
    },
    result = "laser-advanced-shotgun-ammo"
  },
})

end