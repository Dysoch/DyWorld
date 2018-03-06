

require("data.core.science.infinite-science-edits")

for k,v in pairs(data.raw["projectile"]) do
	if v.name == "cliff-explosives" then
		-- nothing, to make sure it is skipped so that one will work as intended
	else
		if not v.collision_box then
			v.collision_box = {{-0.05, -0.25}, {0.05, 0.25}}
		end
		if not v.direction_only then
			v.direction_only = true
		end
	end
end

for k,v in pairs(data.raw["ammo"]) do
	if not v.magazine_size then
		v.magazine_size = 50
	else
		v.magazine_size = math.floor(v.magazine_size * 2.5)
	end
end

if settings.startup["DyWorld_Stack_Size_Mult"].value > 1 then
	for k, v in pairs(data.raw.item) do
		v.default_request_amount = v.stack_size
		v.stack_size = (v.stack_size*settings.startup["DyWorld_Stack_Size_Mult"].value)
	end
	for k, v in pairs(data.raw.ammo) do
		v.default_request_amount = v.stack_size
		v.stack_size = (v.stack_size*settings.startup["DyWorld_Stack_Size_Mult"].value)
	end
	for k, v in pairs(data.raw.gun) do
		v.default_request_amount = v.stack_size
		v.stack_size = (v.stack_size*settings.startup["DyWorld_Stack_Size_Mult"].value)
	end
	for k, v in pairs(data.raw["repair-tool"]) do
		v.default_request_amount = v.stack_size
		v.stack_size = (v.stack_size*settings.startup["DyWorld_Stack_Size_Mult"].value)
	end
	for k, v in pairs(data.raw["mining-tool"]) do
		v.default_request_amount = v.stack_size
		v.stack_size = (v.stack_size*settings.startup["DyWorld_Stack_Size_Mult"].value)
	end
	for k, v in pairs(data.raw["capsule"]) do
		v.default_request_amount = v.stack_size
		v.stack_size = (v.stack_size*settings.startup["DyWorld_Stack_Size_Mult"].value)
	end
	for k, v in pairs(data.raw["module"]) do
		v.default_request_amount = v.stack_size
		v.stack_size = (v.stack_size*settings.startup["DyWorld_Stack_Size_Mult"].value)
	end
	for k, v in pairs(data.raw["tool"]) do
		v.default_request_amount = v.stack_size
		v.stack_size = (v.stack_size*settings.startup["DyWorld_Stack_Size_Mult"].value)
	end
	for k, v in pairs(data.raw["rail-planner"]) do
		v.default_request_amount = v.stack_size
		v.stack_size = (v.stack_size*settings.startup["DyWorld_Stack_Size_Mult"].value)
	end
end

if settings.startup["DyWorld_Infinite_Resources"].value then
	for k, v in pairs(data.raw.resource) do
		v.infinite = true
		v.minimum = 6000
		v.normal = 300000
		v.infinite_depletion_amount = 10
	end
end