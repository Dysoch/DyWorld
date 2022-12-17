

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
    
end

function Event_on_player_died(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	
end

function Event_on_pre_player_died(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
    
end

function Event_on_player_joined_game(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
    
end

function Event_on_player_left_game(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
    
end

function Event_on_player_respawned(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
    
end

function Event_on_player_respawned_script(event)
	local id = event.player_index
    
end