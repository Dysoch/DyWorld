
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

local function Check_Tile(Tile)
	if Tile.name == "se-space" then return false
	elseif Tile.name == "se-asteroid" then return false
	elseif Tile.name == "se-regolith" then return false
	elseif Tile.name == "se-spaceship-floor" then return false
	elseif Tile.name == "out-of-map" then return false
	else return true
	end
end

function Event_on_chunk_generated(event)
    local Area_left_top = event.area.left_top
    local Area_right_bottom = event.area.right_bottom
	local surface = event.surface
	local surface_name = surface.name
    local Chunk_X = math.floor(event.position.x)
    local Chunk_Y = math.floor(event.position.y)

    -- Setup Chunk Properties
    if not global.dyworld.game_stats.chunks_info then global.dyworld.game_stats.chunks_info = {} end
    if not global.dyworld.game_stats.chunks_info[surface_name] then global.dyworld.game_stats.chunks_info[surface_name] = {} end
    if not global.dyworld.game_stats.chunks_info[surface_name][Chunk_X..":"..Chunk_Y] then
        local check = game.surfaces[surface_name].find_tiles_filtered{area = event.area}
        global.dyworld.game_stats.chunks_info[surface_name][Chunk_X..":"..Chunk_Y] = {
            Temperature_Standard = Dy_Check_Terrain_Temp_Chunk(check),
            Temperature = 0,
            Pollution = 0,
            Radiation = Dy_Check_Terrain_Radiation_Chunk(check),
        }
    end

	-- Story Objective Check
	if not global.dyworld.game_stats.story_pause then
		Story_Objectives("chunk-gen", event)
	end
	
	-- Global counter
	if not global.dyworld.game_stats.chunks then
		global.dyworld.game_stats.chunks = 1
	else
		global.dyworld.game_stats.chunks = global.dyworld.game_stats.chunks + 1
	end
	
	-- Remove Resources
	local Resources = {
		["stone"] = {"everywhere"},
		["quartzite"] = {"nauvis"},
		["granite"] = {"nauvis"},
		["sandstone"] = {"nauvis"},
		["iron-ore"] = {"everywhere"},
		["iron-ore-2"] = {"nauvis"},
		["iron-ore-3"] = {"nauvis"},
		["copper-ore"] = {"everywhere"},
		["copper-ore-2"] = {"nauvis"},
		["copper-ore-3"] = {"nauvis"},
		["tin-ore-1"] = {"everywhere"},
		["tin-ore-2"] = {"nauvis"},
		["tin-ore-3"] = {"nauvis"},
		["uranium-ore"] = {"nauvis"},
		["treefarm"] = {"nauvis"},
		["coal"] = {"everywhere"},
		["coal-2"] = {"nauvis"},
		["coal-3"] = {"nauvis"},
		["natural-gas"] = {"nauvis"},
		["crude-oil"] = {"nauvis"},
	}
	local size = 50

	for _, e in pairs(surface.find_entities_filtered{area = event.area, type = "resource"}) do 
		if Resources[e.name] then
			local amount = 0
			for _, Surface_N in pairs(Resources[e.name]) do
				if surface_name == Surface_N then
					amount = amount + 1
				end
				if Surface_N == "everywhere" then
					amount = amount + 1
				end
				if Surface_N == "nowhere" then
					amount = amount - 100
				end
			end
			if amount <= 0 then
				e.destroy() 
			end
		end
	end
	
	-- Generate Enemies -- 
	if not global.dyworld.game_stats.enemy_1_chunk then global.dyworld.game_stats.enemy_1_chunk = 1000 end
	if not global.dyworld.game_stats.enemy_2_chunk then global.dyworld.game_stats.enemy_2_chunk = 2000 end
	if not global.dyworld.game_stats.enemy_3_chunk then global.dyworld.game_stats.enemy_3_chunk = 4000 end
	if not global.dyworld.game_stats.enemy_4_chunk then global.dyworld.game_stats.enemy_4_chunk = 6000 end
	if not global.dyworld.game_stats.enemy_5_chunk then global.dyworld.game_stats.enemy_5_chunk = 10000 end
	if not global.dyworld.game_stats.wave_spawners then global.dyworld.game_stats.wave_spawners = {} end
	if not global.dyworld.game_stats.wave_spawners[surface_name] then global.dyworld.game_stats.wave_spawners[surface_name] = {spawners_amount = 0, spawners_loc = {}} end
	if not global.dyworld.game_stats.wave_spawners.max_per_surface then global.dyworld.game_stats.wave_spawners.max_per_surface = 10 end
	
	if surface_name ~= "starmap-1" then
		if (surface_name == "nauvis" and global.dyworld.game_stats.chunks >= 200) then
			BuildEntity = "dy-wave-spawner"
			PosX = event.area.left_top.x + math.random(-159,159)
			PosY = event.area.left_top.y + math.random(-159,159)
			if game.surfaces[surface_name].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then
				if math.random(1,400) == 50 then --0.25% chance
					if global.dyworld.game_stats.wave_spawners[surface_name].spawners_amount < global.dyworld.game_stats.wave_spawners.max_per_surface then
						game.surfaces[surface_name].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.enemy}
						global.dyworld.game_stats.wave_spawners[surface_name].spawners_amount = global.dyworld.game_stats.wave_spawners[surface_name].spawners_amount + 1
						local BuildingTable = {posx = PosX, posy = PosY}
						table.insert(global.dyworld.game_stats.wave_spawners[surface_name].spawners_loc, BuildingTable)
						debug("Spawned "..BuildEntity.." at [gps="..PosX..","..PosY..","..surface_name.."] (dy-wave-spawner)")
					end
				end
			end
		end
		if global.dyworld.game_stats.chunks >= global.dyworld.game_stats.enemy_1_chunk and not Dy_Find_Str(surface_name, "Orbit") then
			BuildEntity = "dyworld-base-1"
			PosX = event.area.left_top.x + math.random(-63,63)
			PosY = event.area.left_top.y + math.random(-63,63)
			if game.surfaces[surface_name].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then
				game.surfaces[surface_name].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.enemy}
				global.dyworld.game_stats.enemy_1_chunk = global.dyworld.game_stats.enemy_1_chunk + 100
				debug("Spawned "..BuildEntity.." at [gps="..PosX..","..PosY..","..surface_name.."] (Spawner 1)")
			end
		end
		if global.dyworld.game_stats.chunks >= global.dyworld.game_stats.enemy_2_chunk and surface_name ~= "nauvis" and not Dy_Find_Str(surface_name, "Orbit") then
			BuildEntity = "dyworld-base-2"
			PosX = event.area.left_top.x + math.random(-63,63)
			PosY = event.area.left_top.y + math.random(-63,63)
			if game.surfaces[surface_name].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then
				game.surfaces[surface_name].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.enemy}
				global.dyworld.game_stats.enemy_2_chunk = global.dyworld.game_stats.enemy_2_chunk + 200
				debug("Spawned "..BuildEntity.." at [gps="..PosX..","..PosY..","..surface_name.."] (Spawner 2)")
			end
		end
		if global.dyworld.game_stats.chunks >= global.dyworld.game_stats.enemy_3_chunk and surface_name ~= "nauvis" and not Dy_Find_Str(surface_name, "Orbit") then
			BuildEntity = "dyworld-base-3"
			PosX = event.area.left_top.x + math.random(-63,63)
			PosY = event.area.left_top.y + math.random(-63,63)
			if game.surfaces[surface_name].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then
				game.surfaces[surface_name].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.enemy}
				global.dyworld.game_stats.enemy_3_chunk = global.dyworld.game_stats.enemy_3_chunk + 400
				debug("Spawned "..BuildEntity.." at [gps="..PosX..","..PosY..","..surface_name.."] (Spawner 3)")
			end
		end
		if global.dyworld.game_stats.chunks >= global.dyworld.game_stats.enemy_4_chunk and surface_name ~= "nauvis" and not Dy_Find_Str(surface_name, "Orbit") then
			BuildEntity = "dyworld-base-4"
			PosX = event.area.left_top.x + math.random(-63,63)
			PosY = event.area.left_top.y + math.random(-63,63)
			if game.surfaces[surface_name].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then
				game.surfaces[surface_name].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.enemy}
				global.dyworld.game_stats.enemy_4_chunk = global.dyworld.game_stats.enemy_4_chunk + 800
				debug("Spawned "..BuildEntity.." at [gps="..PosX..","..PosY..","..surface_name.."] (Spawner 4)")
			end
		end
		if global.dyworld.game_stats.chunks >= global.dyworld.game_stats.enemy_5_chunk and surface_name ~= "nauvis" and not Dy_Find_Str(surface_name, "Orbit") then
			BuildEntity = "dyworld-base-5"
			PosX = event.area.left_top.x + math.random(-63,63)
			PosY = event.area.left_top.y + math.random(-63,63)
			if game.surfaces[surface_name].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then
				game.surfaces[surface_name].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.enemy}
				global.dyworld.game_stats.enemy_5_chunk = global.dyworld.game_stats.enemy_5_chunk + 1600
				debug("Spawned "..BuildEntity.." at [gps="..PosX..","..PosY..","..surface_name.."] (Spawner 5)")
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
				if game.surfaces[surface_name].can_place_entity{name=(BuildEntity), position={PosX,PosY}} and Check_Tile(game.surfaces[surface_name].get_tile(PosX, PosY)) then
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
				if game.surfaces[surface_name].can_place_entity{name=(BuildEntity), position={PosX,PosY}} and Check_Tile(game.surfaces[surface_name].get_tile(PosX, PosY)) then
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
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("research", event)
		end
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
		global.dyworld.game_stats.space_mining = {}
		for k,v in pairs(Space_Mining) do
			global.dyworld.game_stats.space_mining[v.Ore] = {efficiency = 1, pure_rate = debugger and 5 or 0, pure_mined = 0, pure_storage = 100, impure_rate = debugger and 45 or 0, impure_mined = 0, impure_storage = 900, tier = v.Tier}
		end
	end
	if Dy_Find_Str(name, "space-mining-storage-") then
		for k,v in pairs(Dy_Metals) do
			if Dy_Find_Str(name, k) then
			local Type = k
				global.dyworld.game_stats.space_mining[Type].pure_storage = global.dyworld.game_stats.space_mining[Type].pure_storage * 2
				global.dyworld.game_stats.space_mining[Type].impure_storage = global.dyworld.game_stats.space_mining[Type].impure_storage * 2
			end
		end
	end
	if Dy_Find_Str(name, "space-mining-efficiency-") then
		for k,v in pairs(Dy_Metals) do
			if Dy_Find_Str(name, k) then
			local Type = k
				global.dyworld.game_stats.space_mining[Type].efficiency = global.dyworld.game_stats.space_mining[Type].efficiency + 0.05
			end
		end
	end

    if global.dyworld.game_stats.inserters then
        InserterCheck(global.dyworld.game_stats.inserters)
    end
end

function Event_on_character_corpse_expired(event)
	if global.dyworld_story then
		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("corpse-player", event)
		end
	end
end

function Event_on_rocket_launched(event)
    local rocket = event.rocket
    local surface = rocket.surface.name
    local inventory = rocket.get_inventory(1)
    local contents = inventory.get_contents()
		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("launch-rocket", event)
			Story_Side_Objectives("rocket", event, 1)
			for k,v in pairs(contents) do
				Story_Side_Objectives("satellite", event, v, k)
			end
		end
	
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
		if Dy_Find_Str(k, "asteroid-miner-") then
			for Name,Table in pairs(Space_Mining) do
				if Dy_Find_Str(k, Table.Ore) then
					global.dyworld.game_stats.space_mining[Table.Ore].pure_rate = global.dyworld.game_stats.space_mining[Table.Ore].pure_rate + ((Table.Amount * 0.1) * v)
					global.dyworld.game_stats.space_mining[Table.Ore].impure_rate = global.dyworld.game_stats.space_mining[Table.Ore].impure_rate + ((Table.Amount * 0.9) * v)
				end
			end
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
	local surface_name = event.radar.surface.name
    local Chunk_X = math.floor(event.chunk_position.x)
    local Chunk_Y = math.floor(event.chunk_position.y)
	
		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("sector-scan", event)
			Story_Side_Objectives("scanning", event, 1)
		end
	
	----- Global counter -----
	if not global.dyworld.game_stats.sector_scanned then
		global.dyworld.game_stats.sector_scanned = 1
	else
		global.dyworld.game_stats.sector_scanned = global.dyworld.game_stats.sector_scanned + 1
	end
	
    -- Setup Chunk Properties
    if not global.dyworld.game_stats.chunks_info then global.dyworld.game_stats.chunks_info = {} end
    if not global.dyworld.game_stats.chunks_info[surface_name] then global.dyworld.game_stats.chunks_info[surface_name] = {} end
    if not global.dyworld.game_stats.chunks_info[surface_name][Chunk_X..":"..Chunk_Y] then
        local check = game.surfaces[surface_name].find_tiles_filtered{area = event.area}
        global.dyworld.game_stats.chunks_info[surface_name][Chunk_X..":"..Chunk_Y] = {
            Temperature_Standard = Dy_Check_Terrain_Temp_Chunk(check),
            Temperature = 0,
            Pollution = 0,
            Radiation = Dy_Check_Terrain_Radiation_Chunk(check),
        }
	else
        local check = game.surfaces[surface_name].find_tiles_filtered{area = event.area}
        global.dyworld.game_stats.chunks_info[surface_name][Chunk_X..":"..Chunk_Y] = {
            Temperature_Standard = Dy_Check_Terrain_Temp_Chunk(check),
            Temperature = 0,
            Pollution = 0,
            Radiation = Dy_Check_Terrain_Radiation_Chunk(check),
        }
    end
end