

for k,v in pairs(data.raw["projectile"]) do
	if not v.collision_box then
		v.collision_box = {{-0.05, -0.25}, {0.05, 0.25}}
	end
	if not v.direction_only then
		v.direction_only = true
	end
end

for k,v in pairs(data.raw["ammo"]) do
	if not v.magazine_size then
		v.magazine_size = 50
	else
		v.magazine_size = v.magazine_size*2
	end
end

if settings.startup["DyWorld_Debug"].value then
Stacksize_Increase_Factor = 100
	for k, v in pairs(data.raw.item) do
		v.default_request_amount = v.stack_size
		v.stack_size = (v.stack_size*Stacksize_Increase_Factor)
	end
	for k, v in pairs(data.raw.ammo) do
		v.default_request_amount = v.stack_size
		v.stack_size = (v.stack_size*Stacksize_Increase_Factor)
	end
	for k, v in pairs(data.raw.gun) do
		v.default_request_amount = v.stack_size
		v.stack_size = (v.stack_size*Stacksize_Increase_Factor)
	end
	for k, v in pairs(data.raw["repair-tool"]) do
		v.default_request_amount = v.stack_size
		v.stack_size = (v.stack_size*Stacksize_Increase_Factor)
	end
	for k, v in pairs(data.raw["mining-tool"]) do
		v.default_request_amount = v.stack_size
		v.stack_size = (v.stack_size*Stacksize_Increase_Factor)
	end
	for k, v in pairs(data.raw["capsule"]) do
		v.default_request_amount = v.stack_size
		v.stack_size = (v.stack_size*Stacksize_Increase_Factor)
	end
	for k, v in pairs(data.raw["module"]) do
		v.default_request_amount = v.stack_size
		v.stack_size = (v.stack_size*Stacksize_Increase_Factor)
	end
	for k, v in pairs(data.raw["tool"]) do
		v.default_request_amount = v.stack_size
		v.stack_size = (v.stack_size*Stacksize_Increase_Factor)
	end
	for k, v in pairs(data.raw["rail-planner"]) do
		v.default_request_amount = v.stack_size
		v.stack_size = (v.stack_size*Stacksize_Increase_Factor)
	end
end