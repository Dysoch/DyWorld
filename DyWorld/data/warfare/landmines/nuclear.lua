require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"


data:extend(
{
  {
    type = "land-mine",
    name = "atomic-land-mine",
    icon = "__base__/graphics/icons/land-mine.png",
    icon_size = 32,
    flags =
    {
      "placeable-player",
      "placeable-enemy",
      "player-creation",
      "placeable-off-grid",
      "not-on-map"
    },
    minable = {mining_time = 0.5, result = "atomic-land-mine"},
    mined_sound = { filename = "__core__/sound/deconstruct-small.ogg" },
    max_health = 250,
    corpse = "small-remnants",
    collision_box = {{-0.4,-0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    dying_explosion = "explosion-hit",
    picture_safe =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    picture_set =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine-set.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    picture_set_enemy =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine-set-enemy.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    trigger_radius = 6,
    ammo_category = "landmine",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "nested-result",
            affects_target = true,
            action =
            {
              type = "area",
              radius = 15,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = { amount = 50, type = "explosion"}
                  },
                  {
                    type = "damage",
                    damage = { amount = 100, type = "sonic"}
                  },
                  {
                    type = "damage",
                    damage = { amount = 250, type = "nuclear"}
                  },
                }
              }
            }
          },
		  {
            type = "nested-result",
            affects_target = true,
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 50,
              radius = 10,
              action_delivery =
              {
                type = "projectile",
                projectile = "landmine-wave",
                starting_speed = 0.25,
				acceleration = 0.15,
              }
            }
          },
          {
            type = "nested-result",
            affects_target = true,
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 100,
              radius = 10,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-landmine-wave",
                starting_speed = 0.25,
				acceleration = 0.15,
              }
            }
          },
          {
            type = "create-entity",
            entity_name = dy.."explosion-big"
          },
          {
            type = "create-entity",
            entity_name = "atomic-landmine-nuclear-cloud",
          },
          {
            type = "create-entity",
            entity_name = "atomic-landmine-nuclear-cloud-2",
          },
        }
      }
    }
  },
  {
    type = "sticker",
    name = "atomic-landmine-stun-sticker",
    flags = {"not-on-map"},
    duration_in_ticks = 60 * 15,
    target_movement_modifier = 0
  },
  {
    type = "sticker",
    name = "atomic-landmine-nuclear-sticker",
    flags = {},
    duration_in_ticks = 60 * 60 * 5,
    target_movement_modifier = 0.8,
    damage_per_tick = { amount = 100, type = "nuclear" },
  },
  {
    type = "smoke-with-trigger",
    name = "atomic-landmine-nuclear-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    animation = DyWorld_Cloud(5),
    slow_down_factor = 0,
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 60 * 5,
    fade_away_duration = 60,
    spread_duration = 10,
    color = Damage_Color["nuclear"],
	action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            radius = 15,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 25, type = "nuclear"}
              }
            }
          }
        }
      }
    },
    action_cooldown = 1
  },
  {
    type = "smoke-with-trigger",
    name = "atomic-landmine-nuclear-cloud-2",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    animation = DyWorld_Cloud(2),
    slow_down_factor = 0,
    affected_by_wind = true,
    cyclic = true,
    duration = 60 * 60 * 1,
    fade_away_duration = 60,
    spread_duration = 10,
    color = Damage_Color["nuclear"],
	action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            radius = 5,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 50, type = "nuclear"}
              }
            }
          }
        }
      }
    },
    action_cooldown = 1
  },
  {
    type = "projectile",
    name = "atomic-landmine-wave",
    flags = {"not-on-map"},
    acceleration = 0,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = dy.."explosion-medium"
            },
          }
        }
      },
      {
        type = "area",
        radius = 5,
        action_delivery =
        {
          type = "instant",
          target_effects =
		  {
			{
		      type = "damage",
			  damage = {amount = 100, type = "explosion"}
			},
			{
		      type = "damage",
			  damage = {amount = 100, type = "impact"}
			},
			{
		      type = "damage",
			  damage = {amount = 500, type = "nuclear"}
			},
            {
              type = "create-sticker",
              sticker = "atomic-landmine-stun-sticker"
            },
            {
              type = "create-sticker",
              sticker = "atomic-landmine-nuclear-sticker"
            },
			{
			  type = "destroy-cliffs",
			  radius = 5,
			  explosion = "explosion"
			},
		  }
        }
      }
    },
    animation =
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    },
    shadow =
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    }
  },
  {
    type = "item",
    name = "atomic-land-mine",
    icon = "__base__/graphics/icons/land-mine.png",
    icon_size = 32,
    subgroup = dy.."landmine",
    order = "atomic-land-mine",
    place_result = "atomic-land-mine",
    stack_size = 100,
  },
  {
    type = "recipe",
    name = "atomic-land-mine",
    energy_required = 2.5,
    enabled = false,
    ingredients = {
	  {"land-mine", 1}, 
	  {"invar-plate", 6},
	  {"uranium-238", 5},
	  {"uranium-235", 5},
	},
    result = "atomic-land-mine",
  },
})