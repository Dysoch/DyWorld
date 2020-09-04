


function Event_on_gui_click(event)
	local player = game.players[event.player_index]
	local force = player.force
	local gui = event.element
	--if gui.name == "button_yes_items" then
	
end

function Event_on_gui_selected_tab_changed(event)
	local player = game.players[event.player_index]
	local force = player.force
	local gui_name = event.element.name
	local gui_index = event.element.selected_tab_index
	local gui_tab_name = event.element.selected_index
	--if gui.name == "button_yes_items" then
	
	if gui_name == "DyDs_Story_GUI" then
		global.dyworld.players[event.player_index].story_gui_index = gui_index
		--PlayerPrint(gui_name)
		--PlayerPrint(gui_index)
		--PlayerPrint(gui_tab_name)
	end
	if gui_name == "DyDs_Main_GUI" then
		global.dyworld.players[event.player_index].stats_gui_index = gui_index
		--PlayerPrint(gui_name)
		--PlayerPrint(gui_index)
		--PlayerPrint(gui_tab_name)
	end
end