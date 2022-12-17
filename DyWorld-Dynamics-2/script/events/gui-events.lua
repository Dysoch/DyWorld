



function Event_on_gui_click(event)
	local id = event.player_index
	local player = game.players[id]
	local force = player.force
	local gui = event.element

end

function Event_on_gui_closed(event)

end

function Event_on_gui_elem_changed(event)

end

function Event_on_gui_location_changed(event)

end

function Event_on_gui_opened(event)

end

function Event_on_gui_selected_tab_changed(event)
	local player = game.players[event.player_index]
	local force = player.force
	local gui_name = event.element.name
	local gui_index = event.element.selected_tab_index
	local gui_tab_name = event.element.selected_index

end