


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
	if not global.dyworld.research_done[event.research.name] then
		table.insert(global.dyworld.research_done, event.research.name)
		debug("Researched: "..event.research.name)
	end
	if not global.dyworld.game_stats.research then global.dyworld.game_stats.research = 0 end
	global.dyworld.game_stats.research = global.dyworld.game_stats.research + 1
end

function Event_on_character_corpse_expired(event)
	if global.dyworld_story then
		----- Story Objective Check -----
		Story_Objectives("corpse-player", event)
	end
end

function Event_on_rocket_launched(event)
		----- Story Objective Check -----
		Story_Objectives("launch-rocket", event)
	
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