
script.on_event("DyWorld_Menu", function(event)
local id = event.player_index
local player = game.players[id]
	--debug("Player "..id..": pressed DyWorld_Menu")
	--Main_GUI(player, id)
	if global.dyworld.players[id].story_gui then
		global.dyworld.players[id].story_gui = false
		Close_Story_GUI(player, id)
	end
	if global.dyworld.players[id].log_gui then
		global.dyworld.players[id].log_gui = false
		Close_Log_GUI(player, id)
	end
	if global.dyworld.players[id].stats_gui then
		global.dyworld.players[id].stats_gui = false
		Close_Main_GUI(player, id)
	else 
		global.dyworld.players[id].stats_gui = true
		Main_GUI(player, id)
	end
end)

script.on_event("DyWorld_Story", function(event)
local id = event.player_index
local player = game.players[id]
	if global.dyworld_story then
		--debug("Player "..id..": pressed DyWorld_Story")
		--Story_GUI(player, id)
		if global.dyworld.players[id].stats_gui then
			global.dyworld.players[id].stats_gui = false
			Close_Main_GUI(player, id)
		end
		if global.dyworld.players[id].log_gui then
			global.dyworld.players[id].log_gui = false
			Close_Log_GUI(player, id)
		end
		if global.dyworld.players[id].story_gui then
			global.dyworld.players[id].story_gui = false
			Close_Story_GUI(player, id)
		else 
			global.dyworld.players[id].story_gui = true
			Story_GUI(player, id)
		end
	end
end)

script.on_event("DyWorld_Log", function(event)
local id = event.player_index
local player = game.players[id]
	--debug("Player "..id..": pressed DyWorld_Log")
	--Log_GUI(player, id)
	if global.dyworld.players[id].stats_gui then
		global.dyworld.players[id].stats_gui = false
		Close_Main_GUI(player, id)
	end
	if global.dyworld.players[id].story_gui then
		global.dyworld.players[id].story_gui = false
		Close_Story_GUI(player, id)
	end
	if global.dyworld.players[id].log_gui then
		global.dyworld.players[id].log_gui = false
		Close_Log_GUI(player, id)
	else 
		global.dyworld.players[id].log_gui = true
		Log_GUI(player, id)
	end
end)

script.on_event("DyWorld_rotate_inserter_pickup", function(event)
	local selection = game.players[event.player_index].selected
	if selection and (selection.type == "inserter" or (selection.type == "entity-ghost" and selection.ghost_type == "inserter")) then
		RotatePickup(selection, true)
	end
end)

script.on_event("DyWorld_reverse_rotate_inserter_pickup", function(event)
	local selection = game.players[event.player_index].selected
	if selection and (selection.type == "inserter" or (selection.type == "entity-ghost" and selection.ghost_type == "inserter")) then
		RotatePickup(selection, false)
	end
end)

script.on_event("DyWorld_inserter_drop_distance_toggle", function(event)
	local selection = game.players[event.player_index].selected
	if selection and (selection.type == "inserter" or (selection.type == "entity-ghost" and selection.ghost_type == "inserter")) then
		ToggleDropDistance(selection, event)
	end
end)

script.on_event("DyWorld_inserter_drop_lateral_adjust", function(event)
	local selection = game.players[event.player_index].selected
	if selection and (selection.type == "inserter" or (selection.type == "entity-ghost" and selection.ghost_type == "inserter")) then
		LateralDropAdjust(selection)
	end
end)