require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Warfare"].value then


data:extend(
{
  {
    type = "land-mine",
    name = "cryo-land-mine",
    icon = "__base__/graphics/icons/land-mine.png",
    icon_size = 64,
    flags =
    {
      "placeable-player",
      "placeable-enemy",
      "player-creation",
      "placeable-off-grid",
      "not-on-map"
    },
    minable = {mining_time = 0.5, result = "cryo-land-mine"},
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
              radius = 5,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = { amount = 5, type = "explosion"}
                  },
                  {
                    type = "damage",
                    damage = { amount = 10, type = "sonic"}
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
            type = "create-entity",
            entity_name = dy.."explosion-medium"
          },
          {
            type = "create-entity",
            entity_name = "cryo-landmine-cloud",
          },
        }
      }
    }
  },
  {
    type = "sticker",
    name = "cryo-landmine-stun-sticker",
    flags = {"not-on-map"},
    duration_in_ticks = 60 * 15,
    target_movement_modifier = 0.001
  },
  {
    type = "smoke-with-trigger",
    name = "cryo-landmine-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    animation = DyWorld_Cloud(3),
    slow_down_factor = 0.01,
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 60 * 5,
    fade_away_duration = 60,
    spread_duration = 10,
    color = Damage_Color["ice"],
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
            radius = 10,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "create-sticker",
                sticker = "cryo-landmine-stun-sticker"
              },
            }
          }
        }
      }
    },
    action_cooldown = 1
  },
  {
    type = "item",
    name = "cryo-land-mine",
    icon = "__base__/graphics/icons/land-mine.png",
    icon_size = 64,
    subgroup = dy.."landmine",
    order = "cryo-land-mine",
    place_result = "cryo-land-mine",
    stack_size = 100,
  },
  {
    type = "recipe",
    name = "cryo-land-mine",
    energy_required = 2.5,
    enabled = false,
    ingredients = {
	  {"land-mine", 1}, 
	  {"invar-plate", 6},
	  {"uranium-238", 5},
	  {"uranium-235", 5},
	},
    result = "cryo-land-mine",
  },
})

end