require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

data:extend(
{
  {
    type = "projectile",
    name = "firearm-magazine-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = true,
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
            entity_name = "explosion-hit"
          },
          {
            type = "damage",
            damage = { amount = 5, type = "physical"}
          }
        },
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    },
    height_from_ground = 280 / 64,
  },
  {
    type = "projectile",
    name = "piercing-rounds-magazine-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
	piercing_damage = 8,
    direction_only = true,
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
            entity_name = "explosion-hit"
          },
          {
            type = "damage",
            damage = { amount = 8, type = "physical"}
          }
        },
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
  {
    type = "projectile",
    name = "uranium-rounds-magazine-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
	piercing_damage = 24,
    direction_only = true,
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
            entity_name = "explosion-hit"
          },
          {
            type = "damage",
            damage = { amount = 24, type = "physical"}
          }
        },
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
})

data.raw.projectile["shotgun-pellet"].action.action_delivery.target_effects =
        {
          {
            type = "create-entity",
            entity_name = "explosion-hit"
          },
          {
            type = "damage",
            damage = { amount = 5, type = "physical"}
          }
        }

data.raw.projectile["piercing-shotgun-pellet"].piercing_damage = 8
data.raw.projectile["piercing-shotgun-pellet"].action.action_delivery.target_effects =
        {
          {
            type = "create-entity",
            entity_name = "explosion-hit"
          },
          {
            type = "damage",
            damage = { amount = 8, type = "physical"}
          }
        }