


function Event_on_chunk_generated(event)
	
	----- Global counter -----
	if not global.dyworld.game_stats.chunks then
		global.dyworld.game_stats.chunks = 1
	else
		global.dyworld.game_stats.chunks = global.dyworld.game_stats.chunks + 1
	end
end

function Event_on_research_finished(event)
	----- Story Objective Check -----
	Story_Objectives("research", event)
end

function Event_on_character_corpse_expired(event)
	----- Story Objective Check -----
	Story_Objectives("corpse-player", event)
end

function Event_on_rocket_launched(event)
	
end

function Event_on_sector_scanned(event)
	
	----- Global counter -----
	if not global.dyworld.game_stats.sector_scanned then
		global.dyworld.game_stats.sector_scanned = 1
	else
		global.dyworld.game_stats.sector_scanned = global.dyworld.game_stats.sector_scanned + 1
	end
end