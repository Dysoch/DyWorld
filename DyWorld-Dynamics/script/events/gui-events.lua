


function Event_on_gui_click(event)
	local id = event.player_index
	local player = game.players[id]
	local force = player.force
	local gui = event.element
	
	if gui.name == "dyworld_story" then
		if global.dyworld_story then
			--debug("Player "..id..": pressed DyWorld_Story")
			--Story_GUI(player, id)
			if global.dyworld.players[id].stats_gui then
				global.dyworld.players[id].stats_gui = false
				Close_Main_GUI(player, id)
			end
			if global.dyworld.players[id].smn_gui then
				global.dyworld.players[id].smn_gui = false
				Close_SMN_GUI(player, id)
			end
			if global.dyworld.players[id].story_gui then
				global.dyworld.players[id].story_gui = false
				Close_Story_GUI(player, id)
			else 
				global.dyworld.players[id].story_gui = true
				Story_GUI(player, id)
			end
		end
	elseif gui.name == "dyworld_stats" then
		if global.dyworld.players[id].story_gui then
			global.dyworld.players[id].story_gui = false
			Close_Story_GUI(player, id)
		end
		if global.dyworld.players[id].smn_gui then
			global.dyworld.players[id].smn_gui = false
			Close_SMN_GUI(player, id)
		end
		if global.dyworld.players[id].stats_gui then
			global.dyworld.players[id].stats_gui = false
			Close_Main_GUI(player, id)
		else 
			global.dyworld.players[id].stats_gui = true
			Main_GUI(player, id)
		end
	elseif gui.name == "dyworld_smn" then
		if global.dyworld.players[id].story_gui then
			global.dyworld.players[id].story_gui = false
			Close_Story_GUI(player, id)
		end
		if global.dyworld.players[id].stats_gui then
			global.dyworld.players[id].stats_gui = false
			Close_Main_GUI(player, id)
		end
		if global.dyworld.players[id].smn_gui then
			global.dyworld.players[id].smn_gui = false
			Close_SMN_GUI(player, id)
		else 
			global.dyworld.players[id].smn_gui = true
			SMN_GUI(player, id)
		end
	end
	
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
	--if gui.name == "button_yes_items" then
	
	if gui_name == "DyDs_Story_GUI" then
		global.dyworld.players[event.player_index].story_gui_index = gui_index
	end
	if gui_name == "DyDs_Main_GUI" then
		global.dyworld.players[event.player_index].stats_gui_index = gui_index
	end
	if gui_name == "DyDs_SMN_GUI" then
		global.dyworld.players[event.player_index].smn_gui_index = gui_index
	end
end