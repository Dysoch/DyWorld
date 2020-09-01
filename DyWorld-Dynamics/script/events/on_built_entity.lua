


function Event_on_built_entity(event)
	local player = game.players[event.player_index]
	local force = player.force
	local name = event.created_entity.name
	local type = event.created_entity.type
	
	----- Global counter -----
	if not global.dyworld.game_stats.build_names[name] then
		global.dyworld.game_stats.build_names[name] = 1
	else
		global.dyworld.game_stats.build_names[name] = global.dyworld.game_stats.build_names[name] + 1
	end
end