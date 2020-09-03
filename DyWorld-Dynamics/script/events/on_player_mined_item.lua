


function Event_on_player_mined_item(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.item_stack.name
	local count = event.item_stack.count
	
	----- Global counter -----
	if not global.dyworld.game_stats.mined_names[name] then
		global.dyworld.game_stats.mined_names[name] = count
	else
		global.dyworld.game_stats.mined_names[name] = global.dyworld.game_stats.mined_names[name] + count
	end
	
	----- Personal counter -----
	global.dyworld.players[id].mined = global.dyworld.players[id].mined + count
	global.dyworld.game_stats.mined_amount = global.dyworld.game_stats.mined_amount + count
	
	----- Story Objective Check -----
	Story_Objectives("mining-item", event)
end
