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
	local frameflow = frame.add{type = "flow", name = "flow", direction = "vertical"}
    local scroll = frameflow.add{type = "scroll-pane", name = "", horizontal_scroll_policy = "never", vertical_scroll_policy = "auto"}
	scroll.style.top_padding = 5
	scroll.style.bottom_padding = 5
	scroll.style.maximal_height = 300
		if global.RoadmapTotal == 100 then
			frameflow.add{type = "label", style = "dyworld_stats_divider_header_label", caption = "Testing Phase! (Playing, Balancing and Graphics)"}
		else
			frameflow.add{type = "label", style = "dyworld_stats_divider_header_label", caption = {"dyworld_roadmap_gui.roadmap_999", (global.RoadmapTotal)}}
		end
		for k,v in pairs(global.Roadmap) do
			scroll.add{type = "label", caption = "("..v.Progress.."%) "..v.Name.."" }
		end
	end
end
