


function Event_on_player_crafted_item(event)
	local player = game.players[event.player_index]
	local force = player.force
	local name = event.item_stack.name
	local count = event.item_stack.count
	
	----- Global counter -----
	if not global.dyworld.game_stats.crafted_names[name] then
		global.dyworld.game_stats.crafted_names[name] = count
	else
		global.dyworld.game_stats.crafted_names[name] = global.dyworld.game_stats.crafted_names[name] + count
	end
end