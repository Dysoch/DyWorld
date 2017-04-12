module("gui_3", package.seeall)
require "roadmap"
-- gui_3 is the Roadmap

function toggleGui(player)
	if player.gui.top.dyworld_roadmap_gui then
		player.gui.top.dyworld_roadmap_gui.destroy()
	else
		roadmap.Roadmap()
	local force = player.force
	local frame = player.gui.top.add{type = "frame", name = "dyworld_roadmap_gui", direction = "vertical", caption = {"dyworld_roadmap_gui.title"}}
	local frameflow = frame.add{type = "flow", style = "dyworld_stats_list_flow", name = "flow", direction = "vertical"}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_roadmap_gui.roadmap_000a"}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_roadmap_gui.roadmap_000b"}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_roadmap_gui.roadmap_001", (global.Roadmap.Stats)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_roadmap_gui.roadmap_002", (global.Roadmap.Skills)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_roadmap_gui.roadmap_003", (global.Roadmap.Science)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_roadmap_gui.roadmap_004", (global.Roadmap.GUI)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_roadmap_gui.roadmap_005", (global.Roadmap.Story)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_roadmap_gui.roadmap_006", (global.Roadmap.Warfare)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_roadmap_gui.roadmap_007", (global.Roadmap.Ruins)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_roadmap_gui.roadmap_008", (global.Roadmap.Natives)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_roadmap_gui.roadmap_009", (global.Roadmap.Groundwork)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_roadmap_gui.roadmap_010", (global.Roadmap.Formula)}}
		frameflow.add{type = "label", style = "dyworld_stats_divider_header_label", caption = {"dyworld_roadmap_gui.roadmap_999", (global.Roadmap.Total)}}
    local prioritized = frameflow.add{type = "scroll-pane", name = "prioritized", horizontal_scroll_policy = "never", vertical_scroll_policy = "auto"}
	prioritized.style.top_padding = 5
	prioritized.style.bottom_padding = 5
	prioritized.style.maximal_height = 192
	end
end
