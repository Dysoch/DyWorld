


function Main_GUI(player, id)
	if player.gui.top.DyDs_Main_GUI then
		player.gui.top.DyDs_Main_GUI.destroy()
	else
		local force = player.force
		local tabbed_pane = player.gui.top.add{type = "tabbed-pane", name = "DyDs_Main_GUI"}

-------------------------------- Game Stats TAB ----------------------------------------
		local tab1 = tabbed_pane.add{type="tab", caption="Game Stats"}
		local frameflow1 = tabbed_pane.add{type = "flow", name = "flow1", direction = "vertical"}
		tabbed_pane.add_tab(tab1, frameflow1)

-------------------------------- Player Bonuses TAB ------------------------------------
		local tab2 = tabbed_pane.add{type="tab", caption="Player Bonuses"}
		local frameflow2 = tabbed_pane.add{type = "flow", name = "flow2", direction = "vertical"}
		tabbed_pane.add_tab(tab2, frameflow2)

		
		if debugger then
-------------------------------- Crafting Debug TAB -----------------------------------
			local tab91 = tabbed_pane.add{type="tab", caption="Crafting Debug"}
			local frameflow91 = tabbed_pane.add{type = "flow", name = "flow91", direction = "vertical"}
			tabbed_pane.add_tab(tab91, frameflow91)
			local scrollbar_debug91 = frameflow91.add{type = "scroll-pane", name = "", horizontal_scroll_policy = "auto-and-reserve-space", vertical_scroll_policy = "auto-and-reserve-space"}
			scrollbar_debug91.style.top_padding = 0
			scrollbar_debug91.style.bottom_padding = 0
			scrollbar_debug91.style.maximal_height = 250
			scrollbar_debug91.style.maximal_width = 750
			for k,v in pairs(global.dyworld.game_stats.crafted_names) do
				scrollbar_debug91.add{type = "label", caption = k..": "..v.."x"}
			end
		
-------------------------------- Mining Debug TAB -------------------------------------
			local tab92 = tabbed_pane.add{type="tab", caption="Mining Debug"}
			local frameflow92 = tabbed_pane.add{type = "flow", name = "flow92", direction = "vertical"}
			tabbed_pane.add_tab(tab92, frameflow92)
			local scrollbar_debug92 = frameflow92.add{type = "scroll-pane", name = "", horizontal_scroll_policy = "auto-and-reserve-space", vertical_scroll_policy = "auto-and-reserve-space"}
			scrollbar_debug92.style.top_padding = 0
			scrollbar_debug92.style.bottom_padding = 0
			scrollbar_debug92.style.maximal_height = 250
			scrollbar_debug92.style.maximal_width = 750
			for k,v in pairs(global.dyworld.game_stats.mined_names) do
				scrollbar_debug92.add{type = "label", caption = k..": "..v.."x"}
			end

-------------------------------- Building Debug TAB -----------------------------------
			local tab93 = tabbed_pane.add{type="tab", caption="Building Debug"}
			local frameflow93 = tabbed_pane.add{type = "flow", name = "flow93", direction = "vertical"}
			tabbed_pane.add_tab(tab93, frameflow93)
			local scrollbar_debug93 = frameflow93.add{type = "scroll-pane", name = "", horizontal_scroll_policy = "auto-and-reserve-space", vertical_scroll_policy = "auto-and-reserve-space"}
			scrollbar_debug93.style.top_padding = 0
			scrollbar_debug93.style.bottom_padding = 0
			scrollbar_debug93.style.maximal_height = 250
			scrollbar_debug93.style.maximal_width = 750
			for k,v in pairs(global.dyworld.game_stats.build_names) do
				scrollbar_debug93.add{type = "label", caption = k..": "..v.."x"}
			end

-------------------------------- Killing Debug TAB ------------------------------------
			local tab94 = tabbed_pane.add{type="tab", caption="Killing Debug"}
			local frameflow94 = tabbed_pane.add{type = "flow", name = "flow94", direction = "vertical"}
			tabbed_pane.add_tab(tab94, frameflow94)
			local scrollbar_debug94 = frameflow94.add{type = "scroll-pane", name = "", horizontal_scroll_policy = "auto-and-reserve-space", vertical_scroll_policy = "auto-and-reserve-space"}
			scrollbar_debug94.style.top_padding = 0
			scrollbar_debug94.style.bottom_padding = 0
			scrollbar_debug94.style.maximal_height = 250
			scrollbar_debug94.style.maximal_width = 750
			for k,v in pairs(global.dyworld.game_stats.killed_names) do
				scrollbar_debug94.add{type = "label", caption = k..": "..v.."x"}
			end
		
-------------------------------- Debug TAB ---------------------------------------------
			local tab99 = tabbed_pane.add{type="tab", caption="Debug"}
			local frameflow99 = tabbed_pane.add{type = "flow", name = "flow99", direction = "vertical"}
			tabbed_pane.add_tab(tab99, frameflow99)
			local scrollbar_debug99 = frameflow99.add{type = "scroll-pane", name = "", horizontal_scroll_policy = "auto-and-reserve-space", vertical_scroll_policy = "auto-and-reserve-space"}
			scrollbar_debug99.style.top_padding = 0
			scrollbar_debug99.style.bottom_padding = 0
			scrollbar_debug99.style.maximal_height = 250
			scrollbar_debug99.style.maximal_width = 750
			for _, NAME in pairs(global.debug) do
				scrollbar_debug99.add{type = "label", caption = NAME}
			end
		end
	end
end
