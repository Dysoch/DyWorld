require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"
require "util"
local math3d = require "math3d"

if settings.startup["DyWorld_Warfare"].value and settings.startup["DyWorld_Warfare_Enemies"].value then

for Dmg, Data in pairs(Damages) do
	for Size, Scale in pairs(Enemy_Names_Scales) do
		if Data.Dying_Explosion then
data:extend(
{
  {
    type = "explosion",
    name = Dmg.."-enemy-explosion-"..Size,
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/big-explosion/big-explosion.png",
        flags = { "compressed" },
        width = 197,
        height = 245,
        frame_count = 47,
        line_length = 6,
        shift = {0.1875, -0.75},
        animation_speed = 0.5,
		scale = Scale,
		tint = Data.Color,
      }
    },
    light = {intensity = 1, size = 20 * Scale, color = {r=1.0, g=1.0, b=1.0}},
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1,
    sound =
    {
      aggregation =
      {
        max_count = 1,
        remove = true
      },
      variations =
      {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 1.0
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 1.0
        }
      }
    },
  },
  {
    type = "explosion",
    name = Dmg.."-enemy-base-explosion-"..Size,
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/bigass-explosion/hr-bigass-explosion-36f.png",
        flags = { "compressed" },
        animation_speed = 0.5,
        width = 324,
        height = 416,
        frame_count = 36,
        shift = util.by_pixel(0, -48),
		scale = Scale,
		tint = Data.Color,
        stripes =
        {
          {
            filename = "__base__/graphics/entity/bigass-explosion/hr-bigass-explosion-36f-1.png",
            width_in_frames = 6,
            height_in_frames = 3
          },
          {
            filename = "__base__/graphics/entity/bigass-explosion/hr-bigass-explosion-36f-2.png",
            width_in_frames = 6,
            height_in_frames = 3
          }
        }
      }
    },
    light = {intensity = 1, size = 50 * Scale, color = {r=1.0, g=1.0, b=1.0}},
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1,
    sound =
    {
      aggregation =
      {
        max_count = 2,
        remove = true
      },
      variations =
      {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 1.0
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 1.0
        }
      }
    },
  },
})
		end
		if Data.Dying_Splash then
data:extend(
{
  {
    type = "fire",
    name = Dmg.."-enemy-splash-"..Size,
    flags = {"placeable-off-grid", "not-on-map"},
    damage_per_tick = {amount = 0, type = Dmg},
    maximum_damage_multiplier = 3,
    damage_multiplier_increase_per_added_fuel = 1,
    damage_multiplier_decrease_per_tick = 0.005,
    uses_alternative_behavior = true,
    limit_overlapping_particles = true,
    initial_render_layer = "object",
    render_layer = "lower-object-above-shadow",
    secondary_render_layer = "higher-object-above",
    secondary_picture_fade_out_start = 30,
    secondary_picture_fade_out_duration = 60,
    spread_delay = 300,
    spread_delay_deviation = 180,
    maximum_spread_count = 100,
    particle_alpha = 0.6,
    particle_alpha_blend_duration = 60*5,
    emissions_per_second = 0,
    add_fuel_cooldown = 10,
    fade_in_duration = 1,
    fade_out_duration = 30,
    initial_lifetime = 60*10,
    lifetime_increase_by = 0,
    lifetime_increase_cooldown = 4,
    maximum_lifetime = 60*25,
    delay_between_initial_flames = 10,
    initial_flame_count = 1,
    burnt_patch_lifetime = 0,
    on_damage_tick_effect =
    {
      type = "direct",
      ignore_collision_condition = true,
      trigger_target_mask = { "ground-unit" },
      filter_enabled = true,
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = Data.Tier, type = Dmg},
            apply_damage_to_trees = false
          },
          {
            type = "create-sticker",
            sticker = Dmg.."-enemy-sticker-"..Size
          },
        }
      }
    },
    pictures =
    {
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-1.png",
            line_length = 8,
            direction_count = 1,
            width = 106,
            height = 116,
            frame_count = 26,
            shift = util.mul_shift(util.by_pixel(-12, -10), Scale),
            tint = Data.Color,
            scale = Scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-1.png",
              line_length = 8,
              direction_count = 1,
              width = 210,
              height = 224,
              frame_count = 26,
              shift = util.mul_shift(util.by_pixel(-12, -8), Scale),
              tint = Data.Color,
              scale = 0.5 * Scale,
            }
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-1-shadow.png",
            line_length = 8,
            direction_count = 1,
            width = 134,
            height = 98,
            frame_count = 26,
            shift = util.mul_shift(util.by_pixel(2, 0), Scale),
            draw_as_shadow = true,
            scale = Scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-1-shadow.png",
              line_length = 8,
              direction_count = 1,
              width = 266,
              height = 188,
              frame_count = 26,
              shift = util.mul_shift(util.by_pixel(2, 2), Scale),
              draw_as_shadow = true,
              scale = 0.5 * Scale,
            }
          }
        },
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-2.png",
            line_length = 8,
            direction_count = 1,
            width = 88,
            height = 76,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(-10, -18), Scale),
            tint = Data.Color,
            scale = Scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-2.png",
              line_length = 8,
              direction_count = 1,
              width = 174,
              height = 150,
              frame_count = 29,
              shift = util.mul_shift(util.by_pixel(-9, -17), Scale),
              tint = Data.Color,
              scale = 0.5 * Scale,
            }
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-2-shadow.png",
            line_length = 8,
            direction_count = 1,
            width = 120,
            height = 136,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(6, 28), Scale),
            draw_as_shadow = true,
            scale = Scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-2-shadow.png",
              line_length = 8,
              direction_count = 1,
              width = 238,
              height = 266,
              frame_count = 29,
              shift = util.mul_shift(util.by_pixel(6, 29), Scale),
              draw_as_shadow = true,
              scale = 0.5 * Scale,
            }
          }
        },
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-3.png",
            line_length = 8,
            direction_count = 1,
            width = 118,
            height = 104,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(22, -16), Scale),
            tint = Data.Color,
            scale = Scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-3.png",
              line_length = 8,
              direction_count = 1,
              width = 236,
              height = 208,
              frame_count = 29,
              shift = util.mul_shift(util.by_pixel(22, -16), Scale),
              tint = Data.Color,
              scale = 0.5 * Scale,
            }
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-3-shadow.png",
            line_length = 8,
            direction_count = 1,
            width = 110,
            height = 70,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(16, 2), Scale),
            draw_as_shadow = true,
            scale = Scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-3-shadow.png",
              line_length = 8,
              direction_count = 1,
              width = 214,
              height = 140,
              frame_count = 29,
              shift = util.mul_shift(util.by_pixel(17, 2), Scale),
              draw_as_shadow = true,
              scale = 0.5 * Scale,
            }
          }
        },
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-4.png",
            line_length = 8,
            direction_count = 1,
            width = 128,
            height = 80,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(16, -20), Scale),
            tint = Data.Color,
            scale = Scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-4.png",
              line_length = 8,
              direction_count = 1,
              width = 252,
              height = 154,
              frame_count = 24,
              shift = util.mul_shift(util.by_pixel(17, -19), Scale),
              tint = Data.Color,
              scale = 0.5 * Scale,
            }
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-4-shadow.png",
            line_length = 8,
            direction_count = 1,
            width = 124,
            height = 80,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(18, -16), Scale),
            draw_as_shadow = true,
            scale = Scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-4-shadow.png",
              line_length = 8,
              direction_count = 1,
              width = 248,
              height = 160,
              frame_count = 24,
              shift = util.mul_shift(util.by_pixel(18, -16), Scale),
              draw_as_shadow = true,
              scale = 0.5 * Scale,
            }
          }
        }
      },
    },
    secondary_pictures =
    {
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-1.png",
            line_length = 8,
            direction_count = 1,
            width = 106,
            height = 116,
            frame_count = 26,
            shift = util.mul_shift(util.by_pixel(-12, -10), Scale),
            tint = util.multiply_color(Data.Color , data.patch_tint_multiplier),
            scale = Scale ,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-1.png",
              line_length = 8,
              direction_count = 1,
              width = 210,
              height = 224,
              frame_count = 26,
              shift = util.mul_shift(util.by_pixel(-12, -8), Scale),
              tint = util.multiply_color(Data.Color , data.patch_tint_multiplier),
              scale = 0.5 * Scale,
            }
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-1-shadow.png",
            line_length = 8,
            direction_count = 1,
            width = 134,
            height = 98,
            frame_count = 26,
            shift = util.mul_shift(util.by_pixel(2, 0), Scale),
            draw_as_shadow = true,
            scale = Scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-1-shadow.png",
              line_length = 8,
              direction_count = 1,
              width = 266,
              height = 188,
              frame_count = 26,
              shift = util.mul_shift(util.by_pixel(2, 2), Scale),
              draw_as_shadow = true,
              scale = 0.5 * Scale,
            }
          }
        },
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-2.png",
            line_length = 8,
            direction_count = 1,
            width = 88,
            height = 76,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(-10, -18), Scale),
            tint = util.multiply_color(Data.Color , data.patch_tint_multiplier),
            scale = Scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-2.png",
              line_length = 8,
              direction_count = 1,
              width = 174,
              height = 150,
              frame_count = 29,
              shift = util.mul_shift(util.by_pixel(-9, -17), Scale),
              tint = util.multiply_color(Data.Color , data.patch_tint_multiplier),
              scale = 0.5 * Scale,
            }
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-2-shadow.png",
            line_length = 8,
            direction_count = 1,
            width = 120,
            height = 136,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(6, 28), Scale),
            draw_as_shadow = true,
            scale = Scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-2-shadow.png",
              line_length = 8,
              direction_count = 1,
              width = 238,
              height = 266,
              frame_count = 29,
              shift = util.mul_shift(util.by_pixel(6, 29), Scale),
              draw_as_shadow = true,
              scale = 0.5 * Scale,
            }
          }
        },
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-3.png",
            line_length = 8,
            direction_count = 1,
            width = 118,
            height = 104,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(22, -16), Scale),
            tint = util.multiply_color(Data.Color , data.patch_tint_multiplier),
            scale = Scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-3.png",
              line_length = 8,
              direction_count = 1,
              width = 236,
              height = 208,
              frame_count = 29,
              shift = util.mul_shift(util.by_pixel(22, -16), Scale),
              tint = util.multiply_color(Data.Color , data.patch_tint_multiplier),
              scale = 0.5 * Scale,
            }
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-3-shadow.png",
            line_length = 8,
            direction_count = 1,
            width = 110,
            height = 70,
            frame_count = 29,
            shift = util.mul_shift(util.by_pixel(16, 2), Scale),
            draw_as_shadow = true,
            scale = Scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-3-shadow.png",
              line_length = 8,
              direction_count = 1,
              width = 214,
              height = 140,
              frame_count = 29,
              shift = util.mul_shift(util.by_pixel(17, 2), Scale),
              draw_as_shadow = true,
              scale = 0.5 * Scale,
            }
          }
        },
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-4.png",
            line_length = 8,
            direction_count = 1,
            width = 128,
            height = 80,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(16, -20), Scale),
            tint = util.multiply_color(Data.Color , data.patch_tint_multiplier),
            scale = Scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-4.png",
              line_length = 8,
              direction_count = 1,
              width = 252,
              height = 154,
              frame_count = 24,
              shift = util.mul_shift(util.by_pixel(17, -19), Scale),
              tint = util.multiply_color(Data.Color , Scale),
              scale = 0.5 * Scale,
            }
          },
          {
            filename = "__base__/graphics/entity/acid-splash/acid-splash-4-shadow.png",
            line_length = 8,
            direction_count = 1,
            width = 124,
            height = 80,
            frame_count = 24,
            shift = util.mul_shift(util.by_pixel(18, -16), Scale),
            draw_as_shadow = true,
            scale = Scale,
            hr_version = {
              filename = "__base__/graphics/entity/acid-splash/hr-acid-splash-4-shadow.png",
              line_length = 8,
              direction_count = 1,
              width = 248,
              height = 160,
              frame_count = 24,
              shift = util.mul_shift(util.by_pixel(18, -16), Scale),
              draw_as_shadow = true,
              scale = 0.5 * Scale,
            }
          }
        }
      },
    }
  },
  {
    type = "sticker",
    name = Dmg.."-enemy-sticker-"..Size,
    flags = {"not-on-map"},

    animation =
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-13.png",
      line_length = 8,
      width = 60,
      height = 118,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = "additive",
      animation_speed = 2,
      scale = Scale,
      tint = Data.Color,
      shift = math3d.vector2.mul({-0.078125, -1.8125}, 0.1)
    },

    duration_in_ticks = 60 * 1,
    target_movement_modifier_from = 1,
    target_movement_modifier_to = 1,
    vehicle_speed_modifier_from = 1,
    vehicle_speed_modifier_to = 1,
    vehicle_friction_modifier_from = 1,
    vehicle_friction_modifier_to = 1,
    damage_per_tick = { amount = Data.Tier, type = Dmg }
  }
})
		end
	end
end

end