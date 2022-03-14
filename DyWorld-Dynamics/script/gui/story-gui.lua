
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
				
		if Story.objectives then
			for k,v in pairs(Story.objectives) do
				if (v.done == false) then
					if (v.type_1 == "research") then
						frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, {"technology-name."..v.name}}}
						frameflow2.add{type = "line", direction = "horizontal"}
					elseif (v.type_1 == "launch" and v.type_2 == "rocket") then
						frameflow2.add{type = "label", caption = {"DyDs-story.launch-rocket", v.amount_done, v.amount_needed}}
						frameflow2.add{type = "line", direction = "horizontal"}
					elseif (v.type_1 == "world") then
						if v.type_2 == "radar-scan" then
							frameflow2.add{type = "label", caption = "Sectors Scanned: "..v.amount_done.."/"..v.amount_needed}
							frameflow2.add{type = "line", direction = "horizontal"}
						elseif v.type_2 == "chunk" then
							frameflow2.add{type = "label", caption = "Chunks Generated: "..v.amount_done.."/"..v.amount_needed}
							frameflow2.add{type = "line", direction = "horizontal"}
						end
					elseif (v.type_1 == "position") then
						if game.players[id].surface.name == v.Surface then
							frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, Round(getDistance(game.players[id].position.x, game.players[id].position.y, v.PosX, v.PosY), 0)}}
							frameflow2.add{type = "line", direction = "horizontal"}
						else
							frameflow2.add{type = "label", caption = "Location on different Surface ("..v.Surface..")"}
							frameflow2.add{type = "line", direction = "horizontal"}
						end
					elseif (v.type_1 == "died") then
						frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, {"gui-object-"..v.type_2.."."..v.name}, v.amount_done, v.amount_needed}}
						frameflow2.add{type = "line", direction = "horizontal"}
					else
						frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, game.item_prototypes[v.name].localised_name, v.amount_done, v.amount_needed}}
						frameflow2.add{type = "line", direction = "horizontal"}
					end
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
				
		if Story.objectives_side or debugger then
            if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] >= 1 then
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
            else
                frameflow2.add{type = "label", caption = "You completed all side objectives for this Phase\nFocus on your main objectives now!"}
            end
		end
	elseif not global.dyworld.game_stats.story_pause then
-------------------------------- Objectives TAB ----------------------------------------
		local tab2 = tabbed_pane.add{type = "tab", name = "DyDs_story_objectives_tab", caption = "Objectives: [color=yellow]"..(Story.amount[1] + Story.amount[2]).."[/color]"}
		local frameflow2 = tabbed_pane.add{type = "flow", name = "flow2", direction = "vertical"}
		tabbed_pane.add_tab(tab2, frameflow2)
		
		if Story.objectives then
			for k,v in pairs(Story.objectives) do
				if (v.done == false) then
					if (v.type_1 == "research") then
						frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, {"technology-name."..v.name}}}
						frameflow2.add{type = "line", direction = "horizontal"}
					elseif (v.type_1 == "launch" and v.type_2 == "rocket") then
						frameflow2.add{type = "label", caption = {"DyDs-story.launch-rocket", v.amount_done, v.amount_needed}}
						frameflow2.add{type = "line", direction = "horizontal"}
					elseif (v.type_1 == "world") then
						if v.type_2 == "radar-scan" then
							frameflow2.add{type = "label", caption = "Sectors Scanned: "..v.amount_done.."/"..v.amount_needed}
							frameflow2.add{type = "line", direction = "horizontal"}
						elseif v.type_2 == "chunk" then
							frameflow2.add{type = "label", caption = "Chunks Generated: "..v.amount_done.."/"..v.amount_needed}
							frameflow2.add{type = "line", direction = "horizontal"}
						end
					elseif (v.type_1 == "position") then
						if game.players[id].surface.name == v.Surface then
							frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, Round(getDistance(game.players[id].position.x, game.players[id].position.y, v.PosX, v.PosY), 0)}}
							--frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, v.PosX, v.PosY, v.Surface}}
							frameflow2.add{type = "line", direction = "horizontal"}
						else
							frameflow2.add{type = "label", caption = "Location on different Surface"}
							frameflow2.add{type = "line", direction = "horizontal"}
						end
					elseif (v.type_1 == "died") then
						frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, {"gui-object-"..v.type_2.."."..v.name}, v.amount_done, v.amount_needed}}
						frameflow2.add{type = "line", direction = "horizontal"}
					else
						frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, game.item_prototypes[v.name].localised_name, v.amount_done, v.amount_needed}}
						frameflow2.add{type = "line", direction = "horizontal"}
					end
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
