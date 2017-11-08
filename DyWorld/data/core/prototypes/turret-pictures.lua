require "data/prefix"

function DyWorld_gun_turret_extension(inputs, TINT)
return
{
  filename = "__base__/graphics/entity/gun-turret/gun-turret-gun-extension.png",
  priority = "medium",
  width = 65,
  height = 63,
  direction_count = 4,
  frame_count = inputs.frame_count and inputs.frame_count or 5,
  line_length = inputs.line_length and inputs.line_length or 0,
  run_mode = inputs.run_mode and inputs.run_mode or "forward",
  shift = {0.015625, -0.859375},
  axially_symmetrical = false,
  tint = TINT
}
end

function DyWorld_gun_turret_extension_mask(inputs)
return
{
  filename = "__base__/graphics/entity/gun-turret/gun-turret-gun-extension-mask.png",
  flags = { "mask" },
  width = 24,
  height = 31,
  direction_count = 4,
  frame_count = inputs.frame_count and inputs.frame_count or 5,
  line_length = inputs.line_length and inputs.line_length or 0,
  run_mode = inputs.run_mode and inputs.run_mode or "forward",
  shift = {0, -0.890625},
  axially_symmetrical = false,
  apply_runtime_tint = true
}
end

function DyWorld_gun_turret_extension_shadow(inputs)
return
{
  filename = "__base__/graphics/entity/gun-turret/gun-turret-gun-extension-shadow.png",
  width = 89,
  height = 49,
  direction_count = 4,
  frame_count = inputs.frame_count and inputs.frame_count or 5,
  line_length = inputs.line_length and inputs.line_length or 0,
  run_mode = inputs.run_mode and inputs.run_mode or "forward",
  shift = {1.20313, 0.015625},
  axially_symmetrical = false,
  draw_as_shadow = true
}
end

function DyWorld_gun_turret_attack(inputs, TINT)
return
{
  layers =
  {
    {
      width = 66,
      height = 64,
      frame_count = inputs.frame_count and inputs.frame_count or 2,
      axially_symmetrical = false,
      direction_count = 64,
      shift = {0, -0.875},
      stripes =
      {
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-gun-1.png",
          width_in_frames = inputs.frame_count and inputs.frame_count or 2,
          height_in_frames = 32,
		  tint = TINT
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-gun-2.png",
          width_in_frames = inputs.frame_count and inputs.frame_count or 2,
          height_in_frames = 32,
		  tint = TINT
        }
      }
    },
    {
      filename = "__base__/graphics/entity/gun-turret/gun-turret-gun-mask.png",
      flags = { "mask" },
      line_length = inputs.frame_count and inputs.frame_count or 2,
      width = 29,
      height = 27,
      frame_count = inputs.frame_count and inputs.frame_count or 2,
      axially_symmetrical = false,
      direction_count = 64,
      shift = {0.015625, -1.01563},
      apply_runtime_tint = true
    },
    {
      width = 91,
      height = 50,
      frame_count = inputs.frame_count and inputs.frame_count or 2,
      axially_symmetrical = false,
      direction_count = 64,
      shift = {1.23438, 0},
      draw_as_shadow = true,
      stripes =
      {
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-gun-shadow-1.png",
          width_in_frames = inputs.frame_count and inputs.frame_count or 2,
          height_in_frames = 32,
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-gun-shadow-2.png",
          width_in_frames = inputs.frame_count and inputs.frame_count or 2,
          height_in_frames = 32,
        }
      }
    }
  }
}
end