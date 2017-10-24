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
    width = 40,
    height = 40,
    frame_count = 16,
	tint = TINT,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 80,
      height = 80,
      scale = 0.5,
      frame_count = 16,
	  tint = TINT,
    }
  }
	return result
end

function DyWorld_basic_belt_vertical(TINT)
	local result = 
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 40,
	tint = TINT,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 80,
      height = 80,
      frame_count = 16,
      scale = 0.5,
      y = 80,
	  tint = TINT,
    }
  }
	return result
end


function DyWorld_basic_belt_ending_top(TINT)
	local result = 
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 80,
	tint = TINT,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 80,
      height = 80,
      frame_count = 16,
      y = 160,
      scale = 0.5,
	  tint = TINT,
    }
  }
	return result
end


function DyWorld_basic_belt_ending_bottom(TINT)
	local result = 
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 120,
	tint = TINT,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 80,
      height = 80,
      frame_count = 16,
      y = 240,
      scale = 0.5,
	  tint = TINT,
    }
  }
	return result
end


function DyWorld_basic_belt_ending_side(TINT)
	local result = 
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 160,
	tint = TINT,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 80,
      height = 80,
      frame_count = 16,
      y = 320,
      scale = 0.5,
	  tint = TINT,
    }
  }
	return result
end

function DyWorld_basic_belt_starting_top(TINT)
	local result = 
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 200,
	tint = TINT,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 80,
      height = 80,
      frame_count = 16,
      y = 400,
      scale = 0.5,
	  tint = TINT,
    }
  }
	return result
end


function DyWorld_basic_belt_starting_bottom(TINT)
	local result = 
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 240,
	tint = TINT,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 80,
      height = 80,
      frame_count = 16,
      y = 480,
      scale = 0.5,
	  tint = TINT,
    }
  }
	return result
end


function DyWorld_basic_belt_starting_side(TINT)
	local result = 
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    width = 40,
    height = 40,
    frame_count = 16,
    y = 280,
	tint = TINT,
    hr_version =
    {
      filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
      priority = "extra-high",
      width = 80,
      height = 80,
      frame_count = 16,
      y = 560,
      scale = 0.5,
	  tint = TINT,
    }
  }
	return result
end

