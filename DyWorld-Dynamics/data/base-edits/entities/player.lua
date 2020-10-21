




-- Player Edits --
data.raw.character.character.max_health = 1000
data.raw.character.character.crafting_categories = {"assembling-tier-0", "assembling-tier-1"}
data.raw.character.character.mining_categories = {"resource-solid-tier-0"}
data.raw.character.character.inventory_size = 120
data.raw.character.character.healing_per_tick = 0
data.raw.character.character.build_distance = 15

if settings.startup["DyWorld_Light_Setting"].value then
	data.raw.character.character.light[1].minimum_darkness = 0.2
	data.raw.character.character.light[1].intensity = 0.7
	data.raw.character.character.light[1].size = 100
	
	data.raw.character.character.light[2].minimum_darkness = 0.2
	data.raw.character.character.light[2].intensity = 0.8
end

if settings.startup["DyWorld_Debug"].value then
	data.raw["solar-panel"]["solar-panel"].production = "60MW"
	data.raw["accumulator"]["accumulator"].energy_source.input_flow_limit = "60MW"
	data.raw["accumulator"]["accumulator"].energy_source.output_flow_limit = "60MW"
	data.raw["accumulator"]["accumulator"].energy_source.buffer_capacity = "1000MJ"
end