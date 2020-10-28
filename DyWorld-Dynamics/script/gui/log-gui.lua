


function Close_Log_GUI(player, id)
	if player.gui.top.DyDs_Log_GUI then
		player.gui.top.DyDs_Log_GUI.destroy()
	end
end

function Log_GUI(player, id)
	if not global.dylog then 
		global.dylog = {} 
		if global.dyworld_story then
			local message_1 = {"DyDs-story.message-act-1-phase-1-1"}
			table.insert(global.dylog, message_1)
		end
		local message_2 = {"DyDs-story.message-act-1-phase-1-2"}
		table.insert(global.dylog, message_2)
	end
		local force = player.force
		local tabbed_pane = player.gui.top.add{type = "tabbed-pane", name = "DyDs_Log_GUI"}

-------------------------------- General TAB ----------------------------------------
		local tab1 = tabbed_pane.add{type = "tab", name = "DyDs_log_general_tab", caption = "Log"}
		local frameflow1 = tabbed_pane.add{type = "flow", name = "flow1", direction = "vertical"}
		tabbed_pane.add_tab(tab1, frameflow1)
		
		frameflow1.add{type = "label", caption = "Hover mouse of log to see it normally"}
		frameflow1.add{type = "line", direction = "horizontal"}
		
		local scrollbar_log = frameflow1.add{type = "scroll-pane", name = "", horizontal_scroll_policy = "auto-and-reserve-space", vertical_scroll_policy = "auto-and-reserve-space"}
		scrollbar_log.style.top_padding = 0
		scrollbar_log.style.bottom_padding = 0
		scrollbar_log.style.maximal_height = 500
		scrollbar_log.style.maximal_width = 500
		for k,v in pairs(global.dylog) do
			scrollbar_log.add{type = "label", caption = v}
			scrollbar_log.add{type = "line", direction = "horizontal"}
		end
end

