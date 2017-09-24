module("gui_0", package.seeall)
-- gui_0 is the debug menu

function toggleGui(player)
	if player.gui.top.dyworld_debug_gui_1 then
		player.gui.top.dyworld_debug_gui_1.destroy()
		player.gui.top.dyworld_debug_gui_2.destroy()
	else
		local force = player.force
		local frame1 = player.gui.top.add{type = "frame", name = "dyworld_debug_gui_1", direction = "vertical", caption = "DyWorld Debug Menu"}
		local frame2 = player.gui.top.add{type = "frame", name = "dyworld_debug_gui_2", direction = "vertical", caption = "DyWorld Debug Menu"}
		local frameflow1 = frame1.add{type = "flow", style = "dyworld_stats_list_flow", name = "debug_list_flow", direction = "vertical"}
		local frameflow2 = frame2.add{type = "flow", style = "dyworld_stats_list_flow", name = "debug_list_flow", direction = "vertical"}
		local scrollbar_debug = frameflow1.add{type = "scroll-pane", name = "", horizontal_scroll_policy = "never", vertical_scroll_policy = "auto"}
		scrollbar_debug.style.top_padding = 0
		scrollbar_debug.style.bottom_padding = 0
		scrollbar_debug.style.maximal_height = 250
		for _, NAME in pairs(global.debug) do
			scrollbar_debug.add{type = "label", caption = NAME}
		end
		frameflow2.add{type = "label", caption = "Players: "..global.dyworld.Players}
		for k,v in pairs(global.players) do
			frameflow2.add{type = "label", caption = game.players[v.PlayerID].name.." level: "..tostring(v.Level)}
		end
		frameflow2.add{type = "label", caption = "Chunks: "..global.dyworld.Chunks}
		frameflow2.add{type = "label", caption = "Global Strength: "..global.dyworld.Strength}
		frameflow2.add{type = "label", caption = "Global Endurance: "..global.dyworld.Endurance}
		frameflow2.add{type = "label", caption = "Global Speed: "..global.dyworld.Speed}
		frameflow2.add{type = "label", caption = "Global Creations: "..global.dyworld.Creations}
		frameflow2.add{type = "label", caption = "Global Implants: "..global.dyworld.Implants}
		frameflow2.add{type = "label", caption = "Global Spirit: "..global.dyworld.Spirit}
		frameflow2.add{type = "label", caption = "Global Intelligence: "..global.dyworld.Intelligence}
		frameflow2.add{type = "label", caption = "Global Wisdom: "..global.dyworld.Wisdom}
		frameflow2.add{type = "label", caption = "Global Guile: "..global.dyworld.Guile}
		frameflow2.add{type = "label", caption = "Global Knowledge: "..global.dyworld.Knowledge}
		frameflow2.add{type = "label", caption = "Global XP: "..global.dyworld.XP}
		frameflow2.add{type = "label", caption = "Global Level: "..global.dyworld.Level}
		frameflow2.add{type = "label", caption = "Ship_1 Spawned: "..tostring(global.dyworld.Generation_Ship_1)}
		frameflow2.add{type = "label", caption = "Ship_2 Spawned: "..tostring(global.dyworld.Generation_Ship_2)}
		frameflow2.add{type = "label", caption = "Ship_3 Spawned: "..tostring(global.dyworld.Generation_Ship_3)}
	end
end
