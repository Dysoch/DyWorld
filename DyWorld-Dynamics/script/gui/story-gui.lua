
local function Progress_Surival_Style_Check(VAR)
	local Percent = VAR * 100
	if Percent >= 90 then return "dy-bar-1"
	elseif Percent >= 80 then return "dy-bar-2"
	elseif Percent >= 70 then return "dy-bar-3"
	elseif Percent >= 60 then return "dy-bar-4"
	elseif Percent >= 50 then return "dy-bar-5"
	elseif Percent >= 40 then return "dy-bar-6"
	elseif Percent >= 30 then return "dy-bar-7"
	elseif Percent >= 20 then return "dy-bar-8"
	elseif Percent >= 10 then return "dy-bar-9"
	elseif Percent < 10 then return "dy-bar-10"
	else return "dy-bar-10"
	end
end

local function Time_Surival_Check(id, VAR)
	if VAR == "food" then
		local rate = global.dyworld.players[id].food_rate
		local capacity = global.dyworld.players[id].food
		local total = capacity / rate
		local seconds_start = math.floor(total)
		local minutes_start = math.floor(seconds_start/60)
		local hours = math.floor(minutes_start/60)
		local minutes = (minutes_start-(hours*60))
		local seconds = (seconds_start-(minutes_start*60))
		return (hours..":"..minutes..":"..seconds)
	elseif VAR == "water" then
		local rate = global.dyworld.players[id].water_rate
		local capacity = global.dyworld.players[id].water
		local total = capacity / rate
		local seconds_start = math.floor(total)
		local minutes_start = math.floor(seconds_start/60)
		local hours = math.floor(minutes_start/60)
		local minutes = (minutes_start-(hours*60))
		local seconds = (seconds_start-(minutes_start*60))
		return (hours..":"..minutes..":"..seconds)
	end
end

function Close_Story_GUI(player, id)
	if player.gui.top.DyDs_Story_GUI then
		player.gui.top.DyDs_Story_GUI.destroy()
	end
end

function Story_GUI(player, id)
		local force = player.force
		local tabbed_pane = player.gui.top.add{type = "tabbed-pane", name = "DyDs_Story_GUI"}

	if not global.dyworld.story.side_objectives then global.dyworld.story.side_objectives = {} end
	if not global.dyworld.story.side_objectives.done then global.dyworld.story.side_objectives.done = {} end
	if not global.dyworld.story.side_objectives.unlocked then global.dyworld.story.side_objectives.unlocked = {} end
	if not global.dyworld.story.side_objectives.locked then global.dyworld.story.side_objectives.locked = {} end
	if not global.dyworld.story.side_objectives.locked_amount then global.dyworld.story.side_objectives.locked_amount = 0 end
	if not global.dyworld.story.side_objectives.unlocked_amount then global.dyworld.story.side_objectives.unlocked_amount = 0 end
	if not global.dyworld.story.side_objectives.done_amount then global.dyworld.story.side_objectives.done_amount = 0 end
	local Story = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase]

	if (global.dyworld.story.act >= 3) and not global.dyworld.game_stats.story_pause then 
		-------------------------------- Objectives TAB ----------------------------------------
		local tab2 = tabbed_pane.add{type = "tab", name = "DyDs_story_objectives_tab", caption = "Objectives: [color=yellow]"..(Story.amount[1] + Story.amount[2]).."[/color]"}
		local frameflow2 = tabbed_pane.add{type = "flow", name = "flow2", direction = "vertical"}
		tabbed_pane.add_tab(tab2, frameflow2)
				
		if Dy_Sett.Difficulty ~= "Easy" then
			frameflow2.add{type = "label", caption = "Water:"}
			frameflow2.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].water/global.dyworld.players[id].water_max), tooltip = "Water: [color=blue]"..Round(global.dyworld.players[id].water, 2).."[/color]\nMax Water: [color=blue]"..global.dyworld.players[id].water_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].water_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "water").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].water/global.dyworld.players[id].water_max))}
					
			frameflow2.add{type = "label", caption = "Food:"}
			frameflow2.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].food/global.dyworld.players[id].food_max), tooltip = "Food: [color=blue]"..Round(global.dyworld.players[id].food, 2).."[/color]\nMax Food: [color=blue]"..global.dyworld.players[id].food_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].food_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "food").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].food/global.dyworld.players[id].food_max))}
			frameflow2.add{type = "line", direction = "horizontal"}
		end
				
		if Story.objectives then
			for k,v in pairs(Story.objectives) do
				if (v.done == false and v.type_1 == "research") then
					frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, {"technology-name."..v.name}}}
					frameflow2.add{type = "line", direction = "horizontal"}
				elseif (v.done == false and v.type_1 == "launch" and v.type_2 == "rocket") then
					frameflow2.add{type = "label", caption = {"DyDs-story.launch-rocket", v.amount_done, v.amount_needed}}
					frameflow2.add{type = "line", direction = "horizontal"}
				elseif (v.done == false and v.type_1 == "world") then
					if v.type_2 == "radar-scan" then
						frameflow2.add{type = "label", caption = "Sectors Scanned: "..v.amount_done.."/"..v.amount_needed}
						frameflow2.add{type = "line", direction = "horizontal"}
					elseif v.type_2 == "chunk" then
						frameflow2.add{type = "label", caption = "Chunks Generated: "..v.amount_done.."/"..v.amount_needed}
						frameflow2.add{type = "line", direction = "horizontal"}
					end
				elseif (v.done == false and v.type_1 == "position") then
					if game.players[id].surface.name == v.Surface then
						frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, Round(getDistance(game.players[id].position.x, game.players[id].position.y, v.PosX, v.PosY), 0)}}
						frameflow2.add{type = "line", direction = "horizontal"}
					else
						frameflow2.add{type = "label", caption = "Location on different Surface ("..v.Surface..")"}
						frameflow2.add{type = "line", direction = "horizontal"}
					end
				elseif (v.done == false) then
					frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, {"gui-object-"..v.type_2.."."..v.name}, v.amount_done, v.amount_needed}}
					frameflow2.add{type = "line", direction = "horizontal"}
				end
			end
		end
		frameflow2.add{type = "line", direction = "horizontal"}
		if Story.label then
			for k,v in pairs(Story.label) do
				frameflow2.add{type = "label", caption = {"DyDs-story-label."..v}}
			end
		end
		-------------------------------- Side Objectives TAB ----------------------------------------
		local tab3 = tabbed_pane.add{type = "tab", name = "DyDs_story_side_objectives_tab", caption = "Side Objectives: [color=yellow]"..global.dyworld.story.side_objectives.unlocked_amount.."[/color]"}
		local frameflow3 = tabbed_pane.add{type = "flow", name = "flow3", direction = "vertical"}
		tabbed_pane.add_tab(tab3, frameflow3)
				
		if Dy_Sett.Difficulty ~= "Easy" then
			frameflow3.add{type = "label", caption = "Water:"}
			frameflow3.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].water/global.dyworld.players[id].water_max), tooltip = "Water: [color=blue]"..Round(global.dyworld.players[id].water, 2).."[/color]\nMax Water: [color=blue]"..global.dyworld.players[id].water_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].water_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "water").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].water/global.dyworld.players[id].water_max))}
					
			frameflow3.add{type = "label", caption = "Food:"}
			frameflow3.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].food/global.dyworld.players[id].food_max), tooltip = "Food: [color=blue]"..Round(global.dyworld.players[id].food, 2).."[/color]\nMax Food: [color=blue]"..global.dyworld.players[id].food_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].food_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "food").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].food/global.dyworld.players[id].food_max))}
			frameflow3.add{type = "line", direction = "horizontal"}
		end
				
		if Story.objectives_side or debugger then
			for k,v in pairs(global.dyworld.story.side_objectives.unlocked) do
				if v.done == false then
					if v.objective_type == "build-type" then
						frameflow3.add{type = "label", caption = {"DyDs-side-story."..v.objective_type, {"type-name."..v.name}, v.amount_done, v.amount_needed}}
						frameflow3.add{type = "line", direction = "horizontal"}
					elseif v.objective_type == "build-name" then
						frameflow3.add{type = "label", caption = {"DyDs-side-story."..v.objective_type, {"entity-name."..v.name}, v.amount_done, v.amount_needed}}
						frameflow3.add{type = "line", direction = "horizontal"}
					elseif v.objective_type == "kill-type" then
						frameflow3.add{type = "label", caption = {"DyDs-side-story."..v.objective_type, {"type-name."..v.name}, v.amount_done, v.amount_needed}}
						frameflow3.add{type = "line", direction = "horizontal"}
					elseif v.objective_type == "kill-name" then
						frameflow3.add{type = "label", caption = {"DyDs-side-story."..v.objective_type, {"entity-name."..v.name}, v.amount_done, v.amount_needed}}
						frameflow3.add{type = "line", direction = "horizontal"}
					elseif v.objective_type == "scanning" then
						frameflow3.add{type = "label", caption = {"DyDs-side-story."..v.objective_type, v.amount_done, v.amount_needed}}
						frameflow3.add{type = "line", direction = "horizontal"}
					elseif v.objective_type == "rockets" then
						frameflow3.add{type = "label", caption = {"DyDs-side-story."..v.objective_type, v.amount_done, v.amount_needed}}
						frameflow3.add{type = "line", direction = "horizontal"}
					elseif v.objective_type == "satellite" then
						frameflow3.add{type = "label", caption = {"DyDs-side-story."..v.objective_type, {"item-name."..v.name}, v.amount_done, v.amount_needed}}
						frameflow3.add{type = "line", direction = "horizontal"}
					end
				end
			end
		end
	elseif not global.dyworld.game_stats.story_pause then
-------------------------------- Objectives TAB ----------------------------------------
		local tab2 = tabbed_pane.add{type = "tab", name = "DyDs_story_objectives_tab", caption = "Objectives: [color=yellow]"..(Story.amount[1] + Story.amount[2]).."[/color]"}
		local frameflow2 = tabbed_pane.add{type = "flow", name = "flow2", direction = "vertical"}
		tabbed_pane.add_tab(tab2, frameflow2)
		
		if Dy_Sett.Difficulty ~= "Easy" then
			frameflow2.add{type = "label", caption = "Water:"}
			frameflow2.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].water/global.dyworld.players[id].water_max), tooltip = "Water: [color=blue]"..Round(global.dyworld.players[id].water, 2).."[/color]\nMax Water: [color=blue]"..global.dyworld.players[id].water_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].water_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "water").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].water/global.dyworld.players[id].water_max))}
			
			frameflow2.add{type = "label", caption = "Food:"}
			frameflow2.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].food/global.dyworld.players[id].food_max), tooltip = "Food: [color=blue]"..Round(global.dyworld.players[id].food, 2).."[/color]\nMax Food: [color=blue]"..global.dyworld.players[id].food_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].food_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "food").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].food/global.dyworld.players[id].food_max))}
			frameflow2.add{type = "line", direction = "horizontal"}
		end
		
		if Story.objectives then
			for k,v in pairs(Story.objectives) do
				if (v.done == false and v.type_1 == "research") then
					frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, {"technology-name."..v.name}}}
					frameflow2.add{type = "line", direction = "horizontal"}
				elseif (v.done == false and v.type_1 == "launch" and v.type_2 == "rocket") then
					frameflow2.add{type = "label", caption = {"DyDs-story.launch-rocket", v.amount_done, v.amount_needed}}
					frameflow2.add{type = "line", direction = "horizontal"}
				elseif (v.done == false and v.type_1 == "world") then
					if v.type_2 == "radar-scan" then
						frameflow2.add{type = "label", caption = "Sectors Scanned: "..v.amount_done.."/"..v.amount_needed}
						frameflow2.add{type = "line", direction = "horizontal"}
					elseif v.type_2 == "chunk" then
						frameflow2.add{type = "label", caption = "Chunks Generated: "..v.amount_done.."/"..v.amount_needed}
						frameflow2.add{type = "line", direction = "horizontal"}
					end
				elseif (v.done == false and v.type_1 == "position") then
					if game.players[id].surface.name == v.Surface then
						frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, Round(getDistance(game.players[id].position.x, game.players[id].position.y, v.PosX, v.PosY), 0)}}
						frameflow2.add{type = "line", direction = "horizontal"}
					else
						frameflow2.add{type = "label", caption = "Location on different Surface"}
						frameflow2.add{type = "line", direction = "horizontal"}
					end
				elseif (v.done == false) then
					frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, {"gui-object-"..v.type_2.."."..v.name}, v.amount_done, v.amount_needed}}
					frameflow2.add{type = "line", direction = "horizontal"}
				end
			end
		end
		frameflow2.add{type = "line", direction = "horizontal"}
		if Story.label then
			for k,v in pairs(Story.label) do
				frameflow2.add{type = "label", caption = {"DyDs-story-label."..v}}
			end
		end
	else
		local tab2 = tabbed_pane.add{type = "tab", name = "DyDs_story_objectives_tab", caption = "Paused Story"}
		local frameflow2 = tabbed_pane.add{type = "flow", name = "flow2", direction = "vertical"}
		tabbed_pane.add_tab(tab2, frameflow2)

		frameflow2.add{type = "label", caption = "Story is paused.\nYou progressed until the point where the current story ends.\nPlease be patient, the next part will come soon.\nYou can keep playing."}
	end

	-------------------------------- General TAB ----------------------------------------	
	local tab1 = tabbed_pane.add{type = "tab", name = "DyDs_story_general_tab", caption = "Act: "..global.dyworld.story.act..", Phase: "..global.dyworld.story.phase}		
	local frameflow1 = tabbed_pane.add{type = "flow", name = "flow1", direction = "vertical"}
	tabbed_pane.add_tab(tab1, frameflow1)

	--if Dy_Sett.Difficulty ~= "Easy" then
		frameflow1.add{type = "label", caption = "Water:"}
		frameflow1.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].water/global.dyworld.players[id].water_max), tooltip = "Water: [color=blue]"..Round(global.dyworld.players[id].water, 2).."[/color]\nMax Water: [color=blue]"..global.dyworld.players[id].water_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].water_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "water").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].water/global.dyworld.players[id].water_max))}
		
		frameflow1.add{type = "label", caption = "Food:"}
		frameflow1.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].food/global.dyworld.players[id].food_max), tooltip = "Food: [color=blue]"..Round(global.dyworld.players[id].food, 2).."[/color]\nMax Food: [color=blue]"..global.dyworld.players[id].food_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].food_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "food").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].food/global.dyworld.players[id].food_max))}
		frameflow1.add{type = "line", direction = "horizontal"}
	--end

	frameflow1.add{type = "label", caption = "Time since crash: [color=blue]"..global.dyworld.game_stats.time_stamp.."[/color]", tooltip = "Total Ingame Nauvis Days: "..global.dyworld.game_stats.days}
	frameflow1.add{type = "line", direction = "horizontal"}

	frameflow1.add{type = "label", caption = "Side Objectives (D/U/L): [color=blue]"..global.dyworld.story.side_objectives.done_amount.."[/color] / [color=blue]"..global.dyworld.story.side_objectives.unlocked_amount.."[/color] / [color=blue]"..global.dyworld.story.side_objectives.locked_amount.."[/color]", tooltip = "D/U/L = Done/Unlocked/Locked, debug info"}
	frameflow1.add{type = "line", direction = "horizontal"}
	--[[
	if global.dyworld.game_stats.attack_warning_3 then
		frameflow1.add{type = "label", caption = "Attacks inbound: "..tostring(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].enemy_attack)}
		frameflow1.add{type = "label", caption = "Last Attack Location: "..global.dyworld.game_stats.attack_loc_x..","..global.dyworld.game_stats.attack_loc_y}
		frameflow1.add{type = "label", caption = "Last Attack Strength: "..global.dyworld.game_stats.attack_loc_amount.." Natives"}
		frameflow1.add{type = "line", direction = "horizontal"}
	elseif global.dyworld.game_stats.attack_warning_2 then
		frameflow1.add{type = "label", caption = "Attacks inbound: "..tostring(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].enemy_attack)}
		frameflow1.add{type = "label", caption = "Last Attack Strength: "..global.dyworld.game_stats.attack_loc_amount.." Natives"}
		frameflow1.add{type = "line", direction = "horizontal"}
	elseif global.dyworld.game_stats.attack_warning_1 then
		frameflow1.add{type = "label", caption = "Attacks inbound: "..tostring(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].enemy_attack)}
		frameflow1.add{type = "line", direction = "horizontal"}
	end
	]]
	frameflow1.add{type = "label", caption = "[color=red]Attack Messages disabled until rewrite[/color]"}
end

