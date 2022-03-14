
local CC = 100

function Event_on_picked_up_item(event)
	local player = game.players[event.player_index]
	local force = player.force
	local name = event.item_stack.name
	local count = event.item_stack.count
	--PlayerPrint("picked up item: "..name.." "..count.."x")
	
	----- Personal counter -----
	global.dyworld.players[event.player_index].picked = global.dyworld.players[event.player_index].picked + count
	global.dyworld.game_stats.picked_amount = global.dyworld.game_stats.picked_amount + count
end

function Event_on_player_mined_item(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.item_stack.name
	local count = event.item_stack.count
	
	----- Global counter -----
	if not global.dyworld.game_stats.mined_names[name] then
		global.dyworld.game_stats.mined_names[name] = (count >= CC and (math.floor(count/CC)) or count)
	else
		global.dyworld.game_stats.mined_names[name] = global.dyworld.game_stats.mined_names[name] + (count >= CC and (math.floor(count/CC)) or count)
	end
	
	if not global.dyworld.game_stats.mined then global.dyworld.game_stats.mined = {} end
	if not global.dyworld.game_stats.mined[name] then
		global.dyworld.game_stats.mined[name] = true
	end
	
	----- Personal counter -----
	global.dyworld.players[id].mined = global.dyworld.players[id].mined + (count >= CC and (math.floor(count/CC)) or count)
	global.dyworld.game_stats.mined_amount = global.dyworld.game_stats.mined_amount + (count >= CC and (math.floor(count/CC)) or count)
	
	if global.dyworld_story then
		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("mining-item", event)
		end
	end
end

function Event_on_pre_player_mined_item(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.entity.name
	local type = event.entity.type
	
	if global.dyworld_story then
		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("pre-mining-item", event)
		end
	end
end

function _Event_on_force_mined_entity(event, force, entity)
	local name = entity.name

	----- Global Stats -----

	global.dyworld.game_stats.mined_amount = global.dyworld.game_stats.mined_amount + 1
	if not global.dyworld.game_stats.mined then global.dyworld.game_stats.mined = {} end
	if not global.dyworld.game_stats.mined[name] then
		global.dyworld.game_stats.mined[name] = true
	end

	_Event_on_force_removed_entity(event, force, entity)
end

function Event_on_player_mined_entity(event)
	local player = game.players[event.player_index]
	local force = player.force
	local entity = event.entity
	
	_Event_on_force_mined_entity(event, force, entity)
end

function Event_on_robot_mined_entity(event, entity)
	local robot = event.robot
	local force = robot.force
	local entity = event.entity
	
	_Event_on_force_mined_entity(event, force, entity)
end

function Event_on_robot_mined(event)

end
