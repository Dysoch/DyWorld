require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

function DyWorld_gun_turret_base(TINT, SIZE)
local size = SIZE or 1
return
{
  layers =
  {
    {
      filename = "__base__/graphics/entity/gun-turret/gun-turret-base.png",
      priority = "high",
      width = 76,
      height = 60,
      axially_symmetrical = false,
      direction_count = 1,
      frame_count = 1,
      shift = util.by_pixel(1 * size, -1 * size),
	  tint = TINT,
      scale = size,
      hr_version = {
        filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-base.png",
        priority = "high",
        width = 150,
        height = 118,
        axially_symmetrical = false,
        direction_count = 1,
        frame_count = 1,
        shift = util.by_pixel(0.5 * size, -1 * size),
	    tint = TINT,
        scale = 0.5 * size
      }
    },
    {
      filename = "__base__/graphics/entity/gun-turret/gun-turret-base-mask.png",
      flags = { "mask" },
      line_length = 1,
      width = 62,
      height = 52,
      axially_symmetrical = false,
      direction_count = 1,
      frame_count = 1,
      shift = util.by_pixel(0, -4 * size),
      scale = size,
      hr_version = {
        filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-base-mask.png",
        flags = { "mask" },
        line_length = 1,
        width = 122,
        height = 102,
        axially_symmetrical = false,
        direction_count = 1,
        frame_count = 1,
        shift = util.by_pixel(0, -4.5 * size),
        scale = 0.5 * size
      }
    }
  }
}
end

function DyWorld_gun_turret_extension(inputs, SIZE)
local size = SIZE or 1
return
{
  filename = "__base__/graphics/entity/gun-turret/gun-turret-raising.png",
  priority = "medium",
  width = 66,
  height = 64,
  direction_count = 4,
  frame_count = inputs.frame_count or 5,
  line_length = inputs.line_length or 0,
  run_mode = inputs.run_mode or "forward",
  shift = util.by_pixel(0, -26 * size),
  axially_symmetrical = false,
  scale = size,
  hr_version =
  {
    filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-raising.png",
    priority = "medium",
    width = 130,
    height = 126,
    direction_count = 4,
    frame_count = inputs.frame_count or 5,
    line_length = inputs.line_length or 0,
    run_mode = inputs.run_mode or "forward",
    shift = util.by_pixel(0, -26.5 * size),
    axially_symmetrical = false,
    scale = 0.5 * size
  }
}
end

function DyWorld_gun_turret_extension_mask(inputs, SIZE)
local size = SIZE or 1
return
{
  filename = "__base__/graphics/entity/gun-turret/gun-turret-raising-mask.png",
  flags = { "mask" },
  width = 24,
  height = 32,
  direction_count = 4,
  frame_count = inputs.frame_count or 5,
  line_length = inputs.line_length or 0,
  run_mode = inputs.run_mode or "forward",
  shift = util.by_pixel(0, -28 * size),
  axially_symmetrical = false,
  apply_runtime_tint = true,
  scale = size,
  hr_version =
  {
    filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-raising-mask.png",
    flags = { "mask" },
    width = 48,
    height = 62,
    direction_count = 4,
    frame_count = inputs.frame_count or 5,
    line_length = inputs.line_length or 0,
    run_mode = inputs.run_mode or "forward",
    shift = util.by_pixel(0, -28 * size),
    axially_symmetrical = false,
    apply_runtime_tint = true,
    scale = 0.5 * size
  }
}
end

function DyWorld_gun_turret_extension_shadow(inputs, SIZE)
local size = SIZE or 1
return
{
  filename = "__base__/graphics/entity/gun-turret/gun-turret-raising-shadow.png",
  width = 126,
  height = 62,
  direction_count = 4,
  frame_count = inputs.frame_count or 5,
  line_length = inputs.line_length or 0,
  run_mode = inputs.run_mode or "forward",
  shift = util.by_pixel(19 * size, 2 * size),
  axially_symmetrical = false,
  draw_as_shadow = true,
  scale = size,
  hr_version =
  {
    filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-raising-shadow.png",
    width = 250,
    height = 124,
    direction_count = 4,
    frame_count = inputs.frame_count or 5,
    line_length = inputs.line_length or 0,
    run_mode = inputs.run_mode or "forward",
    shift = util.by_pixel(19 * size, 2.5 * size),
    axially_symmetrical = false,
    draw_as_shadow = true,
    scale = 0.5 * size
  }
}
end

function DyWorld_gun_turret_attack(inputs, SIZE)
local size = SIZE or 1
return
{
  layers =
  {
    {
      width = 66,
      height = 66,
      frame_count = inputs.frame_count or 2,
      axially_symmetrical = false,
      direction_count = 64,
      shift = util.by_pixel(0, -27 * size),
	  scale = size,
      stripes =
      {
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-1.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-2.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-3.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-4.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        }
      },
      hr_version =
      {
        width = 132,
        height = 130,
        frame_count = inputs.frame_count and inputs.frame_count or 2,
        axially_symmetrical = false,
        direction_count = 64,
        shift = util.by_pixel(0, -27.5 * size),
        stripes =
        {
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-1.png",
            width_in_frames = inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-2.png",
            width_in_frames = inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-3.png",
            width_in_frames = inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-4.png",
            width_in_frames = inputs.frame_count or 2,
            height_in_frames = 16
          }
        },
        scale = 0.5 * size
      }
    },
    {
      flags = { "mask" },
      line_length = inputs.frame_count or 2,
      width = 30,
      height = 28,
      frame_count = inputs.frame_count or 2,
      axially_symmetrical = false,
      direction_count = 64,
      shift = util.by_pixel(0, -32 * size),
      apply_runtime_tint = true,
	  scale = size,
      stripes =
      {
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-1.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-2.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-3.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-4.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        }
      },
      hr_version =
      {
        flags = { "mask" },
        line_length = inputs.frame_count or 2,
        width = 58,
        height = 54,
        frame_count = inputs.frame_count or 2,
        axially_symmetrical = false,
        direction_count = 64,
        shift = util.by_pixel(0, -32.5 * size),
        apply_runtime_tint = true,
        stripes =
        {
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-mask-1.png",
            width_in_frames = inputs.frame_count and inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-mask-2.png",
            width_in_frames = inputs.frame_count and inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-mask-3.png",
            width_in_frames = inputs.frame_count and inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-mask-4.png",
            width_in_frames = inputs.frame_count and inputs.frame_count or 2,
            height_in_frames = 16
          }
        },
        scale = 0.5 * size
      }
    },
    {
      width = 126,
      height = 62,
      frame_count = inputs.frame_count and inputs.frame_count or 2,
      axially_symmetrical = false,
      direction_count = 64,
      shift = util.by_pixel(23 * size, 2 * size),
      draw_as_shadow = true,
	  scale = size,
      stripes =
      {
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-1.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-2.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-3.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-4.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        }
      },
      hr_version =
      {
        width = 250,
        height = 124,
        frame_count = inputs.frame_count and inputs.frame_count or 2,
        axially_symmetrical = false,
        direction_count = 64,
        shift = util.by_pixel(22 * size, 2.5 * size),
        draw_as_shadow = true,
        stripes =
        {
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-shadow-1.png",
            width_in_frames = inputs.frame_count and inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-shadow-2.png",
            width_in_frames = inputs.frame_count and inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-shadow-3.png",
            width_in_frames = inputs.frame_count and inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-shadow-4.png",
            width_in_frames = inputs.frame_count and inputs.frame_count or 2,
            height_in_frames = 16
          }
        },
        scale = 0.5 * size
      }
    }
  }
}
end