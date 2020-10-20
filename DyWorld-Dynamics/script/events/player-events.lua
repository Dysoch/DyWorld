


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
	game.players[id].force.disable_research()
	game.forces.player.auto_character_trash_slots = true
	game.forces.player.character_logistic_requests = true
	game.forces.player.character_trash_slot_count = 10
	if debugger then
		game.players[id].insert{name = "762mm-gun", count = 1}
		game.players[id].insert{name = "basic-762mm-turret", count = 1}
		game.players[id].insert{name = "762mm-bullet-ap", count = 5000}
		game.players[id].insert{name = "coal", count = 1000}
		game.players[id].insert{name = "storehouse-basic", count = 50}
		game.players[id].insert{name = "storehouse-passive-provider", count = 50}
		game.players[id].insert{name = "storehouse-requester", count = 50}
		game.players[id].insert{name = "storehouse-storage", count = 50}
		game.players[id].insert{name = "warehouse-basic", count = 50}
		game.players[id].insert{name = "warehouse-passive-provider", count = 50}
		game.players[id].insert{name = "warehouse-requester", count = 50}
		game.players[id].insert{name = "warehouse-storage", count = 50}
		game.players[id].insert{name = "basic-electric-drill", count = 50}
		game.players[id].insert{name = "radar-4", count = 50}
		game.players[id].insert{name = "roboport-3", count = 50}
		game.players[id].insert{name = "accumulator", count = 50}
		game.players[id].insert{name = "substation", count = 50}
		game.players[id].insert{name = "solar-panel", count = 50}
	end
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