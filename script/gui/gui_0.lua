module("gui_0", package.seeall)
-- gui_0 is the debug menu

function toggleGui(player)
	if player.gui.top.dyworld_debug_gui then
		player.gui.top.dyworld_debug_gui.destroy()
	else
		local force = player.force
		local frame = player.gui.top.add{type = "frame", name = "dyworld_debug_gui", direction = "vertical", caption = "DyWorld Debug Menu"}
		local frameflow1 = frame.add{type = "flow", style = "dyworld_stats_list_flow", name = "debug_list_flow", direction = "vertical"}
		local scrollbar_debug = frameflow1.add{type = "scroll-pane", name = "", horizontal_scroll_policy = "never", vertical_scroll_policy = "auto"}
		scrollbar_debug.style.top_padding = 0
		scrollbar_debug.style.bottom_padding = 0
		scrollbar_debug.style.maximal_height = 250
		for _, NAME in pairs(global.debug) do
			scrollbar_debug.add{type = "label", caption = NAME}
		end
		--[[local frameflow2 = frame.add{type = "flow", style = "dyworld_stats_list_flow", name = "debug_item_list_flow", direction = "vertical"}
		local scrollbar_debug_items = frameflow1.add{type = "scroll-pane", name = "", horizontal_scroll_policy = "never", vertical_scroll_policy = "auto"}
		scrollbar_debug_items.style.top_padding = 0
		scrollbar_debug_items.style.bottom_padding = 0
		scrollbar_debug_items.style.maximal_height = 250
		for _, NAME in pairs(global.dyworld.Items) do
			scrollbar_debug_items.add{type = "label", caption = NAME}
		end]]--
	end
end
