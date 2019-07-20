
-- Core Module --
require("data.core.data-final")

function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

if settings.startup["DyWorld_Stack_Size_Mult"].value > 1 then
	for k, v in pairs(data.raw.item) do
		v.default_request_amount = v.stack_size
		v.stack_size = Round((v.stack_size*settings.startup["DyWorld_Stack_Size_Mult"].value), 0)
	end
	for k, v in pairs(data.raw.ammo) do
		v.default_request_amount = v.stack_size
		v.stack_size = Round((v.stack_size*settings.startup["DyWorld_Stack_Size_Mult"].value), 0)
	end
	for k, v in pairs(data.raw.gun) do
		v.default_request_amount = v.stack_size
		v.stack_size = Round((v.stack_size*settings.startup["DyWorld_Stack_Size_Mult"].value), 0)
	end
	for k, v in pairs(data.raw["repair-tool"]) do
		v.default_request_amount = v.stack_size
		v.stack_size = Round((v.stack_size*settings.startup["DyWorld_Stack_Size_Mult"].value), 0)
	end
	for k, v in pairs(data.raw["capsule"]) do
		v.default_request_amount = v.stack_size
		v.stack_size = Round((v.stack_size*settings.startup["DyWorld_Stack_Size_Mult"].value), 0)
	end
	for k, v in pairs(data.raw["module"]) do
		v.default_request_amount = v.stack_size
		v.stack_size = Round((v.stack_size*settings.startup["DyWorld_Stack_Size_Mult"].value), 0)
	end
	for k, v in pairs(data.raw["tool"]) do
		v.default_request_amount = v.stack_size
		v.stack_size = Round((v.stack_size*settings.startup["DyWorld_Stack_Size_Mult"].value), 0)
	end
	for k, v in pairs(data.raw["rail-planner"]) do
		v.default_request_amount = v.stack_size
		v.stack_size = Round((v.stack_size*settings.startup["DyWorld_Stack_Size_Mult"].value), 0)
	end
end

if settings.startup["DyWorld_Tech_Increaser"].value > 1 then
	for k, v in pairs(data.raw.technology) do
		if v.max_level then
		
		else
			v.unit.count = Round((v.unit.count * settings.startup["DyWorld_Tech_Increaser"].value), 0)
		end
	end
end

if settings.startup["DyWorld_Infinite_Resources"].value then
	for k, v in pairs(data.raw.resource) do
		v.infinite = true
		v.minimum = 60000
		v.normal = 300000
		v.infinite_depletion_amount = 10
	end
end