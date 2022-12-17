
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
    
end

function Event_on_research_finished(event)
	local Time = global.dyworld.game_stats.time_stamp
	local research = event.research
	local name = research.name
    
end

function Event_on_character_corpse_expired(event)
    
end

function Event_on_rocket_launched(event)
    local rocket = event.rocket
    local surface = rocket.surface.name
    local inventory = rocket.get_inventory(1)
    local contents = inventory.get_contents()
    
end

function Event_on_sector_scanned(event)
	local surface_name = event.radar.surface.name
    local Chunk_X = math.floor(event.chunk_position.x)
    local Chunk_Y = math.floor(event.chunk_position.y)
    
end