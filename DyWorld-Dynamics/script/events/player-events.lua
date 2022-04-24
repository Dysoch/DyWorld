

function Event_on_raised_revive(event)
	--local id = event.player_index
	--local entity = event.entity
	
end

function Event_script_raised_destroy(event)
	--local id = event.player_index
	--local entity = event.entity
	
end

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
		surface = "nauvis",
		crafted = 0,
		mined = 0,
		build = 0,
		killed = 0,
		picked = 0,
		posx = 0,
		posy = 0,
		posx2 = 0,
		posy2 = 0,
		distance = 0,
		distance_car = 0,
		distance_train = 0,
		food = Food_Start,
		food_max = Food_Start,
		food_rate = 0.33,
		food_mess_1 = false,
		food_mess_2 = false,
		food_mess_3 = false,
		food_mess_4 = false,
		water = Water_Start,
		water_max = Water_Start,
		water_rate = 1.25,
		water_mess_1 = false,
		water_mess_2 = false,
		water_mess_3 = false,
		water_mess_4 = false,
		death_reduce = 0,
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
		personal_gui = false,
	}
	global.dyworld.game_stats.players = global.dyworld.game_stats.players + 1
	if global.dyworld_story then
        
	else
		Reunlock_Recipes()
	end
	game.forces.player.character_logistic_requests = true
	game.forces.player.character_trash_slot_count = 20
	Dy_update_overhead_buttons(player)
end

function Event_on_player_died(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	
	global.dyworld.players[id].alive = false
	
end

function Event_on_pre_player_died(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	
	global.dyworld.players[id].alive = true
	if not global.dyworld.players[id].died then global.dyworld.players[id].died = 0 end
	if not global.dyworld.players[id].survival then global.dyworld.players[id].survival = {} end
	if not global.dyworld.players[id].survival["constitution"] then global.dyworld.players[id].survival["constitution"] = 0 end
	if not global.dyworld.players[id].death_reduce then global.dyworld.players[id].death_reduce = 0 end
	global.dyworld.players[id].died = global.dyworld.players[id].died + 1
	global.dyworld.players[id].rads.stored = 0
	
	Difficulty_Change("-", 250)
	
	global.dyworld.players[id].water_max = Water_Start
	global.dyworld.players[id].food_max = Food_Start
	--Implant_Check(id, nil, true)
	global.dyworld.players[id].water_rate = 1.25
	global.dyworld.players[id].food_rate = 0.33
	global.dyworld.players[id].water = global.dyworld.players[id].water_max
	global.dyworld.players[id].food = global.dyworld.players[id].food_max
	global.dyworld.players[id].food_mess_1 = false
	global.dyworld.players[id].food_mess_2 = false
	global.dyworld.players[id].food_mess_3 = false
	global.dyworld.players[id].food_mess_4 = false
	global.dyworld.players[id].water_mess_1 = false
	global.dyworld.players[id].water_mess_2 = false
	global.dyworld.players[id].water_mess_3 = false
	global.dyworld.players[id].water_mess_4 = false
	Bonuses(id)
	Dy_update_overhead_buttons(player)
end

function Event_on_player_joined_game(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	
	if not global.dyworld.players[id].alive then
		global.dyworld.players[id].alive = true
		global.dyworld.players[id].playing = true
	end
end

function Event_on_player_left_game(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	
	global.dyworld.players[id].playing = false
	global.dyworld.players[id].alive = false
end

function Event_on_player_respawned(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	
	if not global.dyworld.players[id].alive then
		global.dyworld.players[id].alive = true
	end
end

function Event_on_player_respawned_script(event)
	local id = event.player_index
	
	if not global.dyworld.players[id].alive then
		global.dyworld.players[id].alive = true
	end
end