
-- Core Module --
require("data.core.data-2")

-- DyComPa Module --
require("data.dycompa.data")

for k,v in pairs(data.raw.fluid) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.item) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.module) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.ammo) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.capsule) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.tool) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.gun) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.armor) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw["repair-tool"]) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw["rail-planner"]) do
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.recipe) do
	if not v.icon_size then v.icon_size = 32 end
end

for k,v in pairs(data.raw.technology) do
	if not v.icon_size then v.icon_size = 32 end
end	

for i,inserter in pairs(data.raw["inserter"]) do
    inserter.allow_custom_vectors = true
end

if settings.startup["DyWorld_Warfare_Difficulty"].value == 1 then
	for k,v in pairs(data.raw.unit) do	
		v.max_health = math.floor(v.max_health * 0.5)
		v.healing_per_tick = v.healing_per_tick * 0.5
	end	
	for k,v in pairs(data.raw.turret) do	
		v.max_health = math.floor(v.max_health * 0.5)
		v.healing_per_tick = v.healing_per_tick * 0.5
		v.call_for_help_radius = math.floor(v.call_for_help_radius * 0.5)
	end	
	for k,v in pairs(data.raw["unit-spawner"]) do	
		v.max_health = math.floor(v.max_health * 0.5)
		v.healing_per_tick = v.healing_per_tick * 0.5
		v.max_count_of_owned_units = math.floor(v.max_count_of_owned_units * 0.5)
		v.max_friends_around_to_spawn = math.floor(v.max_friends_around_to_spawn * 0.5)
		v.call_for_help_radius = math.floor(v.call_for_help_radius * 0.5)
		v.spawning_cooldown[1] = v.spawning_cooldown[1] * 2
		v.spawning_cooldown[2] = v.spawning_cooldown[2] * 2
	end	
elseif settings.startup["DyWorld_Warfare_Difficulty"].value == 3 then
	for k,v in pairs(data.raw.unit) do	
		v.pollution_to_join_attack = 1
		v.max_health = v.max_health * 10
		v.healing_per_tick = v.healing_per_tick * 2
	end	
	for k,v in pairs(data.raw.turret) do	
		v.max_health = v.max_health * 10
		v.healing_per_tick = v.healing_per_tick * 2
		v.call_for_help_radius = v.call_for_help_radius * 2
	end	
	for k,v in pairs(data.raw["unit-spawner"]) do	
		v.max_health = v.max_health * 10
		v.healing_per_tick = v.healing_per_tick * 2
		--v.max_count_of_owned_units = v.max_count_of_owned_units * 2
		--v.max_friends_around_to_spawn = v.max_friends_around_to_spawn * 2
		v.call_for_help_radius = v.call_for_help_radius * 2
		v.spawning_cooldown[1] = v.spawning_cooldown[1] * 0.5
		v.spawning_cooldown[2] = v.spawning_cooldown[2] * 0.5
	end	
elseif settings.startup["DyWorld_Warfare_Difficulty"].value == 4 then
	for k,v in pairs(data.raw.unit) do	
		v.pollution_to_join_attack = 1
		v.max_health = v.max_health * 25
		v.healing_per_tick = v.healing_per_tick * 4
	end	
	for k,v in pairs(data.raw.turret) do	
		v.max_health = v.max_health * 25
		v.healing_per_tick = v.healing_per_tick * 4
		v.call_for_help_radius = v.call_for_help_radius * 4
	end	
	for k,v in pairs(data.raw["unit-spawner"]) do	
		v.max_health = v.max_health * 25
		v.healing_per_tick = v.healing_per_tick * 4
		--v.max_count_of_owned_units = v.max_count_of_owned_units * 4
		--v.max_friends_around_to_spawn = v.max_friends_around_to_spawn * 4
		v.call_for_help_radius = v.call_for_help_radius * 4
		v.spawning_cooldown[1] = v.spawning_cooldown[1] * 0.25
		v.spawning_cooldown[2] = v.spawning_cooldown[2] * 0.25
	end	
elseif settings.startup["DyWorld_Warfare_Difficulty"].value == 5 then
	for k,v in pairs(data.raw.unit) do	
		v.pollution_to_join_attack = 1
		v.max_health = v.max_health * 100
		v.healing_per_tick = v.healing_per_tick * 20
	end	
	for k,v in pairs(data.raw.turret) do	
		v.max_health = v.max_health * 100
		v.healing_per_tick = v.healing_per_tick * 20
		v.call_for_help_radius = v.call_for_help_radius * 10
	end	
	for k,v in pairs(data.raw["unit-spawner"]) do	
		v.max_health = v.max_health * 100
		v.healing_per_tick = v.healing_per_tick * 10
		--v.max_count_of_owned_units = v.max_count_of_owned_units * 10
		--v.max_friends_around_to_spawn = v.max_friends_around_to_spawn * 10
		v.call_for_help_radius = v.call_for_help_radius * 5
		v.spawning_cooldown[1] = v.spawning_cooldown[1] * 0.125
		v.spawning_cooldown[2] = v.spawning_cooldown[2] * 0.125
	end	
end