


function Close_Main_GUI(player, id)
	if player.gui.top.DyDs_Main_GUI then
		player.gui.top.DyDs_Main_GUI.destroy()
	end
end

function Main_GUI(player, id)
		local force = player.force
		local tabbed_pane = player.gui.top.add{type = "tabbed-pane", name = "DyDs_Main_GUI"}

-------------------------------- Game Stats TAB ----------------------------------------
		local tab1 = tabbed_pane.add{type="tab", caption="Game Stats"}
		local frameflow1 = tabbed_pane.add{type = "flow", name = "flow1", direction = "vertical"}
		tabbed_pane.add_tab(tab1, frameflow1)
		
		frameflow1.add{type = "label", caption = "Sectors Scanned: "..global.dyworld.game_stats.sector_scanned}
		if debugger then
			frameflow1.add{type = "label", caption = "Chunks: "..global.dyworld.game_stats.chunks}
		end
		frameflow1.add{type = "label", caption = "Game Days: "..global.dyworld.game_stats.days}
		frameflow1.add{type = "label", caption = "Game Kills: "..global.dyworld.game_stats.killed_amount}
		frameflow1.add{type = "line", direction = "horizontal"}

-------------------------------- Player stats TAB -------------------------------------
		local tab2 = tabbed_pane.add{type="tab", caption="Player Stats"}
		local frameflow2 = tabbed_pane.add{type = "flow", name = "flow2", direction = "vertical"}
		tabbed_pane.add_tab(tab2, frameflow2)
		
		frameflow2.add{type = "label", caption = "Crafted: "..global.dyworld.players[id].crafted}
		frameflow2.add{type = "label", caption = "Mined: "..global.dyworld.players[id].mined}
		frameflow2.add{type = "label", caption = "Built: "..global.dyworld.players[id].build}
		frameflow2.add{type = "label", caption = "Personal Killed: "..global.dyworld.players[id].killed}
		frameflow2.add{type = "line", direction = "horizontal"}
		frameflow2.add{type = "label", caption = "Position: "..math.floor(global.dyworld.players[id].posx).." , "..math.floor(global.dyworld.players[id].posy)}

-------------------------------- Player Bonuses TAB ------------------------------------
		local tab3 = tabbed_pane.add{type="tab", caption="Player Bonuses"}
		local frameflow3 = tabbed_pane.add{type = "flow", name = "flow3", direction = "vertical"}
		tabbed_pane.add_tab(tab3, frameflow3)

		
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
			if global.debug then
				for _, NAME in pairs(global.debug) do
					scrollbar_debug99.add{type = "label", caption = NAME}
				end
			end
		end
end
