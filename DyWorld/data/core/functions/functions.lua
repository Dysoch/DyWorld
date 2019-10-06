
-- Important functions used everywhere

function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function Expensive_Check(num)
	local Setting = settings.startup["DyWorld_Expensive_Multiplier"].value
	return Round((num * Setting))
end

DyWorld_Productivity_Module_Add = {}

function DyWorld_Cloud(SCALE, TINT)
    return {
      filename = "__base__/graphics/entity/cloud/cloud-45-frames.png",
      flags = {'compressed'},
      priority = 'low',
      width = 256,
      height = 256,
      frame_count = 45,
      animation_speed = 0.5,
      line_length = 7,
      shift = {0.0, 0.75},
      scale = SCALE,
	  tint = TINT or nil,
    }
end
