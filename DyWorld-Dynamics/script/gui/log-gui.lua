


function Close_Log_GUI(player, id)
	if player.gui.top.DyDs_Log_GUI then
		player.gui.top.DyDs_Log_GUI.destroy()
	end
end

function Log_GUI(player, id)
		local force = player.force
		local tabbed_pane = player.gui.top.add{type = "tabbed-pane", name = "DyDs_Log_GUI"}

-------------------------------- General TAB ----------------------------------------
		local tab1 = tabbed_pane.add{type = "tab", name = "DyDs_log_general_tab", caption = "General Tab"}
		local frameflow1 = tabbed_pane.add{type = "flow", name = "flow1", direction = "vertical"}
		tabbed_pane.add_tab(tab1, frameflow1)
		
		if global.dyworld.story.act == 1 then
			frameflow1.add{type = "label", caption = "Stage: Crashlanded, Phase: "..global.dyworld.story.phase}
			frameflow1.add{type = "line", direction = "horizontal"}
		elseif global.dyworld.story.act == 2 then
			frameflow1.add{type = "label", caption = "Stage: Bronze Works, Phase: "..global.dyworld.story.phase}
			frameflow1.add{type = "line", direction = "horizontal"}
		elseif global.dyworld.story.act == 3 then
			frameflow1.add{type = "label", caption = "Stage: Iron Age, Phase: "..global.dyworld.story.phase}
			frameflow1.add{type = "line", direction = "horizontal"}
		elseif global.dyworld.story.act == 4 then
			frameflow1.add{type = "label", caption = "Stage: Advanced Metal Age, Phase: "..global.dyworld.story.phase}
			frameflow1.add{type = "line", direction = "horizontal"}
		elseif global.dyworld.story.act == 5 then
			frameflow1.add{type = "label", caption = "Stage: Nanotech Age, Phase: "..global.dyworld.story.phase}
			frameflow1.add{type = "line", direction = "horizontal"}
		end
		frameflow1.add{type = "label", caption = "Game Days: "..global.dyworld.game_stats.days}
		frameflow1.add{type = "line", direction = "horizontal"}
end

