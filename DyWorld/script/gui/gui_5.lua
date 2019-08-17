require "script/functions"
-- gui_5 is the distance window

function gui_5_RefreshGUI(player, id)
	if player.gui.top.dyworld_distance_gui then
		player.gui.top.dyworld_distance_gui.destroy()
	end
	local force = player.force
	local frame = player.gui.top.add{type = "frame", name = "dyworld_distance_gui", direction = "vertical", caption = {"dyworld_distance_gui.title"}}
	local frameflow = frame.add{type = "flow", name = "flow", direction = "vertical"}
	local DyWorld_Distance_Map_Tags = settings.get_player_settings(game.players[id])["DyWorld_Distance_Map_Tags"].value
	local DyWorld_Distance_Resource_Tags = settings.get_player_settings(game.players[id])["DyWorld_Distance_Resource_Tags"].value
	local DyWorld_Distance_Player_Tags = settings.get_player_settings(game.players[id])["DyWorld_Distance_Player_Tags"].value
	for k,v in pairs(global.players) do
		if v.Alive then
			if not v.PlayerID == id then
				if getDistance(global.players[id].PosX, global.players[id].PosY, global.players[v.PlayerID].PosX, global.players[v.PlayerID].PosY) >= 1000 then
					frameflow.add{type = "label", caption = {"dyworld_distance_gui.ship_km", (game.players[id].name), (Round(getDistance(global.players[id].PosX, global.players[id].PosY, global.players[v.PlayerID].PosX, global.players[v.PlayerID].PosY)/1000, 3))}}
				else
					frameflow.add{type = "label", caption = {"dyworld_distance_gui.ship_m", (game.players[id].name), (math.floor(getDistance(global.players[id].PosX, global.players[id].PosY, global.players[v.PlayerID].PosX, global.players[v.PlayerID].PosY)))}}
				end
			end
		end
	end
	if not global.players[id].Ship_1_Visited then
		if getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_1_PosX, global.dyworld.Generation_Ship_1_PosY) <= 10 then
			global.players[id].Ship_1_Visited = true
		end
		if getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_3_PosX, global.dyworld.Generation_Ship_3_PosY) >= 1000 then
			frameflow.add{type = "label", caption = {"dyworld_distance_gui.ship_km", (1), (Round(getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_1_PosX, global.dyworld.Generation_Ship_1_PosY)/1000, 3))}}
		else
			frameflow.add{type = "label", caption = {"dyworld_distance_gui.ship_m", (1), (math.floor(getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_1_PosX, global.dyworld.Generation_Ship_1_PosY)))}}
		end
	end
	if not global.players[id].Ship_2_Visited then
		if getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_2_PosX, global.dyworld.Generation_Ship_2_PosY) <= 10 then
			global.players[id].Ship_2_Visited = true
		end
		if getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_3_PosX, global.dyworld.Generation_Ship_3_PosY) >= 1000 then
			frameflow.add{type = "label", caption = {"dyworld_distance_gui.ship_km", (2), (Round(getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_2_PosX, global.dyworld.Generation_Ship_2_PosY)/1000, 3))}}
		else
			frameflow.add{type = "label", caption = {"dyworld_distance_gui.ship_m", (2), (math.floor(getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_2_PosX, global.dyworld.Generation_Ship_2_PosY)))}}
		end
	end
	if not global.players[id].Ship_3_Visited then
		if getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_3_PosX, global.dyworld.Generation_Ship_3_PosY) <= 10 then
			global.players[id].Ship_3_Visited = true
		end
		if getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_3_PosX, global.dyworld.Generation_Ship_3_PosY) >= 1000 then
			frameflow.add{type = "label", caption = {"dyworld_distance_gui.ship_km", (3), (Round(getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_3_PosX, global.dyworld.Generation_Ship_3_PosY)/1000, 3))}}
		else
			frameflow.add{type = "label", caption = {"dyworld_distance_gui.ship_m", (3), (math.floor(getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_3_PosX, global.dyworld.Generation_Ship_3_PosY)))}}
		end
	end
	if not global.players[id].Ship_4_Visited then
		if getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_4_PosX, global.dyworld.Generation_Ship_4_PosY) <= 10 then
			global.players[id].Ship_4_Visited = true
		end
		if getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_4_PosX, global.dyworld.Generation_Ship_4_PosY) >= 1000 then
			frameflow.add{type = "label", caption = {"dyworld_distance_gui.ship_km", (4), (Round(getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_4_PosX, global.dyworld.Generation_Ship_4_PosY)/1000, 3))}}
		else
			frameflow.add{type = "label", caption = {"dyworld_distance_gui.ship_m", (4), (math.floor(getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_4_PosX, global.dyworld.Generation_Ship_4_PosY)))}}
		end
	end
	if not global.players[id].Ship_5_Visited then
		if getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_5_PosX, global.dyworld.Generation_Ship_5_PosY) <= 10 then
			global.players[id].Ship_5_Visited = true
		end
		if getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_5_PosX, global.dyworld.Generation_Ship_5_PosY) >= 1000 then
			frameflow.add{type = "label", caption = {"dyworld_distance_gui.ship_km", (5), (Round(getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_5_PosX, global.dyworld.Generation_Ship_5_PosY)/1000, 3))}}
		else
			frameflow.add{type = "label", caption = {"dyworld_distance_gui.ship_m", (5), (math.floor(getDistance(global.players[id].PosX, global.players[id].PosY, global.dyworld.Generation_Ship_5_PosX, global.dyworld.Generation_Ship_5_PosY)))}}
		end
	end
	if DyWorld_Distance_Map_Tags then
		for k,v in pairs(game.forces.player.find_chart_tags("nauvis")) do
			if nil then 
				return 
			else
				if math.floor(getDistance(global.players[id].PosX, global.players[id].PosY, v.position.x, v.position.y)) >= 1000 then
					frameflow.add{type = "label", caption = {"dyworld_distance_gui.tag_km", (v.text or "NULL"), Round(getDistance(global.players[id].PosX, global.players[id].PosY, v.position.x, v.position.y)/1000, 3)}}
				else
					frameflow.add{type = "label", caption = {"dyworld_distance_gui.tag_m", (v.text or "NULL"), (math.floor(getDistance(global.players[id].PosX, global.players[id].PosY, v.position.x, v.position.y)))}}
				end
			end
		end
	else
		frameflow.add{type = "label", caption = {"dyworld_distance_gui.map-tag-disabled"}, tooltip = {"dyworld_distance_gui.map-tag-disabled-tp"}}
	end
	if DyWorld_Distance_Resource_Tags then
	else
		frameflow.add{type = "label", caption = {"dyworld_distance_gui.resource-tag-disabled"}, tooltip = {"dyworld_distance_gui.resource-tag-disabled-tp"}}
	end
	if DyWorld_Distance_Player_Tags then
	else
		frameflow.add{type = "label", caption = {"dyworld_distance_gui.player-tag-disabled"}, tooltip = {"dyworld_distance_gui.player-tag-disabled-tp"}}
	end
end

function gui_5_CloseGUI(player, id)
	if player.gui.top.dyworld_distance_gui then
		player.gui.top.dyworld_distance_gui.destroy()
	end
end
