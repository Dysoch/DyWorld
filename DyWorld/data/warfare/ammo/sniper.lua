require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Warfare"].value then

if settings.startup["DyWorld_Combat_Overhaul"].value then
data:extend(
{
  {
    type = "ammo",
    name = "sniper-basic-ammo",
    icon = dyworld_path_icon.."sniper-magazine.png",
    icon_size = 32,
    ammo_type =
    {
      category = "sniper",
      target_type = "direction",
      clamp_position = true,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            source_effects =
            {
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              }
            }
          }
        },
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "sniper-basic-projectile",
            starting_speed = 2.5,
            direction_deviation = 0.03,
            range_deviation = 0.03,
            max_range = 100
          }
        }
      }
    },
    subgroup = dy.."ammo-sniper",
    order = "sniper-1-ammo",
    stack_size = 100,
    magazine_size = 10,
  },
  {
    type = "projectile",
    name = "sniper-basic-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = false,
    piercing_damage = 600,
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
            damage = { amount = 200, type = "physical"}
          },
          {
            type = "damage",
            damage = { amount = 50, type = "impact"}
          },
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
  },
  {
    type = "ammo",
    name = "sniper-advanced-ammo",
    icon = dyworld_path_icon.."sniper-magazine.png",
    icon_size = 32,
    ammo_type =
    {
      category = "sniper",
      target_type = "direction",
      clamp_position = true,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            source_effects =
            {
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              }
            }
          }
        },
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "sniper-advanced-projectile",
            starting_speed = 2.5,
            direction_deviation = 0.03,
            range_deviation = 0.03,
            max_range = 100
          }
        }
      }
    },
    subgroup = dy.."ammo-sniper",
    order = "sniper-2-ammo",
    stack_size = 100,
    magazine_size = 5,
  },
  {
    type = "projectile",
    name = "sniper-advanced-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = false,
    piercing_damage = 2000,
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
            damage = { amount = 750, type = "physical"}
          },
          {
            type = "damage",
            damage = { amount = 250, type = "impact"}
          },
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
  },
})
else
data:extend(
{
  {
    type = "ammo",
    name = "sniper-basic-ammo",
    icon = dyworld_path_icon.."sniper-magazine.png",
    icon_size = 32,
    ammo_type =
    {
      category = "sniper",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion-hit"
            },
            {
              type = "damage",
              damage = { amount = 200, type = "physical"}
            },
            {
              type = "damage",
              damage = { amount = 50, type = "impact"}
            },
          }
        }
      }
    },
    subgroup = dy.."ammo-sniper",
    order = "sniper-1-ammo",
    stack_size = 100,
    magazine_size = 10,
  },
  {
    type = "ammo",
    name = "sniper-advanced-ammo",
    icon = dyworld_path_icon.."sniper-magazine.png",
    icon_size = 32,
    ammo_type =
    {
      category = "sniper",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion-hit"
            },
            {
              type = "damage",
              damage = { amount = 750, type = "physical"}
            },
            {
              type = "damage",
              damage = { amount = 250, type = "impact"}
            },
          }
        }
      }
    },
    subgroup = dy.."ammo-sniper",
    order = "sniper-2-ammo",
    stack_size = 100,
    magazine_size = 5,
  },
})
end

data:extend(
{
  {
    type = "recipe",
    name = "sniper-basic-ammo",
    energy_required = 2.5,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 5},
      {type = "item", name = "gunpowder", amount = 5},
    },
    result = "sniper-basic-ammo"
  },
  {
    type = "recipe",
    name = "sniper-advanced-ammo",
    energy_required = 5,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "sniper-basic-ammo", amount = 1},
      {type = "item", name = "steel-plate", amount = 2},
      {type = "item", name = "gunpowder", amount = 10},
    },
    result = "sniper-advanced-ammo"
  },
})

end