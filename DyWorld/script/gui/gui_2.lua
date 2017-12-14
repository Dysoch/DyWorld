module("gui_2", package.seeall)
-- gui_2 is the skills menu

function toggleGui(player)
	if player.gui.top.dyworld_skills_gui then
		player.gui.top.dyworld_skills_gui.destroy()
	else
	local force = player.force
	local frame = player.gui.top.add{type = "frame", name = "dyworld_skills_gui", direction = "vertical", caption = {"dyworld_skills_gui.title"}}
	local frameflow = frame.add{type = "flow", name = "flow", direction = "vertical"}
	-- checkboxes
		-- frameflow.add{type = "checkbox", name = "dyworld_stats_enabled", caption = {"dyworld_skills_gui.enabled"}, tooltip = {"dyworld_skills_gui.enabled_tooltip"}, state = config.enabled or false}
	-- labels for stats
		frameflow.add{type = "label", style = "dyworld_stats_divider_header_label", caption = {"dyworld_skills_gui.explain"}}
    local prioritized = frameflow.add{type = "scroll-pane", name = "prioritized", horizontal_scroll_policy = "never", vertical_scroll_policy = "auto"}
	prioritized.style.top_padding = 5
	prioritized.style.bottom_padding = 5
	prioritized.style.maximal_height = 192
	end
end
