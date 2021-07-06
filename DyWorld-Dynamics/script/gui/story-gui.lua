
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

-------------------------------- Objectives TAB ----------------------------------------
		local tab2 = tabbed_pane.add{type = "tab", name = "DyDs_story_objectives_tab", caption = "Objectives: [color=yellow]"..(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives_amount - global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left).."[/color]/[color=blue]"..global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives_amount.."[/color]"}
		local frameflow2 = tabbed_pane.add{type = "flow", name = "flow2", direction = "vertical"}
		tabbed_pane.add_tab(tab2, frameflow2)
		
		frameflow2.add{type = "label", caption = "Water:"}
		frameflow2.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].water/global.dyworld.players[id].water_max), tooltip = "Water: [color=blue]"..Round(global.dyworld.players[id].water, 2).."[/color]\nMax Water: [color=blue]"..global.dyworld.players[id].water_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].water_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "water").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].water/global.dyworld.players[id].water_max))}
		
		frameflow2.add{type = "label", caption = "Food:"}
		frameflow2.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].food/global.dyworld.players[id].food_max), tooltip = "Food: [color=blue]"..Round(global.dyworld.players[id].food, 2).."[/color]\nMax Food: [color=blue]"..global.dyworld.players[id].food_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].food_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "food").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].food/global.dyworld.players[id].food_max))}
		frameflow2.add{type = "line", direction = "horizontal"}
		
		if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives[1] then
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.done == false and v.type_1 == "label") then
					frameflow2.add{type = "label", caption = {"DyDs-story."..v.name}}
					frameflow2.add{type = "line", direction = "horizontal"}
				elseif (v.done == false and v.type_1 == "research") then
					frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, {"gui-object-"..v.type_1.."."..v.name}}}
					frameflow2.add{type = "line", direction = "horizontal"}
				elseif (v.done == false and v.type_1 == "launch" and v.type_2 == "rocket") then
					frameflow2.add{type = "label", caption = {"DyDs-story.launch-rocket", v.amount_done, v.amount_needed}}
					frameflow2.add{type = "line", direction = "horizontal"}
				elseif (v.done == false and v.type_1 == "corpse") then
					frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, {"gui-object-"..v.type_1.."."..v.name}}}
					frameflow2.add{type = "line", direction = "horizontal"}
				elseif (v.done == false and v.type_1 == "position") then
					if game.players[id].surface.name == v.Surface then
						frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, Round(getDistance(game.players[id].position.x, game.players[id].position.y, v.PosX, v.PosY), 0)}}
						frameflow2.add{type = "line", direction = "horizontal"}
					else
						frameflow2.add{type = "label", caption = "Location on different Surface"}
						frameflow2.add{type = "line", direction = "horizontal"}
					end
				elseif (v.done == false and v.type_1 ~= "label") then
					frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, {"gui-object-"..v.type_2.."."..v.name}, v.amount_done, v.amount_needed}}
					frameflow2.add{type = "line", direction = "horizontal"}
				end
			end
		end

-------------------------------- General TAB ----------------------------------------
		
		local tab1 = tabbed_pane.add{type = "tab", name = "DyDs_story_general_tab", caption = "Act: "..global.dyworld.story.act..", Phase: "..global.dyworld.story.phase}		
		local frameflow1 = tabbed_pane.add{type = "flow", name = "flow1", direction = "vertical"}
		tabbed_pane.add_tab(tab1, frameflow1)
		
		if global.dyworld.story.act == 1 then
			frameflow1.add{type = "label", caption = "Stage: Crashlanded"}
			frameflow1.add{type = "line", direction = "horizontal"}
		elseif global.dyworld.story.act == 2 then
			frameflow1.add{type = "label", caption = "Stage: Metal Works"}
			frameflow1.add{type = "line", direction = "horizontal"}
		elseif global.dyworld.story.act == 3 then
			frameflow1.add{type = "label", caption = "Stage: Space Age"}
			frameflow1.add{type = "line", direction = "horizontal"}
		elseif global.dyworld.story.act == 4 then
			frameflow1.add{type = "label", caption = "Stage: Advanced Space Age"}
			frameflow1.add{type = "line", direction = "horizontal"}
		elseif global.dyworld.story.act == 5 then
			frameflow1.add{type = "label", caption = "Stage: Universe Age"}
			frameflow1.add{type = "line", direction = "horizontal"}
		end
		frameflow1.add{type = "label", caption = "Time since crash: [color=blue]"..global.dyworld.game_stats.time_stamp.."[/color]"}
		frameflow1.add{type = "line", direction = "horizontal"}
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
		
		frameflow1.add{type = "label", caption = "Water:"}
		frameflow1.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].water/global.dyworld.players[id].water_max), tooltip = "Water: [color=blue]"..Round(global.dyworld.players[id].water, 2).."[/color]\nMax Water: [color=blue]"..global.dyworld.players[id].water_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].water_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "water").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].water/global.dyworld.players[id].water_max))}
		
		frameflow1.add{type = "label", caption = "Food:"}
		frameflow1.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].food/global.dyworld.players[id].food_max), tooltip = "Food: [color=blue]"..Round(global.dyworld.players[id].food, 2).."[/color]\nMax Food: [color=blue]"..global.dyworld.players[id].food_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].food_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "food").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].food/global.dyworld.players[id].food_max))}
		frameflow1.add{type = "line", direction = "horizontal"}
end

