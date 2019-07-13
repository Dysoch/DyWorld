-- Specifies set of pictures and animations used by more entities, to avoid duplication.
-- The standard set of transport belt pictures (vertical/horizontal + endings + startings)
-- are used in transport belt, transport belt to ground and splitter.

require "data/prefix"

function DyWorld_ending_patch_prototype(TINT)
	local result = 
  {
    sheet =
    {
      filename = "__base__/graphics/entity/transport-belt/start-end-integration-patches.png",
      width = 40,
      height = 40,
      priority = "extra-high",
	  tint = TINT,
      hr_version =
      {
        filename = "__base__/graphics/entity/transport-belt/hr-start-end-integration-patches.png",
        width = 80,
        height = 80,
        priority = "extra-high",
        scale = 0.5,
		tint = TINT,
      }
    }
  }
	return result
end

---------------------- BASIC BELT PICTURES
function DyWorld_basic_belt_horizontal(TINT)
	local result = 
    {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 64,
    height = 64,
    frame_count = 16,
	tint = TINT,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
	  tint = TINT,
      frame_count = 16
    }
  }
	return result
end

function DyWorld_basic_belt_vertical(TINT)
	local result = 
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 64,
    height = 64,
    frame_count = 16,
    y = 64,
	tint = TINT,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      frame_count = 16,
      scale = 0.5,
	  tint = TINT,
      y = 128
    }
  }
	return result
end


function DyWorld_basic_belt_ending_top(TINT)
	local result = 
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 64,
    height = 64,
    frame_count = 16,
    y = 64*2,
	tint = TINT,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      frame_count = 16,
      y = 128*2,
	  tint = TINT,
      scale = 0.5
    }
  }
	return result
end


function DyWorld_basic_belt_ending_bottom(TINT)
	local result = 
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 64,
    height = 64,
    frame_count = 16,
    y = 64*3,
	tint = TINT,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      frame_count = 16,
      y = 128*3,
	  tint = TINT,
      scale = 0.5
    }
  }
	return result
end


function DyWorld_basic_belt_ending_side(TINT)
	local result = 
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 64,
    height = 64,
    frame_count = 16,
    y = 64*4,
	tint = TINT,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      frame_count = 16,
      y = 128*4,
	  tint = TINT,
      scale = 0.5
    }
  }
	return result
end

function DyWorld_basic_belt_starting_top(TINT)
	local result = 
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 64,
    height = 64,
    frame_count = 16,
    y = 64*5,
	tint = TINT,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      frame_count = 16,
      y = 128*5,
	  tint = TINT,
      scale = 0.5
    }
  }
	return result
end


function DyWorld_basic_belt_starting_bottom(TINT)
	local result = 
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 64,
    height = 64,
    frame_count = 16,
    y = 64*6,
	tint = TINT,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      frame_count = 16,
      y = 128*6,
	  tint = TINT,
      scale = 0.5
    }
  }
	return result
end


function DyWorld_basic_belt_starting_side(TINT)
	local result = 
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 64,
    height = 64,
    frame_count = 16,
    y = 64*7,
	tint = TINT,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      frame_count = 16,
      y = 128*7,
	  tint = TINT,
      scale = 0.5
    }
  }
	return result
end

