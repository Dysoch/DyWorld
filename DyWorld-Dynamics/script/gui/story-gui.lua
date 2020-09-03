


function Story_GUI(player, id)
	if player.gui.top.DyDs_Main_GUI then
		player.gui.top.DyDs_Main_GUI.destroy()
	end
	if player.gui.top.DyDs_Story_GUI then
		player.gui.top.DyDs_Story_GUI.destroy()
	else
		local force = player.force
		local tabbed_pane = player.gui.top.add{type = "tabbed-pane", name = "DyDs_Story_GUI"}

-------------------------------- Tier 0 TAB ----------------------------------------
		local tab1 = tabbed_pane.add{type = "tab", caption = "General Story"}
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
