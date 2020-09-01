


function Event_on_player_created(event)
	local player = game.players[event.player_index]
	local id = event.player_index
	local force = player.force.name
	local name = player.name
	global.dyworld.players[id] = {
		playerinfo = player,
		force = force,
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
	}
end