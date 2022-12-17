



function Event_on_player_used_capsule(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.item.name

end

function Event_on_built_entity(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.created_entity.name
	local position = event.created_entity.position
	local type = event.created_entity.type

end

function Event_on_player_built_tile(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.tile.name

end

function Event_on_robot_built_entity(event)
	--local player = game.players[event.player_index]
	--local force = player.force
	--local id = event.player_index
	local name = event.created_entity.name
	local position = event.created_entity.position
	local surface = event.created_entity.surface.name
	local type = event.created_entity.type

end

function Event_on_robot_built_tile(event)
	local name = event.tile.name

end

function Event_script_raised_built(event)

end

function Event_built_test(event)

end

function Event_script_raised_revive(event)
	local name = event.entity.name
	local position = event.entity.position
	local type = event.entity.type

end