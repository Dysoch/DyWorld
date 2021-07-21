
Ruins_Nauvis = {"crash-site-spaceship-wreck-small-6", "crash-site-spaceship-wreck-small-5", "crash-site-spaceship-wreck-small-4", "crash-site-spaceship-wreck-small-3", "crash-site-spaceship-wreck-small-2", "crash-site-spaceship-wreck-small-1", "crash-site-spaceship-wreck-medium-3", "crash-site-spaceship-wreck-medium-2", "crash-site-spaceship-wreck-medium-1", "crash-site-spaceship-wreck-big-2", "sand-rock-big", "rock-big", "rock-huge", "small-scorchmark", "medium-scorchmark", "big-scorchmark", "huge-scorchmark"}
Ruins = {"iron-chest-remnants", "big-remnants", "medium-remnants", "medium-small-remnants", "small-remnants", "1x2-remnants", "wooden-chest-remnants", "iron-chest-remnants", "assembling-machine-1-remnants", "assembling-machine-2-remnants", "burner-inserter-remnants", "inserter-remnants", "long-handed-inserter-remnants", "fast-inserter-remnants", "filter-inserter-remnants", "transport-belt-remnants", "splitter-remnants", "underground-belt-remnants", "wall-remnants", "gate-remnants", "lamp-remnants", "small-electric-pole-remnants", "medium-electric-pole-remnants", "big-electric-pole-remnants", "pipe-remnants", "pipe-to-ground-remnants", "stone-furnace-remnants", "steel-furnace-remnants", "electric-furnace-remnants", "burner-mining-drill-remnants", "electric-mining-drill-remnants", "gun-turret-remnants", "radar-remnants", "steam-engine-remnants", "lab-remnants", "boiler-remnants", "car-remnants", "straight-rail-remnants", "curved-rail-remnants", "rail-ending-remnants", "rail-chain-signal-remnants", "steel-chest-remnants", "rail-signal-remnants", "laser-turret-remnants", "train-stop-remnants", "solar-panel-remnants", "locomotive-remnants", "cargo-wagon-remnants", "accumulator-remnants", "rocket-silo-remnants", "land-mine-remnants", "substation-remnants", "storage-tank-remnants", "oil-refinery-remnants", "pumpjack-remnants", "centrifuge-remnants", "flamethrower-turret-remnants", "artillery-turret-remnants", "roboport-remnants", "steam-turbine-remnants", "pump-remnants", "beacon-remnants", "heat-exchanger-remnants", "heat-pipe-remnants", "nuclear-reactor-remnants", "chemical-plant-remnants", "tank-remnants", "assembling-machine-3-remnants", "spidertron-remnants", "medium-scorchmark", "small-scorchmark", "big-scorchmark", "huge-scorchmark"}
local keysetRuins_Nauvis = {}
for k in pairs(Ruins_Nauvis) do
    table.insert(keysetRuins_Nauvis, k)
end
local keysetRuins = {}
for k in pairs(Ruins) do
    table.insert(keysetRuins, k)
end

function Event_on_chunk_generated(event)
		----- Story Objective Check -----
		Story_Objectives("chunk-gen", event)
	
	----- Global counter -----
	if not global.dyworld.game_stats.chunks then
		global.dyworld.game_stats.chunks = 1
	else
		global.dyworld.game_stats.chunks = global.dyworld.game_stats.chunks + 1
	end
	
	-- Remove Resources
	local Resources = {"stone"}
	local surface = event.surface
	local surface_name = surface.name
	local size = 50

	for _, e in pairs(surface.find_entities_filtered{area = event.area, type = "resource"}) do 
		for _,resource in pairs(Resources) do
			if e.name == resource then
				e.destroy() 
			end
		end
	end
	
	-- Generate Enemies -- 
	if not global.dyworld.game_stats.enemy_1_chunk then global.dyworld.game_stats.enemy_1_chunk = 1000 end
	if not global.dyworld.game_stats.enemy_2_chunk then global.dyworld.game_stats.enemy_2_chunk = 2000 end
	if not global.dyworld.game_stats.enemy_3_chunk then global.dyworld.game_stats.enemy_3_chunk = 3000 end
	if not global.dyworld.game_stats.enemy_4_chunk then global.dyworld.game_stats.enemy_4_chunk = 4000 end
	if not global.dyworld.game_stats.enemy_5_chunk then global.dyworld.game_stats.enemy_5_chunk = 5000 end
	if surface_name ~= "starmap-1" then
		if global.dyworld.game_stats.chunks >= global.dyworld.game_stats.enemy_1_chunk then
			--BuildEntity = "dy-spawner-1"
			BuildEntity = "biter-spawner"
			PosX = event.area.left_top.x + math.random(-63,63)
			PosY = event.area.left_top.y + math.random(-63,63)
			if game.surfaces[surface_name].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then
				game.surfaces[surface_name].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.enemy}
				global.dyworld.game_stats.enemy_1_chunk = global.dyworld.game_stats.enemy_1_chunk + 50
				--debug("Spawned "..BuildEntity.." at "..PosX..", "..PosY.." on "..surface_name.." (Spawner 1)")
			end
		end
		if global.dyworld.game_stats.chunks >= global.dyworld.game_stats.enemy_2_chunk then
			--BuildEntity = "dy-spawner-2"
			BuildEntity = "biter-spawner"
			PosX = event.area.left_top.x + math.random(-63,63)
			PosY = event.area.left_top.y + math.random(-63,63)
			if game.surfaces[surface_name].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then
				game.surfaces[surface_name].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.enemy}
				global.dyworld.game_stats.enemy_2_chunk = global.dyworld.game_stats.enemy_2_chunk + 100
				--debug("Spawned "..BuildEntity.." at "..PosX..", "..PosY.." on "..surface_name.." (Spawner 2)")
			end
		end
		if global.dyworld.game_stats.chunks >= global.dyworld.game_stats.enemy_3_chunk then
			--BuildEntity = "dy-spawner-3"
			BuildEntity = "biter-spawner"
			PosX = event.area.left_top.x + math.random(-63,63)
			PosY = event.area.left_top.y + math.random(-63,63)
			if game.surfaces[surface_name].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then
				game.surfaces[surface_name].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.enemy}
				global.dyworld.game_stats.enemy_3_chunk = global.dyworld.game_stats.enemy_3_chunk + 150
				--debug("Spawned "..BuildEntity.." at "..PosX..", "..PosY.." on "..surface_name.." (Spawner 3)")
			end
		end
		if global.dyworld.game_stats.chunks >= global.dyworld.game_stats.enemy_4_chunk then
			--BuildEntity = "dy-spawner-4"
			BuildEntity = "biter-spawner"
			PosX = event.area.left_top.x + math.random(-63,63)
			PosY = event.area.left_top.y + math.random(-63,63)
			if game.surfaces[surface_name].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then
				game.surfaces[surface_name].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.enemy}
				global.dyworld.game_stats.enemy_4_chunk = global.dyworld.game_stats.enemy_4_chunk + 200
				--debug("Spawned "..BuildEntity.." at "..PosX..", "..PosY.." on "..surface_name.." (Spawner 4)")
			end
		end
		if global.dyworld.game_stats.chunks >= global.dyworld.game_stats.enemy_5_chunk then
			--BuildEntity = "dy-spawner-5"
			BuildEntity = "biter-spawner"
			PosX = event.area.left_top.x + math.random(-63,63)
			PosY = event.area.left_top.y + math.random(-63,63)
			if game.surfaces[surface_name].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then
				game.surfaces[surface_name].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.enemy}
				global.dyworld.game_stats.enemy_5_chunk = global.dyworld.game_stats.enemy_5_chunk + 150
				--debug("Spawned "..BuildEntity.." at "..PosX..", "..PosY.." on "..surface_name.." (Spawner 5)")
			end
		end
	end
	
	-- Generate Ruins -- 
	if not global.dyworld.game_stats.ruins_1_chunk then global.dyworld.game_stats.ruins_1_chunk = 500 end
	if not global.dyworld.game_stats.ruins_2_chunk then global.dyworld.game_stats.ruins_2_chunk = 500 end
	if surface_name ~= "starmap-1" then
		if (global.dyworld.game_stats.chunks >= global.dyworld.game_stats.ruins_1_chunk and surface_name == "nauvis") then
			for i = 1, (math.random(5,25)) do
				BuildEntity = Ruins_Nauvis[keysetRuins_Nauvis[math.random(#keysetRuins_Nauvis)]]
				PosX = event.area.left_top.x+math.random(-63,63)
				PosY = event.area.left_top.y+math.random(-63,63)
				if game.surfaces[surface_name].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then
					game.surfaces[surface_name].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.neutral}
					--debug("Spawned "..BuildEntity.." at "..PosX..", "..PosY.." on "..surface_name.." (Ruins Nauvis)")
				end
			end
			global.dyworld.game_stats.ruins_1_chunk = global.dyworld.game_stats.ruins_1_chunk + 150
		end
		if global.dyworld.game_stats.chunks >= global.dyworld.game_stats.ruins_2_chunk then
			for i = 1, (math.random(5,15)) do
				BuildEntity = Ruins[keysetRuins[math.random(#keysetRuins)]]
				PosX = event.area.left_top.x+math.random(-63,63)
				PosY = event.area.left_top.y+math.random(-63,63)
				if game.surfaces[surface_name].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then
					game.surfaces[surface_name].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.neutral}
					--debug("Spawned "..BuildEntity.." at "..PosX..", "..PosY.." on "..surface_name.." (Ruins)")
				end
			end
			global.dyworld.game_stats.ruins_2_chunk = global.dyworld.game_stats.ruins_2_chunk + 100
		end
	end
end

function Event_on_research_finished(event)
	local Time = global.dyworld.game_stats.time_stamp
	local research = event.research
	local name = research.name
	if global.dyworld_story then
		----- Story Objective Check -----
		Story_Objectives("research", event)
	end
	if not global.dyworld.research_done[event.research.name] then
		table.insert(global.dyworld.research_done, event.research.name)
		--debug("Researched: "..event.research.name)
	end
	if not global.dyworld.game_stats.research then global.dyworld.game_stats.research = 0 end
	global.dyworld.game_stats.research = global.dyworld.game_stats.research + 1
	if Dy_Find_Str(name, "dyson-efficiency") then
		if not global.dyworld.game_stats.dyson then
			global.dyworld.game_stats.dyson = {
					power_total = 0,
					power = 0,
					power_used = 0,
					effect = 0,
					sats = 0,
					structures = 0,
				}
		end
		global.dyworld.game_stats.dyson.effect = global.dyworld.game_stats.dyson.effect + 4.5
	end
	if name == "dyson-network-1" then
		if not global.dyworld.game_stats.dyson then
			global.dyworld.game_stats.dyson = {
					power_total = 0,
					power = 0,
					power_used = 0,
					power_drain = 0,
					effect = 0,
					sats = 0,
					structures = 0,
				}
		end
		global.dyworld.game_stats.dyson.effect = global.dyworld.game_stats.dyson.effect + 5
		if not global.dyworld.game_stats.dyson.power_drain then global.dyworld.game_stats.dyson.power_drain = 0 end
		global.dyworld.game_stats.dyson.power_drain = global.dyworld.game_stats.dyson.power_drain + 50
	end
	if name == "dyson-network-2" then
		global.dyworld.game_stats.dyson.power_drain = global.dyworld.game_stats.dyson.power_drain + 150
	end
	if name == "dyson-network-3" then
		global.dyworld.game_stats.dyson.power_drain = global.dyworld.game_stats.dyson.power_drain + 300
	end
	if name == "dyson-network-4" then
		global.dyworld.game_stats.dyson.power_drain = global.dyworld.game_stats.dyson.power_drain + 500
	end
	if not global.dyworld.game_stats.space_mining then
		global.dyworld.game_stats.space_mining = {
			["iron"] = {efficiency = 1, pure_rate = 0, pure_mined = 0, pure_storage = 100, impure_rate = 0, impure_mined = 0, impure_storage = 900},
			["copper"] = {efficiency = 1, pure_rate = 0, pure_mined = 0, pure_storage = 100, impure_rate = 0, impure_mined = 0, impure_storage = 900},
			["tin"] = {efficiency = 1, pure_rate = 0, pure_mined = 0, pure_storage = 100, impure_rate = 0, impure_mined = 0, impure_storage = 900},
			["titanium"] = {efficiency = 1, pure_rate = 0, pure_mined = 0, pure_storage = 100, impure_rate = 0, impure_mined = 0, impure_storage = 900},
			["magnesium"] = {efficiency = 1, pure_rate = 0, pure_mined = 0, pure_storage = 100, impure_rate = 0, impure_mined = 0, impure_storage = 900},
			["aluminium"] = {efficiency = 1, pure_rate = 0, pure_mined = 0, pure_storage = 100, impure_rate = 0, impure_mined = 0, impure_storage = 900},
			["gold"] = {efficiency = 1, pure_rate = 0, pure_mined = 0, pure_storage = 100, impure_rate = 0, impure_mined = 0, impure_storage = 900},
			["silver"] = {efficiency = 1, pure_rate = 0, pure_mined = 0, pure_storage = 100, impure_rate = 0, impure_mined = 0, impure_storage = 900},
			["lead"] = {efficiency = 1, pure_rate = 0, pure_mined = 0, pure_storage = 100, impure_rate = 0, impure_mined = 0, impure_storage = 900},
			["uranium"] = {efficiency = 1, pure_rate = 0, pure_mined = 0, pure_storage = 100, impure_rate = 0, impure_mined = 0, impure_storage = 900},
		}
	end
	if Dy_Find_Str(name, "space-mining-storage-") then
		if Dy_Find_Str(name, "iron") then
		local Type = "iron"
			global.dyworld.game_stats.space_mining[Type].pure_storage = global.dyworld.game_stats.space_mining[Type].pure_storage * 2
			global.dyworld.game_stats.space_mining[Type].impure_storage = global.dyworld.game_stats.space_mining[Type].impure_storage * 2
		elseif Dy_Find_Str(name, "copper") then
		local Type = "copper"
			global.dyworld.game_stats.space_mining[Type].pure_storage = global.dyworld.game_stats.space_mining[Type].pure_storage * 2
			global.dyworld.game_stats.space_mining[Type].impure_storage = global.dyworld.game_stats.space_mining[Type].impure_storage * 2
		elseif Dy_Find_Str(name, "tin") then
		local Type = "tin"
			global.dyworld.game_stats.space_mining[Type].pure_storage = global.dyworld.game_stats.space_mining[Type].pure_storage * 2
			global.dyworld.game_stats.space_mining[Type].impure_storage = global.dyworld.game_stats.space_mining[Type].impure_storage * 2
		elseif Dy_Find_Str(name, "titanium") then
		local Type = "titanium"
			global.dyworld.game_stats.space_mining[Type].pure_storage = global.dyworld.game_stats.space_mining[Type].pure_storage * 2
			global.dyworld.game_stats.space_mining[Type].impure_storage = global.dyworld.game_stats.space_mining[Type].impure_storage * 2
		elseif Dy_Find_Str(name, "magnesium") then
		local Type = "magnesium"
			global.dyworld.game_stats.space_mining[Type].pure_storage = global.dyworld.game_stats.space_mining[Type].pure_storage * 2
			global.dyworld.game_stats.space_mining[Type].impure_storage = global.dyworld.game_stats.space_mining[Type].impure_storage * 2
		elseif Dy_Find_Str(name, "aluminium") then
		local Type = "aluminium"
			global.dyworld.game_stats.space_mining[Type].pure_storage = global.dyworld.game_stats.space_mining[Type].pure_storage * 2
			global.dyworld.game_stats.space_mining[Type].impure_storage = global.dyworld.game_stats.space_mining[Type].impure_storage * 2
		elseif Dy_Find_Str(name, "gold") then
		local Type = "gold"
			global.dyworld.game_stats.space_mining[Type].pure_storage = global.dyworld.game_stats.space_mining[Type].pure_storage * 2
			global.dyworld.game_stats.space_mining[Type].impure_storage = global.dyworld.game_stats.space_mining[Type].impure_storage * 2
		elseif Dy_Find_Str(name, "silver") then
		local Type = "silver"
			global.dyworld.game_stats.space_mining[Type].pure_storage = global.dyworld.game_stats.space_mining[Type].pure_storage * 2
			global.dyworld.game_stats.space_mining[Type].impure_storage = global.dyworld.game_stats.space_mining[Type].impure_storage * 2
		elseif Dy_Find_Str(name, "lead") then
		local Type = "lead"
			global.dyworld.game_stats.space_mining[Type].pure_storage = global.dyworld.game_stats.space_mining[Type].pure_storage * 2
			global.dyworld.game_stats.space_mining[Type].impure_storage = global.dyworld.game_stats.space_mining[Type].impure_storage * 2
		elseif Dy_Find_Str(name, "uranium") then
		local Type = "uranium"
			global.dyworld.game_stats.space_mining[Type].pure_storage = global.dyworld.game_stats.space_mining[Type].pure_storage * 2
			global.dyworld.game_stats.space_mining[Type].impure_storage = global.dyworld.game_stats.space_mining[Type].impure_storage * 2
		end
	end
	if Dy_Find_Str(name, "space-mining-efficiency-") then
		if Dy_Find_Str(name, "iron") then
		local Type = "iron"
			global.dyworld.game_stats.space_mining[Type].efficiency = global.dyworld.game_stats.space_mining[Type].efficiency + 0.05
		elseif Dy_Find_Str(name, "copper") then
		local Type = "copper"
			global.dyworld.game_stats.space_mining[Type].efficiency = global.dyworld.game_stats.space_mining[Type].efficiency + 0.05
		elseif Dy_Find_Str(name, "tin") then
		local Type = "tin"
			global.dyworld.game_stats.space_mining[Type].efficiency = global.dyworld.game_stats.space_mining[Type].efficiency + 0.05
		elseif Dy_Find_Str(name, "titanium") then
		local Type = "titanium"
			global.dyworld.game_stats.space_mining[Type].efficiency = global.dyworld.game_stats.space_mining[Type].efficiency + 0.05
		elseif Dy_Find_Str(name, "magnesium") then
		local Type = "magnesium"
			global.dyworld.game_stats.space_mining[Type].efficiency = global.dyworld.game_stats.space_mining[Type].efficiency + 0.05
		elseif Dy_Find_Str(name, "aluminium") then
		local Type = "aluminium"
			global.dyworld.game_stats.space_mining[Type].efficiency = global.dyworld.game_stats.space_mining[Type].efficiency + 0.05
		elseif Dy_Find_Str(name, "gold") then
		local Type = "gold"
			global.dyworld.game_stats.space_mining[Type].efficiency = global.dyworld.game_stats.space_mining[Type].efficiency + 0.05
		elseif Dy_Find_Str(name, "silver") then
		local Type = "silver"
			global.dyworld.game_stats.space_mining[Type].efficiency = global.dyworld.game_stats.space_mining[Type].efficiency + 0.05
		elseif Dy_Find_Str(name, "lead") then
		local Type = "lead"
			global.dyworld.game_stats.space_mining[Type].efficiency = global.dyworld.game_stats.space_mining[Type].efficiency + 0.05
		elseif Dy_Find_Str(name, "uranium") then
		local Type = "uranium"
			global.dyworld.game_stats.space_mining[Type].efficiency = global.dyworld.game_stats.space_mining[Type].efficiency + 0.05
		end
	end
end

function Event_on_character_corpse_expired(event)
	if global.dyworld_story then
		----- Story Objective Check -----
		Story_Objectives("corpse-player", event)
	end
end

function Event_on_rocket_launched(event)
    local rocket = event.rocket
    local surface = rocket.surface.name
    local inventory = rocket.get_inventory(1)
    local contents = inventory.get_contents()
		----- Story Objective Check -----
		Story_Objectives("launch-rocket", event)
	
	----- Global counter -----
	if not global.dyworld.game_stats.rockets_launch_items then global.dyworld.game_stats.rockets_launch_items = {} end
	for k,v in pairs(contents) do
		if not global.dyworld.game_stats.rockets_launch_items[k] then
			global.dyworld.game_stats.rockets_launch_items[k] = v
		else
			global.dyworld.game_stats.rockets_launch_items[k] = global.dyworld.game_stats.rockets_launch_items[k] + v
		end
	end
	if not global.dyworld.game_stats.rockets_launched then
		global.dyworld.game_stats.rockets_launched = 1
	else
		global.dyworld.game_stats.rockets_launched = global.dyworld.game_stats.rockets_launched + 1
	end
	
	-- Dyson Network (All) --
	if not global.dyworld.game_stats.dyson then
		global.dyworld.game_stats.dyson = {
			power_total = 0,
			power = 0,
			power_used = 0,
			effect = 0,
			sats = 0,
			structures = 0,
		}
	end
	-- Dyson Network (Swarm) --
	if not global.dyworld.game_stats.dyson_1[surface] then
		global.dyworld.game_stats.dyson_1[surface] = {
			power_total = 0,
			power = 0,
			power_used = 0,
			effect = game.surfaces[surface].solar_power_multiplier,
			sats = 0,
			structures = 0,
		}
	end
	for k,v in pairs(contents) do
		if Dyson_Network_Swarm[k] then
			global.dyworld.game_stats.dyson.power_total = global.dyworld.game_stats.dyson.power_total + ((Dyson_Network_Swarm[k] * v) * game.surfaces[surface].solar_power_multiplier)
			global.dyworld.game_stats.dyson.power = global.dyworld.game_stats.dyson.power + ((Dyson_Network_Swarm[k] * v) * game.surfaces[surface].solar_power_multiplier)
			global.dyworld.game_stats.dyson_1[surface].power_total = global.dyworld.game_stats.dyson_1[surface].power_total + ((Dyson_Network_Swarm[k] * v) * game.surfaces[surface].solar_power_multiplier)
			global.dyworld.game_stats.dyson_1[surface].power = global.dyworld.game_stats.dyson_1[surface].power + ((Dyson_Network_Swarm[k] * v) * game.surfaces[surface].solar_power_multiplier)
			global.dyworld.game_stats.dyson_1[surface].sats = global.dyworld.game_stats.dyson_1[surface].sats + v
			global.dyworld.game_stats.dyson.sats = global.dyworld.game_stats.dyson.sats + v
		end
	end
	
	-- Dyson Network (Sphere) --
	for k,v in pairs(contents) do
		if Dyson_Network_Sphere[k] then
			global.dyworld.game_stats.dyson.power_total = global.dyworld.game_stats.dyson.power_total + ((Dyson_Network_Sphere[k] * v) * game.surfaces[surface].solar_power_multiplier)
			global.dyworld.game_stats.dyson.power = global.dyworld.game_stats.dyson.power + ((Dyson_Network_Sphere[k] * v) * game.surfaces[surface].solar_power_multiplier)
			global.dyworld.game_stats.dyson_1[surface].power_total = global.dyworld.game_stats.dyson_1[surface].power_total + ((Dyson_Network_Sphere[k] * v) * game.surfaces[surface].solar_power_multiplier)
			global.dyworld.game_stats.dyson_1[surface].power = global.dyworld.game_stats.dyson_1[surface].power + ((Dyson_Network_Sphere[k] * v) * game.surfaces[surface].solar_power_multiplier)
			global.dyworld.game_stats.dyson_1[surface].structures = global.dyworld.game_stats.dyson_1[surface].structures + v
			global.dyworld.game_stats.dyson.structures = global.dyworld.game_stats.dyson.structures + v
		end
	end
	
	-- Mining Network --
	for k,v in pairs(contents) do
		if Space_Mining[k] then
			global.dyworld.game_stats.space_mining[Space_Mining[k].Ore].pure_rate = global.dyworld.game_stats.space_mining[Space_Mining[k].Ore].pure_rate + 0.05
			global.dyworld.game_stats.space_mining[Space_Mining[k].Ore].impure_rate = global.dyworld.game_stats.space_mining[Space_Mining[k].Ore].impure_rate + 0.45
		end
	end
end

--[[ 
/c 
function FIND()
local sur = serpent.block(remote.call("space-exploration", "get_zone_from_name", {zone_name = "nauvis"})) return sur.solar_power_multiplier end
game.player.print(FIND()) 

/c game.player.print(game.surfaces["Bolina"].solar_power_multiplier)


]]

function Event_on_sector_scanned(event)
		----- Story Objective Check -----
		Story_Objectives("sector-scan", event)
	
	----- Global counter -----
	if not global.dyworld.game_stats.sector_scanned then
		global.dyworld.game_stats.sector_scanned = 1
	else
		global.dyworld.game_stats.sector_scanned = global.dyworld.game_stats.sector_scanned + 1
	end
end