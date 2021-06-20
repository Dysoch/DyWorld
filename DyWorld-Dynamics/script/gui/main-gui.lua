


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
		
		
		if global.dyworld.game_stats.sector_scanned > 0 then
			frameflow1.add{type = "label", caption = "Sectors Scanned: "..global.dyworld.game_stats.sector_scanned}
		end
		if global.dyworld.game_stats.rockets_launched > 0 then
			frameflow1.add{type = "label", caption = "Rockets Launched: "..global.dyworld.game_stats.rockets_launched}
		end
		
		if debugger then
			frameflow1.add{type = "label", caption = "Chunks: "..global.dyworld.game_stats.chunks}
			frameflow1.add{type = "label", caption = "Difficulty of game: "..global.dyworld.game_stats.difficulty}
		end
		
		frameflow1.add{type = "label", caption = "Game Days: "..global.dyworld.game_stats.days}
		frameflow1.add{type = "label", caption = "Game Kills: "..global.dyworld.game_stats.killed_amount}
		frameflow1.add{type = "line", direction = "horizontal"}

-------------------------------- Player stats TAB -------------------------------------
		local tab2 = tabbed_pane.add{type="tab", caption="Player Stats"}
		local frameflow2 = tabbed_pane.add{type = "flow", name = "flow2", direction = "vertical"}
		tabbed_pane.add_tab(tab2, frameflow2)
		
		frameflow2.add{type = "label", caption = "Water:"}
		frameflow2.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].water/global.dyworld.players[id].water_max), tooltip = "Water: "..Round(global.dyworld.players[id].water, 2)..", Max Water: "..global.dyworld.players[id].water_max..", Use Rate: "..global.dyworld.players[id].water_rate.." per second"}
		
		frameflow2.add{type = "label", caption = "Food:"}
		frameflow2.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].food/global.dyworld.players[id].food_max), tooltip = "Food: "..Round(global.dyworld.players[id].food, 2)..", Max Food: "..global.dyworld.players[id].food_max..", Use Rate: "..global.dyworld.players[id].food_rate.." per second"}
		frameflow2.add{type = "line", direction = "horizontal"}
		
		
		if global.dyworld.players[id].crafted > 0 then
			frameflow2.add{type = "label", caption = "Crafted: "..global.dyworld.players[id].crafted}
		end
		if global.dyworld.players[id].mined > 0 then
			frameflow2.add{type = "label", caption = "Mined: "..global.dyworld.players[id].mined}
		end
		if global.dyworld.players[id].picked > 0 then
			frameflow2.add{type = "label", caption = "Picked Up: "..global.dyworld.players[id].picked}
		end
		if global.dyworld.players[id].build > 0 then
			frameflow2.add{type = "label", caption = "Built: "..global.dyworld.players[id].build}
		end
		if global.dyworld.players[id].killed > 0 then
			frameflow2.add{type = "label", caption = "Personal Killed: "..global.dyworld.players[id].killed}
		end
		frameflow2.add{type = "line", direction = "horizontal"}
		frameflow2.add{type = "label", caption = "Position: "..math.floor(global.dyworld.players[id].posx).." , "..math.floor(global.dyworld.players[id].posy)}
		frameflow2.add{type = "label", caption = "Distance Traveled: "..Round(global.dyworld.players[id].distance, 2).." Km"}
		
		if debugger then
			frameflow2.add{type = "label", caption = "Strength: "..global.dyworld.players[id].strength}
			frameflow2.add{type = "label", caption = "Constitution: "..global.dyworld.players[id].constitution}
			frameflow2.add{type = "label", caption = "Dexterity: "..global.dyworld.players[id].dexterity}
			frameflow2.add{type = "label", caption = "Intelligence: "..global.dyworld.players[id].intelligence}
			frameflow2.add{type = "label", caption = "Wisdom: "..global.dyworld.players[id].wisdom}
			frameflow2.add{type = "label", caption = "Charisma: "..global.dyworld.players[id].charisma}
		end

-------------------------------- Player Bonuses TAB ------------------------------------
		local tab3 = tabbed_pane.add{type="tab", caption="Player Bonuses"}
		local frameflow3 = tabbed_pane.add{type = "flow", name = "flow3", direction = "vertical"}
		tabbed_pane.add_tab(tab3, frameflow3)
		if game.players[id].character then
			frameflow3.add{type = "label", caption = "Crafting Bonus: "..(Round(game.players[id].character_crafting_speed_modifier+1, 2))}
			frameflow3.add{type = "label", caption = "Mining Bonus: "..(Round(game.players[id].character_mining_speed_modifier+1, 2))}
			frameflow3.add{type = "label", caption = "Health: "..(game.entity_prototypes["character"].max_health + game.players[id].character_health_bonus)}
			frameflow3.add{type = "label", caption = "Inventory Slots: "..(game.entity_prototypes["character"].get_inventory_size(1) + game.players[id].character_inventory_slots_bonus)}
		end
		
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
