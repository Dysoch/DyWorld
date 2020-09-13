


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
		
		local scrollbar_log = frameflow1.add{type = "scroll-pane", name = "", horizontal_scroll_policy = "auto-and-reserve-space", vertical_scroll_policy = "auto-and-reserve-space"}
		scrollbar_log.style.top_padding = 0
		scrollbar_log.style.bottom_padding = 0
		scrollbar_log.style.maximal_height = 500
		scrollbar_log.style.maximal_width = 1500
		for k,v in pairs(global.dylog) do
			scrollbar_log.add{type = "label", caption = v}
			scrollbar_log.add{type = "line", direction = "horizontal"}
		end
end

