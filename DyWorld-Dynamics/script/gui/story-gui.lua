


function Story_GUI(player, id)
	if player.gui.top.DyDs_Main_GUI then
		player.gui.top.DyDs_Main_GUI.destroy()
	end
	if player.gui.top.DyDs_Story_GUI then
		player.gui.top.DyDs_Story_GUI.destroy()
	else
		local force = player.force
		local tabbed_pane = player.gui.top.add{type = "tabbed-pane", name = "DyDs_Story_GUI"}

-------------------------------- Objectives TAB ----------------------------------------
		local tab2 = tabbed_pane.add{type = "tab", caption = "Objectives"}
		local frameflow2 = tabbed_pane.add{type = "flow", name = "flow2", direction = "vertical"}
		tabbed_pane.add_tab(tab2, frameflow2)
		
		if global.dyworld.story.phases[global.dyworld.story.phase].objectives[1] then
			for k,v in pairs(global.dyworld.story.phases[global.dyworld.story.phase].objectives) do
				if v.done == false then
					frameflow2.add{type = "label", caption = {"DyDs-story."..v.type_1, {"item-name."..v.name}, v.amount_done, v.amount_needed}}
				end
			end
		end

-------------------------------- General TAB ----------------------------------------
		local tab1 = tabbed_pane.add{type = "tab", caption = "General Tab"}
		local frameflow1 = tabbed_pane.add{type = "flow", name = "flow1", direction = "vertical"}
		tabbed_pane.add_tab(tab1, frameflow1)
		
		if global.dyworld.story.tier == 0 then
			frameflow1.add{type = "label", caption = "Stage: Crashlanded, Phase: "..global.dyworld.story.phase}
		elseif global.dyworld.story.tier == 1 then
			frameflow1.add{type = "label", caption = "Stage: Bronze Works, Phase: "..global.dyworld.story.phase}
		elseif global.dyworld.story.tier == 2 then
			frameflow1.add{type = "label", caption = "Stage: Iron Age, Phase: "..global.dyworld.story.phase}
		elseif global.dyworld.story.tier == 3 then
			frameflow1.add{type = "label", caption = "Stage: Advanced Metal Age, Phase: "..global.dyworld.story.phase}
		elseif global.dyworld.story.tier == 4 then
			frameflow1.add{type = "label", caption = "Stage: Nanotech Age, Phase: "..global.dyworld.story.phase}
		end
		frameflow1.add{type = "label", caption = "Game Days: "..global.dyworld.game_stats.days}
	end
end
