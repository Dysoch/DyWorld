


function Close_Story_GUI(player, id)
	if player.gui.top.DyDs_Story_GUI then
		player.gui.top.DyDs_Story_GUI.destroy()
	end
end

function Story_GUI(player, id)
		local force = player.force
		local tabbed_pane = player.gui.top.add{type = "tabbed-pane", name = "DyDs_Story_GUI"}

-------------------------------- Objectives TAB ----------------------------------------
		local tab2 = tabbed_pane.add{type = "tab", name = "DyDs_story_objectives_tab", caption = "Objectives: "..(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives_amount - global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left).."/"..global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives_amount}
		local frameflow2 = tabbed_pane.add{type = "flow", name = "flow2", direction = "vertical"}
		tabbed_pane.add_tab(tab2, frameflow2)
		
		if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives[1] then
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.done == false and v.type_1 == "label") then
					frameflow2.add{type = "label", caption = {"DyDs-story."..v.name}}
					frameflow2.add{type = "line", direction = "horizontal"}
				elseif (v.done == false and v.type_1 == "research") then
					frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, {"gui-object-"..v.type_1.."."..v.name}}}
					frameflow2.add{type = "line", direction = "horizontal"}
				elseif (v.done == false and v.type_1 == "corpse") then
					frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, {"gui-object-"..v.type_1.."."..v.name}}}
					frameflow2.add{type = "line", direction = "horizontal"}
				elseif (v.done == false and v.type_1 == "position") then
					frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, Round(getDistance(game.players[id].position.x, game.players[id].position.y, v.PosX, v.PosY), 0)}}
					frameflow2.add{type = "line", direction = "horizontal"}
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
			frameflow1.add{type = "label", caption = "Stage: Advanced Metal Age"}
			frameflow1.add{type = "line", direction = "horizontal"}
		elseif global.dyworld.story.act == 4 then
			frameflow1.add{type = "label", caption = "Stage: Nanotech Age"}
			frameflow1.add{type = "line", direction = "horizontal"}
		elseif global.dyworld.story.act == 5 then
			frameflow1.add{type = "label", caption = "Stage: Space Age"}
			frameflow1.add{type = "line", direction = "horizontal"}
		end
		frameflow1.add{type = "label", caption = "Time since crash: "..global.dyworld.game_stats.time_stamp}
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
end

