
function DyWorld_Stats_Key(event)
	if global.dyworld.RPG_Mode == "normal" then
		if not global.players or not global.players[event.player_index] then
			local player = game.players[event.player_index]
			Player_Startup(player, event.player_index)
		end
		local player = game.players[event.player_index]
		gui_1_closeGUI(player, event.player_index)
		if global.players[event.player_index].State_Distance_GUI then
			global.players[event.player_index].State_Distance_GUI = false
			gui_5_CloseGUI(player, event.player_index)
		end
		if global.players[event.player_index].State_Stats_GUI then
			global.players[event.player_index].State_Stats_GUI = false
			gui_1_closeGUI(player, event.player_index)
		else
			global.players[event.player_index].State_Stats_GUI = true
			gui_1_openGui(player, event.player_index)
		end
	end
end

function DyWorld_Distance_Key(event)
	if global.dyworld.RPG_Mode == "normal" then
		if not global.players or not global.players[event.player_index] then
			local player = game.players[event.player_index]
			Player_Startup(player, event.player_index)
		end
		local player = game.players[event.player_index]
		if global.players[event.player_index].State_Stats_GUI then
			global.players[event.player_index].State_Stats_GUI = false
			gui_1_closeGUI(player, event.player_index)
		end
		if global.players[event.player_index].State_Skills_GUI then
			global.players[event.player_index].State_Skills_GUI = false
			gui_2_toggleGui(player, event.player_index)
		end
		if global.players[event.player_index].State_Distance_GUI then
			global.players[event.player_index].State_Distance_GUI = false
			gui_5_CloseGUI(player, event.player_index)
		else
			global.players[event.player_index].State_Distance_GUI = true
			gui_5_RefreshGUI(player, event.player_index)
		end
	end
end

function DyWorld_RoadMap_Key(event)
	if global.dyworld.RPG_Mode == "normal" then
		if not global.players or not global.players[event.player_index] then
			local player = game.players[event.player_index]
			Player_Startup(player, event.player_index)
		end
		local player = game.players[event.player_index]
		gui_3_toggleGui(player)
	end
end

function DyWorld_Skills_Key(event)
	if global.dyworld.RPG_Mode == "normal" then
		if not global.players or not global.players[event.player_index] then
			local player = game.players[event.player_index]
			Player_Startup(player, event.player_index)
		end
		if global.players[event.player_index].Level >= 4 then
			local player = game.players[event.player_index]
			if global.players[event.player_index].State_Distance_GUI then
				global.players[event.player_index].State_Distance_GUI = false
				gui_5_CloseGUI(player, event.player_index)
			end
			if global.players[event.player_index].State_Skills_GUI then
				global.players[event.player_index].State_Skills_GUI = false
				gui_2_toggleGui(player, event.player_index)
			else
				global.players[event.player_index].State_Skills_GUI = true
				gui_2_toggleGui(player, event.player_index)
			end
			BodySkills(event.player_index)
		else
			game.players[event.player_index].print("You need to gain levels to unlock this window! (level 4+)")
		end
	end
end

function DyWorld_Guide_Key(event)
	if global.dyworld.RPG_Mode == "normal" then
		if not global.players or not global.players[event.player_index] then
			local player = game.players[event.player_index]
			Player_Startup(player, event.player_index)
		end
		local player = game.players[event.player_index]
		gui_6_toggleGui(player)
	end
end

function DyWorld_Debug_Key(event)
	if settings.startup["DyWorld_Debug"].value or game.players[event.player_index].name == "Dysoch" then
		local player = game.players[event.player_index]
		gui_0_toggleGui(player, event.player_index)
	end
end

function DyWorld_Debug_LOG_Key(event)
	if settings.startup["DyWorld_Debug"].value or game.players[event.player_index].name == "Dysoch" then
		DyWorld_write_mods()
		DyWorld_write_statistics()
		DyWorld_write_surfaces()
	end
end

function DyWorld_rotate_inserter_pickup_Key(event)
	local selection = game.players[event.player_index].selected
	if selection and (selection.type == "inserter" or (selection.type == "entity-ghost" and selection.ghost_type == "inserter")) then
		RotatePickup(selection, true)
	end
end

function DyWorld_reverse_rotate_inserter_pickup_Key(event)
	local selection = game.players[event.player_index].selected
	if selection and (selection.type == "inserter" or (selection.type == "entity-ghost" and selection.ghost_type == "inserter")) then
		RotatePickup(selection, false)
	end
end

function DyWorld_inserter_drop_distance_toggle_Key(event)
	local selection = game.players[event.player_index].selected
	if selection and (selection.type == "inserter" or (selection.type == "entity-ghost" and selection.ghost_type == "inserter")) then
		ToggleDropDistance(selection, event)
	end
end

function DyWorld_inserter_drop_lateral_adjust_Key(event)
	local selection = game.players[event.player_index].selected
	if selection and (selection.type == "inserter" or (selection.type == "entity-ghost" and selection.ghost_type == "inserter")) then
		LateralDropAdjust(selection)
	end
end