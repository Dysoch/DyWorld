mod_gui = require("__core__/lualib/mod-gui")

function Dy_update_overhead_buttons(player)
	local button_flow = mod_gui.get_button_flow(player)
	if button_flow["dyworld_story"] then
		button_flow["dyworld_story"].destroy()
	end
	button_flow.add{type = "sprite-button", name = "dyworld_story", sprite = "virtual-signal/dyworld_story_button", tooltip = {"looped-name.dyworld_story_button"}}
	if button_flow["dyworld_stats"] then
		button_flow["dyworld_stats"].destroy()
	end
	button_flow.add{type = "sprite-button", name = "dyworld_stats", sprite = "virtual-signal/dyworld_stats_button", tooltip = {"looped-name.dyworld_stats_button"}}
	if button_flow["dyworld_smn"] then
		button_flow["dyworld_smn"].destroy()
	end
	button_flow.add{type = "sprite-button", name = "dyworld_smn", sprite = "item/satellite", tooltip = {"looped-name.dyworld_smn_button"}}
	if button_flow["dyworld_phase_forward"] then
		button_flow["dyworld_phase_forward"].destroy()
	end
	if debugger then
		button_flow.add{type = "sprite-button", name = "dyworld_phase_forward", sprite = "item/satellite", tooltip = {"looped-name.dyworld_smn_button"}}
	end
end

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
	}
	global.dyworld.game_stats.players = global.dyworld.game_stats.players + 1
	if global.dyworld_story then
		game.players[id].force.disable_research()
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
	Dy_update_overhead_buttons(player)
	
end

function Event_on_pre_player_died(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	
	global.dyworld.players[id].alive = false
	if not global.dyworld.players[id].died then global.dyworld.players[id].died = 0 end
	if not global.dyworld.players[id].survival then global.dyworld.players[id].survival = {} end
	if not global.dyworld.players[id].survival["constitution"] then global.dyworld.players[id].survival["constitution"] = 0 end
	if not global.dyworld.players[id].death_reduce then global.dyworld.players[id].death_reduce = 0 end
	global.dyworld.players[id].died = global.dyworld.players[id].died + 1
	
	Difficulty_Change("-", 250)
	
	if global.dyworld.players[id].death_reduce == 0 then 
		global.dyworld.players[id].water_max = Water_Start
		global.dyworld.players[id].food_max = Food_Start
		Implant_Check(id, nil, true)
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
		global.dyworld.players[id].crafted = 0
		global.dyworld.players[id].mined = 0
		global.dyworld.players[id].build = 0
		global.dyworld.players[id].killed = 0
		global.dyworld.players[id].picked = 0
		global.dyworld.players[id].distance = 0
		global.dyworld.players[id].distance_car = 0
		global.dyworld.players[id].distance_train = 0
		global.dyworld.players[id].survival["constitution"] = 0
		Bonuses(id)
	elseif global.dyworld.players[id].death_reduce == 1 then 
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
	else
		local Death = global.dyworld.players[id].death_reduce
		global.dyworld.players[id].water_max = math.max(Round((global.dyworld.players[id].water_max * Death), 0), Water_Start)
		global.dyworld.players[id].food_max = math.max(Round((global.dyworld.players[id].food_max * Death), 0), Food_Start)
		Implant_Check(id, nil, true)
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
		global.dyworld.players[id].survival["constitution"] = Round((global.dyworld.players[id].survival["constitution"] * Death), 0)
		global.dyworld.players[id].crafted = Round((global.dyworld.players[id].crafted * Death), 0)
		global.dyworld.players[id].mined = Round((global.dyworld.players[id].mined * Death), 0)
		global.dyworld.players[id].build = Round((global.dyworld.players[id].build * Death), 0)
		global.dyworld.players[id].killed = Round((global.dyworld.players[id].killed * Death), 0)
		global.dyworld.players[id].picked = Round((global.dyworld.players[id].picked * Death), 0)
		global.dyworld.players[id].distance = Round((global.dyworld.players[id].distance * Death), 2)
		global.dyworld.players[id].distance_car = Round((global.dyworld.players[id].distance_car * Death), 2)
		global.dyworld.players[id].distance_train = Round((global.dyworld.players[id].distance_train * Death), 2)
		Bonuses(id)
	end
	Dy_update_overhead_buttons(player)
end

function Event_on_player_joined_game(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	
	global.dyworld.players[id].playing = true
	global.dyworld.players[id].alive = true
	Dy_update_overhead_buttons(player)
	
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
	
	global.dyworld.players[id].alive = true
	global.dyworld.players[id].strength = 0
	global.dyworld.players[id].constitution = 0
	global.dyworld.players[id].dexterity = 0
	global.dyworld.players[id].intelligence = 0
	global.dyworld.players[id].wisdom = 0
	global.dyworld.players[id].charisma = 0
	global.dyworld.players[id].crafted = 0
	global.dyworld.players[id].mined = 0
	global.dyworld.players[id].build = 0
	global.dyworld.players[id].killed = 0
	global.dyworld.players[id].picked = 0
	global.dyworld.players[id].distance = 0
	global.dyworld.players[id].distance_car = 0
	global.dyworld.players[id].distance_train = 0
	Dy_update_overhead_buttons(player)
end

function Event_on_player_respawned_script(event)
	local id = event.player_index
	
	if not global.dyworld.players[id].alive then
		global.dyworld.players[id].alive = true
	end
end