


function Event_on_player_changed_force(event)
	local player = game.players[event.player_index]
	local force = player.force
	
end

function Event_on_player_created(event)
	local player = game.players[event.player_index]
	local id = event.player_index
	local force = player.force.name
	local name = player.name
	global.dyworld.players[id] = {
		playerinfo = player,
		force = force,
		id = id,
		name = name,
		crafted = 0,
		mined = 0,
		build = 0,
		killed = 0,
		posx = 0,
		posy = 0,
		xp = 0,
		xp_levelup = (100 + math.random(100)),
		level = 1,
		alive = true,
		playing = true,
		story_gui = false,
		story_gui_index = 1,
		stats_gui = false,
		stats_gui_index = 1,
		log_gui = false,
		log_gui_index = 1,
	}
	global.dyworld.game_stats.players = global.dyworld.game_stats.players + 1
	if global.dyworld_story then
		game.players[id].force.disable_research()
	else
		Reunlock_Recipes()
	end
	game.forces.player.auto_character_trash_slots = true
	game.forces.player.character_logistic_requests = true
	game.forces.player.character_trash_slot_count = 10
end

function Event_on_player_died(event)
	local player = game.players[event.player_index]
	local force = player.force
	
end

function Event_on_player_joined_game(event)
	local player = game.players[event.player_index]
	local force = player.force
	
end

function Event_on_player_left_game(event)
	local player = game.players[event.player_index]
	local force = player.force
	
end

function Event_on_player_respawned(event)
	local player = game.players[event.player_index]
	local force = player.force
	
end