


function Event_on_chunk_generated(event)
	
	----- Global counter -----
	if not global.dyworld.game_stats.chunks then
		global.dyworld.game_stats.chunks = 1
	else
		global.dyworld.game_stats.chunks = global.dyworld.game_stats.chunks + 1
	end
end

function Event_on_research_finished(event)
	local Time = global.dyworld.game_stats.time_stamp
	if global.dyworld_story then
		----- Story Objective Check -----
		Story_Objectives("research", event)
	end
	if not global.dyworld.research_done[event.name] then
		table.insert(global.dyworld.research_done, event.name)
		debug("Researched: "..event.name)
	end
end

function Event_on_character_corpse_expired(event)
	if global.dyworld_story then
		----- Story Objective Check -----
		Story_Objectives("corpse-player", event)
	end
end

function Event_on_rocket_launched(event)
	
	----- Global counter -----
	if not global.dyworld.game_stats.rockets_launched then
		global.dyworld.game_stats.rockets_launched = 1
	else
		global.dyworld.game_stats.rockets_launched = global.dyworld.game_stats.rockets_launched + 1
	end
	
end

function Event_on_sector_scanned(event)
	
	----- Global counter -----
	if not global.dyworld.game_stats.sector_scanned then
		global.dyworld.game_stats.sector_scanned = 1
	else
		global.dyworld.game_stats.sector_scanned = global.dyworld.game_stats.sector_scanned + 1
	end
end