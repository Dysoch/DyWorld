module("gui_6", package.seeall)
-- gui_6 is the guide menu

function toggleGui(player)
	if player.gui.top.dyworld_guide_gui then
		player.gui.top.dyworld_guide_gui.destroy()
	else
	local force = player.force
	local frame = player.gui.top.add{type = "frame", name = "dyworld_guide_gui", direction = "vertical", caption = {"dyworld_guide_gui.title"}}
	local frameflow = frame.add{type = "flow", name = "flow", direction = "vertical"}
    local prioritized = frameflow.add{type = "scroll-pane", name = "prioritized", horizontal_scroll_policy = "never", vertical_scroll_policy = "auto"}
	prioritized.style.top_padding = 5
	prioritized.style.bottom_padding = 5
	prioritized.style.maximal_height = 192
	if not global.dyworld.Guide then global.dyworld.Guide = {} end
	local guide_max = 10
	local guide_amount = 0
	prioritized.add{type = "label", caption = {"dyworld_guide_gui.explain"}}
	if not global.dyworld.Guide["mining-drill"] then
		if guide_amount <= guide_max then
			guide_amount = guide_amount + 1
			prioritized.add{type = "label", caption = {"dyworld_guide_gui.mining-drill-1"}}
			prioritized.add{type = "label", caption = {"dyworld_guide_gui.mining-drill-2"}}
			prioritized.add{type = "label", caption = {"dyworld_guide_gui.mining-drill-3"}}
			prioritized.add{type = "label", caption = {"dyworld_guide_gui.mining-drill-4"}}
			prioritized.add{type = "label", caption = {"dyworld_guide_gui.mining-drill-5"}}
		end
	end
	if not global.dyworld.Guide["furnace"] then
		if guide_amount <= guide_max then
			guide_amount = guide_amount + 1
			prioritized.add{type = "label", caption = {"dyworld_guide_gui.furnace-1"}}
			if settings.startup["DyWorld_Metallurgy"].value then
				prioritized.add{type = "label", caption = {"dyworld_guide_gui.furnace-2"}}			
				prioritized.add{type = "label", caption = {"dyworld_guide_gui.furnace-3"}}			
			end
		end
	end
	end
end
