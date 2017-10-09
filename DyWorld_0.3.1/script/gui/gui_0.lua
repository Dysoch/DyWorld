module("gui_0", package.seeall)
-- gui_0 is the debug menu

function toggleGui(player, id)
	if player.gui.top.dyworld_debug_gui_1 then
		player.gui.top.dyworld_debug_gui_1.destroy()
		player.gui.top.dyworld_debug_gui_2.destroy()
		player.gui.top.dyworld_debug_gui_3.destroy()
	else
		debug(player.name.." opened debug menu")
		local force = player.force
		local frame1 = player.gui.top.add{type = "frame", name = "dyworld_debug_gui_1", direction = "vertical", caption = "DyWorld Debug Menu"}
		local frame2 = player.gui.top.add{type = "frame", name = "dyworld_debug_gui_2", direction = "vertical", caption = "DyWorld Debug Menu"}
		local frame3 = player.gui.top.add{type = "frame", name = "dyworld_debug_gui_3", direction = "vertical", caption = "DyWorld Debug Menu"}
		local frameflow1 = frame1.add{type = "flow", style = "dyworld_stats_list_flow", name = "debug_list_flow", direction = "vertical"}
		local frameflow2 = frame2.add{type = "flow", style = "dyworld_stats_list_flow", name = "debug_list_flow", direction = "vertical"}
		local frameflow3 = frame3.add{type = "flow", style = "dyworld_stats_list_flow", name = "debug_list_flow", direction = "vertical"}
		local scrollbar_debug = frameflow1.add{type = "scroll-pane", name = "", horizontal_scroll_policy = "never", vertical_scroll_policy = "auto"}
		local scrollbar_debug2 = frameflow2.add{type = "scroll-pane", name = "", horizontal_scroll_policy = "never", vertical_scroll_policy = "auto"}
		local scrollbar_debug3 = frameflow3.add{type = "scroll-pane", name = "", horizontal_scroll_policy = "never", vertical_scroll_policy = "auto"}
		scrollbar_debug.style.top_padding = 0
		scrollbar_debug.style.bottom_padding = 0
		scrollbar_debug.style.maximal_height = 250
		scrollbar_debug2.style.top_padding = 0
		scrollbar_debug2.style.bottom_padding = 0
		scrollbar_debug2.style.maximal_height = 250
		scrollbar_debug3.style.top_padding = 0
		scrollbar_debug3.style.bottom_padding = 0
		scrollbar_debug3.style.maximal_height = 250
		for _, NAME in pairs(global.debug) do
			scrollbar_debug.add{type = "label", caption = NAME}
		end
		scrollbar_debug2.add{type = "label", caption = "Players: "..global.dyworld.Players}
		for k,v in pairs(global.players) do
			scrollbar_debug2.add{type = "label", caption = game.players[v.PlayerID].name.." XP: "..tostring(v.XP)}
			scrollbar_debug2.add{type = "label", caption = game.players[v.PlayerID].name.." Level: "..tostring(v.Level)}
			scrollbar_debug2.add{type = "label", caption = game.players[v.PlayerID].name.." Food: "..tostring(v.Food)}
			scrollbar_debug2.add{type = "label", caption = game.players[v.PlayerID].name.." Food Max: "..tostring(v.Food_Max)}
			scrollbar_debug2.add{type = "label", caption = game.players[v.PlayerID].name.." Food Use: "..tostring(v.Food_Use)}
			scrollbar_debug2.add{type = "label", caption = game.players[v.PlayerID].name.." Water: "..tostring(v.Water)}
			scrollbar_debug2.add{type = "label", caption = game.players[v.PlayerID].name.." Water Max: "..tostring(v.Water_Max)}
			scrollbar_debug2.add{type = "label", caption = game.players[v.PlayerID].name.." Water Use: "..tostring(v.Water_Use)}
			scrollbar_debug2.add{type = "label", caption = game.players[v.PlayerID].name.." Position: "..math.floor(tostring(v.PosX))..", "..math.floor(tostring(v.PosY))}
		end
		scrollbar_debug2.add{type = "label", caption = "Chunks: "..global.dyworld.Chunks}
		scrollbar_debug2.add{type = "label", caption = "Global Strength: "..global.dyworld.Strength}
		scrollbar_debug2.add{type = "label", caption = "Global Endurance: "..global.dyworld.Endurance}
		scrollbar_debug2.add{type = "label", caption = "Global Speed: "..global.dyworld.Speed}
		scrollbar_debug2.add{type = "label", caption = "Global Creations: "..global.dyworld.Creations}
		scrollbar_debug2.add{type = "label", caption = "Global Implants: "..global.dyworld.Implants}
		scrollbar_debug2.add{type = "label", caption = "Global Spirit: "..global.dyworld.Spirit}
		scrollbar_debug2.add{type = "label", caption = "Global Intelligence: "..global.dyworld.Intelligence}
		scrollbar_debug2.add{type = "label", caption = "Global Wisdom: "..global.dyworld.Wisdom}
		scrollbar_debug2.add{type = "label", caption = "Global Guile: "..global.dyworld.Guile}
		scrollbar_debug2.add{type = "label", caption = "Global Knowledge: "..global.dyworld.Knowledge}
		scrollbar_debug2.add{type = "label", caption = "Global XP: "..global.dyworld.XP}
		scrollbar_debug2.add{type = "label", caption = "Global Level: "..global.dyworld.Level}
		scrollbar_debug2.add{type = "label", caption = "Ship_1 Spawned: "..tostring(global.dyworld.Generation_Ship_1)}
		scrollbar_debug2.add{type = "label", caption = "Ship_2 Spawned: "..tostring(global.dyworld.Generation_Ship_2)}
		scrollbar_debug2.add{type = "label", caption = "Ship_3 Spawned: "..tostring(global.dyworld.Generation_Ship_3)}
		-- scrollbar_debug3.add is the modular test gui
		-- scrollbar_debug3.add{type = "label", caption = k..": "..v.."x"}
		for z,x in pairs(global.players) do
			for c,v in pairs(game.players[x.PlayerID].get_inventory(defines.inventory.player_main).get_contents()) do
				scrollbar_debug3.add{type = "label", caption = game.players[x.PlayerID].name..": "..c..": "..v.."x"}
			end
		end
	end
end
