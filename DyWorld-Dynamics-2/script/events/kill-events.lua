



function Event_on_entity_died(event)
	local force = event.force  -- force that kill
	local killer = event.cause -- cause of the kill
	local type_killed = event.entity.type
	local name = event.entity.name
	local position = event.entity.position

end