



function Event_on_chunk_generated(event)
    local Area_left_top = event.area.left_top
    local Area_right_bottom = event.area.right_bottom
	local surface = event.surface
	local surface_name = surface.name
    local Chunk_X = math.floor(event.position.x)
    local Chunk_Y = math.floor(event.position.y)
    
    if not global.dyworld.game.stats then global.dyworld.game.stats = {} end
    if not global.dyworld.game.counters then global.dyworld.game.counters = {} end

    if not global.dyworld.game.counters.chunks then
        global.dyworld.game.counters.chunks = 1
    else
        global.dyworld.game.counters.chunks = global.dyworld.game.counters.chunks +1
    end
end

function Event_on_research_finished(event)
	local research = event.research
	local name = research.name
    
    if not global.dyworld.game.stats then global.dyworld.game.stats = {} end
    if not global.dyworld.game.counters then global.dyworld.game.counters = {} end
    if not global.dyworld.game.stats.research then global.dyworld.game.stats.research = {} end

    if not global.dyworld.game.counters.research then
        global.dyworld.game.counters.research = 1
    else
        global.dyworld.game.counters.research = global.dyworld.game.counters.research + 1
    end

    if not global.dyworld.game.stats.research[name] then
        global.dyworld.game.stats.research[name] = {
            finished = true,
            time_finished = global.dyworld.time.log
        }
    end
end

function Event_on_character_corpse_expired(event)
    
    if not global.dyworld.game.stats then global.dyworld.game.stats = {} end
    if not global.dyworld.game.counters then global.dyworld.game.counters = {} end
end

function Event_on_rocket_launched(event)
    local rocket = event.rocket
    local surface = rocket.surface.name
    local inventory = rocket.get_inventory(1)
    local contents = inventory.get_contents()
    
    if not global.dyworld.game.stats then global.dyworld.game.stats = {} end
    if not global.dyworld.game.counters then global.dyworld.game.counters = {} end

    if not global.dyworld.game.counters.rocket then
        global.dyworld.game.counters.rocket = 1
    else
        global.dyworld.game.counters.rocket = global.dyworld.game.counters.rocket + 1
    end
end

function Event_on_sector_scanned(event)
	local surface_name = event.radar.surface.name
    local Chunk_X = math.floor(event.chunk_position.x)
    local Chunk_Y = math.floor(event.chunk_position.y)
    
    if not global.dyworld.game.stats then global.dyworld.game.stats = {} end
    if not global.dyworld.game.counters then global.dyworld.game.counters = {} end

    if not global.dyworld.game.counters.scanned then
        global.dyworld.game.counters.scanned = 1
    else
        global.dyworld.game.counters.scanned = global.dyworld.game.counters.scanned + 1
    end
end