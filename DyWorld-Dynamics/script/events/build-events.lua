

function Event_on_player_used_capsule(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.item.name
	local Time = global.dyworld.game_stats.time_stamp
	local P_Water = global.dyworld.players[id].water
	local P_Water_Max = global.dyworld.players[id].water_max
	local P_Food = global.dyworld.players[id].food
	local P_Food_Max = global.dyworld.players[id].food_max
	
	if Food_Values[name] then
		if Food_Values[name].Water then
			Water_Add(id, Food_Values[name].Water)
		end
		if Food_Values[name].Food then
			Food_Add(id, Food_Values[name].Food)
		end
		if Food_Values[name].Radiation then
			Add_Radiation(id, Food_Values[name].Radiation)
		end
	end
	
	----- Personal counter -----
	if not global.dyworld.players[id].capsules then global.dyworld.players[id].capsules = 0 end
	global.dyworld.players[id].capsules = global.dyworld.players[id].capsules + 1
	
	if not global.dyworld.players[id].implants then global.dyworld.players[id].implants = {} end
	if not global.dyworld.players[id].implants_used then global.dyworld.players[id].implants_used = 0 end
	if Implants[name] then
		global.dyworld.players[id].implants_used = global.dyworld.players[id].implants_used + 1
		Implant_Check(id, name)
	end
end

function Event_on_built_entity(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local entity = event.created_entity

	----- Personal counter -----
	global.dyworld.players[id].build = global.dyworld.players[id].build + 1
	global.dyworld.game_stats.build_amount = global.dyworld.game_stats.build_amount + 1

	_Event_on_force_added_entity(event, force, entity, 0.5)
end

function Event_on_player_built_tile(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local tile = event.tile
	
	----- Personal counter -----
	global.dyworld.players[id].build = global.dyworld.players[id].build + 1
	global.dyworld.game_stats.build_amount = global.dyworld.game_stats.build_amount + 1

	_Event_on_force_built_tile(event, force, tile, 0.025)
end

function Event_on_robot_built_entity(event)
	local robot = event.robot
	local force = robot.force
	local entity = event.created_entity

	_Event_on_force_added_entity(event, force, entity, 0.35)
end

function Event_on_robot_built_tile(event)
	local force = event.robot.force
	local tile = event.tile

	_Event_on_force_built_tile(event, force, tile, 0.05)
end

function Event_script_raised_built(event)
	--script.on_event(remote.call("space-exploration", "get_on_player_respawned_event"), Event_on_player_respawned_script)
	if global.dyworld_story and not global.dyworld.game_stats.story_pause then
		Story_Objectives("scripted-build", event)
		Story_Side_Objectives("build-2", event, 1)
	end
end

function Event_built_test(event)
	--[[if global.dyworld_story then
		Story_Objectives("scripted-build", event)
		Story_Side_Objectives("build-2", event, 1)
	end]]
	AllPlayersPrint(event.entity.name)
end

function Event_script_raised_revive(event)
	local force = nil
	local entity = event.entity

	_Event_on_force_added_entity(event, force, entity, 0.5)
end