



function Event_on_picked_up_item(event)
	local player = game.players[event.player_index]
	local force = player.force
	local name = event.item_stack.name
	local count = event.item_stack.count

end

function Event_on_player_mined_item(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.item_stack.name
	local count = event.item_stack.count
    
end

function Event_on_pre_player_mined_item(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.entity.name
	local type = event.entity.type
    
end

function Event_on_player_mined_entity(event)
	local player = game.players[event.player_index]
	local force = player.force
	local position = event.entity.position
	local type = event.entity.type
	local name = event.entity.name
    
end

function Event_on_robot_mined(event)

end