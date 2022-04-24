


function Event_on_player_crafted_item(event)
	if not game.players[event.player_index].cheat_mode then
		local player = game.players[event.player_index]
		local force = player.force
		local id = event.player_index
		local name = event.item_stack.name
		local count = event.item_stack.count
		
		----- Global counter -----
		if not global.dyworld.game_stats.crafted_names[name] then
			global.dyworld.game_stats.crafted_names[name] = count
		else
			global.dyworld.game_stats.crafted_names[name] = global.dyworld.game_stats.crafted_names[name] + count
		end
		
		----- Personal counter -----
		global.dyworld.players[id].crafted = global.dyworld.players[id].crafted + count
		global.dyworld.players[id].xp = global.dyworld.players[id].xp + (count * 0.1)
		global.dyworld.game_stats.crafted_amount = global.dyworld.game_stats.crafted_amount + count
		
		if global.dyworld_story and not global.dyworld.game_stats.story_pause then
			----- Story Objective Check -----
			Story_Objectives("crafting", event)
		end
	end
end