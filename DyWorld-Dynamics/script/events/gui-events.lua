


function Event_on_gui_click(event)
	local id = event.player_index
	local player = game.players[id]
	local force = player.force
	local gui = event.element
	
	if gui.name == "dyworld_story" then
		if global.dyworld_story then
			if global.dyworld.players[id].story_gui then
				global.dyworld.players[id].story_gui = false
				Close_Story_GUI(player, id)
			else
				global.dyworld.players[id].story_gui = true
				Story_GUI(player, id)
			end
		end
	elseif gui.name == "dyworld_stats" then
        remote.call("informatron", "informatron_open_to_page", {player_index = id, page_name = "stats", interface = "DyWorld"})
	elseif gui.name == "dyworld_bonuses" then
        remote.call("informatron", "informatron_open_to_page", {player_index = id, page_name = "bonuses", interface = "DyWorld"})
	elseif gui.name == "dyworld_smn" then
        remote.call("informatron", "informatron_open_to_page", {player_index = id, page_name = "smn_0", interface = "DyWorld"})
	elseif gui.name == "dyworld_dyson" then
        remote.call("informatron", "informatron_open_to_page", {player_index = id, page_name = "dyson", interface = "DyWorld"})
	elseif gui.name == "dyworld_personal" then
		if global.dyworld.players[id].personal_gui then
			global.dyworld.players[id].personal_gui = false
			Close_Personal_GUI(player, id)
		else
			global.dyworld.players[id].personal_gui = true
			Personal_GUI(player, id)
		end
	elseif gui.name == "dyworld_phase_forward" then
		Phase_Forward()
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
end