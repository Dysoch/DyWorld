-- gui_1 is the stats menu
require "script/stats/functions"

function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function gui_1_closeGUI(player, id)
	if player.gui.top.dyworld_stats_1_gui then
	local P_Level = global.players[id].Level
		player.gui.top.dyworld_stats_1_gui.destroy()
		player.gui.top.dyworld_stats_2_gui.destroy()
		if P_Level >= 2 and player.gui.top.dyworld_stats_3_gui then
			player.gui.top.dyworld_stats_3_gui.destroy()
		end
	end
end

function gui_1_openGui(player, id)
	local P_Level = global.players[id].Level
	local frame1 = player.gui.top.add{type = "frame", name = "dyworld_stats_1_gui", direction = "vertical", caption = {"dyworld_stats_gui.title"}}
	local frame2 = player.gui.top.add{type = "frame", name = "dyworld_stats_2_gui", direction = "vertical", caption = {"dyworld_stats_gui.title"}}
	local frameflow1 = frame1.add{type = "flow", name = "flow", direction = "vertical"}
	local frameflow2 = frame2.add{type = "flow", name = "flow", direction = "vertical"}
	if P_Level >= 2 then
		local frame3 = player.gui.top.add{type = "frame", name = "dyworld_stats_3_gui", direction = "vertical", caption = {"dyworld_stats_gui.title"}}
		stats_frameflow3 = frame3.add{type = "flow", name = "flow", direction = "vertical"}
	end
	--stats_functions.BodySkills(id)
	if not global.dyworld.Max_Research then
		require "script/startup"
		global.dyworld.Max_Research = Research_Calc()
	end
	-- labels for stats_1
	frameflow1.add{type = "label", style = "dyworld_stats_divider_header_label", caption = {"dyworld_stats_gui.stats_1", (game.players[id].name)}}
	frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_level", (global.players[id].Level or 0)}, style = "dyworld_label"}
	--frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_xp"}}
	frameflow1.add{type = "progressbar", tooltip = {"dyworld_stats_gui.stats_xp"}, size = 26, value = (global.players[id].XP/global.players[id].XP_LevelUp)}
	--frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_xp", (global.players[id].XP or 0)}}
	--frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_xplevel", (global.players[id].XP_LevelUp or 0)}}
	--frameflow1.add{type = "label", caption = "XP TO LEVEL FRACT: "..(global.players[id].XP/global.players[id].XP_LevelUp)}
	if global.players[id].stats.crafted and global.players[id].stats.crafted >= 1 then
		if (#game.players <= 1) then
			frameflow1.add{type = "label", tooltip = "The amount you have crafted", caption = {"dyworld_stats_gui.stats_crafted", (global.players[id].stats.crafted or 0)}, style = "dyworld_label"}
		else
			frameflow1.add{type = "label", tooltip = "The amount you have crafted / Total amount crafted by all players", caption = {"dyworld_stats_gui.stats_crafted_mp", (global.players[id].stats.crafted or 0), (global.stats.crafted or 0)}, style = "dyworld_label"}
		end
	end
	if global.players[id].stats.mined and global.players[id].stats.mined >= 1 then
		if (#game.players <= 1) then
			frameflow1.add{type = "label", tooltip = "The amount you have mined", caption = {"dyworld_stats_gui.stats_mined", (global.players[id].stats.mined or 0)}, style = "dyworld_label"}
		else
			frameflow1.add{type = "label", tooltip = "The amount you have mined / Total amount mined by all players", caption = {"dyworld_stats_gui.stats_mined_mp", (global.players[id].stats.mined or 0), (global.stats.mined or 0)}, style = "dyworld_label"}
		end
	end
	if global.players[id].stats.build and global.players[id].stats.build >= 1 then
		if (#game.players <= 1) then
			frameflow1.add{type = "label", tooltip = "The amount you have build", caption = {"dyworld_stats_gui.stats_build", (global.players[id].stats.build or 0)}, style = "dyworld_label"}
		else
			frameflow1.add{type = "label", tooltip = "The amount you have build / Total amount build by all players", caption = {"dyworld_stats_gui.stats_build_mp", (global.players[id].stats.build or 0), (global.stats.build or 0)}, style = "dyworld_label"}
		end
	end
	if global.players[id].stats.pickup and global.players[id].stats.pickup >= 1 then
		if (#game.players <= 1) then
			frameflow1.add{type = "label", tooltip = "The amount you have picked up/looted", caption = {"dyworld_stats_gui.stats_pickup", (global.players[id].stats.pickup or 0)}, style = "dyworld_label"}
		else
			frameflow1.add{type = "label", tooltip = "The amount you have picked up/looted / Total amount picked up/looted by all players", caption = {"dyworld_stats_gui.stats_pickup_mp", (global.players[id].stats.pickup or 0), (global.stats.pickup or 0)}, style = "dyworld_label"}
		end
	end
	frameflow1.add{type = "label", style = "dyworld_stats_divider_header_label", caption = {"dyworld_stats_gui.stats_2"}}
	if global.stats.killed and global.stats.killed >= 1 then
		frameflow1.add{type = "label", tooltip = "WIP", caption = {"dyworld_stats_gui.stats_killed", global.stats.killed}, style = "dyworld_label"}
		frameflow1.add{type = "label", tooltip = "WIP", caption = {"dyworld_stats_gui.stats_evo", (Round(game.forces.enemy.evolution_factor * 100, 2) or 0)}, style = "dyworld_label"}
	end
	if global.stats.scanned and global.stats.scanned >= 1 then
		frameflow1.add{type = "label", tooltip = "WIP", caption = {"dyworld_stats_gui.stats_scanned", (global.stats.scanned or 0)}, style = "dyworld_label"}
	end
	if global.stats.research and global.stats.research >= 1 then
		frameflow1.add{type = "label", tooltip = "WIP", caption = {"dyworld_stats_gui.stats_research", global.stats.research}, style = "dyworld_label"}
	end
	if global.dyworld.Research_Done and global.dyworld.Research_Done >= 1 then
		frameflow1.add{type = "label", tooltip = "WIP", caption = {"dyworld_stats_gui.stats_research_done", (Round(((global.dyworld.Research_Done) / global.dyworld.Max_Research) * 100, 1) or 0)}, style = "dyworld_label"}
	end
	if global.stats.ghostbuild and global.stats.ghostbuild >= 1 then
		frameflow1.add{type = "label", tooltip = "WIP", caption = {"dyworld_stats_gui.stats_ghostbuild", (global.stats.ghostbuild or 0)}, style = "dyworld_label"}
	end
	if global.stats.ghostmined and global.stats.ghostmined >= 1 then
		frameflow1.add{type = "label", tooltip = "WIP", caption = {"dyworld_stats_gui.stats_ghostmined", (global.stats.ghostmined or 0)}, style = "dyworld_label"}
	end
	-- labels for stats_2
	frameflow2.add{type = "label", style = "dyworld_stats_divider_header_label", caption = {"dyworld_stats_gui.body", (game.players[id].name)}}
	frameflow2.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_physical"}}
	frameflow2.add{type = "label", tooltip = "WIP", caption = {"dyworld_stats_gui.body_strength", (global.players[id].physical.strength)}, style = "dyworld_label"}
	frameflow2.add{type = "label", tooltip = "WIP", caption = {"dyworld_stats_gui.body_endurance", (global.players[id].physical.endurance)}, style = "dyworld_label"}
	frameflow2.add{type = "label", tooltip = "WIP", caption = {"dyworld_stats_gui.body_speed", (global.players[id].physical.speed)}, style = "dyworld_label"}
	frameflow2.add{type = "label", tooltip = "WIP", caption = {"dyworld_stats_gui.body_creations", (global.players[id].physical.creations)}, style = "dyworld_label"}
	if P_Level >= 25 then
		frameflow2.add{type = "label", tooltip = "WIP", caption = {"dyworld_stats_gui.body_implants", (global.players[id].physical.implants)}, style = "dyworld_label"}
	else
		frameflow2.add{type = "label", tooltip = "WIP", caption = "Locked (Lvl 25+)", style = "dyworld_label"}
	end
	frameflow2.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_mystical"}}
	frameflow2.add{type = "label", tooltip = "WIP", caption = {"dyworld_stats_gui.body_spirit", (global.players[id].mystical.spirit)}, style = "dyworld_label"}
	frameflow2.add{type = "label", tooltip = "WIP", caption = {"dyworld_stats_gui.body_intelligence", (global.players[id].mystical.intelligence)}, style = "dyworld_label"}
	frameflow2.add{type = "label", tooltip = "WIP", caption = {"dyworld_stats_gui.body_wisdom", (global.players[id].mystical.wisdom)}, style = "dyworld_label"}
	frameflow2.add{type = "label", tooltip = "WIP", caption = {"dyworld_stats_gui.body_guile", (global.players[id].mystical.guile)}, style = "dyworld_label"}
	frameflow2.add{type = "label", tooltip = "WIP", caption = {"dyworld_stats_gui.body_knowledge", (global.players[id].mystical.knowledge)}, style = "dyworld_label"}
	-- labels for stats_3
	if P_Level >= 2 then
		stats_frameflow3.add{type = "label", style = "dyworld_stats_divider_header_label", caption = {"dyworld_stats_gui.stats_3", (game.players[id].name)}}
		if global.players[id].stats.mined and global.players[id].stats.mined >= 1000 then
			stats_frameflow3.add{type = "label", tooltip = "WIP", caption = "Mining Speed: "..Round(game.players[id].character_mining_speed_modifier+1, 2), style = "dyworld_label"}
		end
		if global.players[id].stats.crafted and global.players[id].stats.crafted >= 250 then
			stats_frameflow3.add{type = "label", tooltip = "WIP", caption = "Crafting Speed: "..Round(game.players[id].character_crafting_speed_modifier+1, 2), style = "dyworld_label"}
		end
		if P_Level >= 4 then
			stats_frameflow3.add{type = "label", tooltip = "WIP", caption = "Resource Reach Distance: "..math.floor(game.players[id].character_resource_reach_distance_bonus+2.7), style = "dyworld_label"}
		else
			stats_frameflow3.add{type = "label", tooltip = {"dyworld_stats_gui.locked-1", 4}, caption = {"dyworld_stats_gui.locked-2"}, style = "dyworld_label"}
		end
		if P_Level >= 7 and global.stats.killed and global.stats.killed >= 1 then
			stats_frameflow3.add{type = "label", tooltip = "WIP", caption = "Loot Pickup Range: "..math.floor(game.players[id].character_loot_pickup_distance_bonus+2), style = "dyworld_label"}
			stats_frameflow3.add{type = "label", tooltip = "WIP", caption = "Health: "..game.entity_prototypes["character"].max_health + game.players[id].character_health_bonus, style = "dyworld_label"}
		else
			stats_frameflow3.add{type = "label", tooltip = {"dyworld_stats_gui.locked-1", 7}, caption = {"dyworld_stats_gui.locked-2"}, style = "dyworld_label"}
		end
		if P_Level >= 10 then
			stats_frameflow3.add{type = "label", tooltip = "WIP", caption = "Inventory Slots: "..game.entity_prototypes["character"].get_inventory_size(1) + game.players[id].character_inventory_slots_bonus, style = "dyworld_label"}
		else
			stats_frameflow3.add{type = "label", tooltip = {"dyworld_stats_gui.locked-1", 10}, caption = {"dyworld_stats_gui.locked-2"}, style = "dyworld_label"}
		end
		if P_Level >= 15 then
			stats_frameflow3.add{type = "label", tooltip = "WIP", caption = "Reach Distance: "..math.floor(game.players[id].character_reach_distance_bonus+6), style = "dyworld_label"}
			if global.players[id].stats.build and global.players[id].stats.build >= 15000 then
				stats_frameflow3.add{type = "label", tooltip = "WIP", caption = "Build Distance: "..math.floor(game.players[id].character_build_distance_bonus+6), style = "dyworld_label"}
			end
		else
			stats_frameflow3.add{type = "label", tooltip = {"dyworld_stats_gui.locked-1", 15}, caption = {"dyworld_stats_gui.locked-2"}, style = "dyworld_label"}
		end
		if P_Level >= 25 then
			stats_frameflow3.add{type = "label", tooltip = "WIP", caption = "Robot Follower Count: "..math.floor(game.players[id].character_maximum_following_robot_count_bonus), style = "dyworld_label"}
		else
			stats_frameflow3.add{type = "label", tooltip = {"dyworld_stats_gui.locked-1", 25}, caption = {"dyworld_stats_gui.locked-2"}, style = "dyworld_label"}
		end
		if P_Level >= 30 then
			stats_frameflow3.add{type = "label", tooltip = "WIP", caption = "Logistic Slots Count: "..math.floor(game.players[id].character_logistic_slot_count_bonus), style = "dyworld_label"}
		else
			stats_frameflow3.add{type = "label", tooltip = {"dyworld_stats_gui.locked-1", 30}, caption = {"dyworld_stats_gui.locked-2"}, style = "dyworld_label"}
		end
	end	
end
