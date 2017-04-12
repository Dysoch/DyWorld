module("gui_1", package.seeall)
-- gui_1 is the stats menu
require "script/stats/functions"

function toggleGui(player)
	if player.gui.top.dyworld_stats_gui then
		player.gui.top.dyworld_stats_gui.destroy()
	else
	local force = player.force
	local frame = player.gui.top.add{type = "frame", name = "dyworld_stats_gui", direction = "vertical", caption = {"dyworld_stats_gui.title"}}
	local frameflow = frame.add{type = "flow", style = "dyworld_stats_list_flow", name = "flow", direction = "vertical"}
	stats_functions.BodySkills()
	-- checkboxes
		-- frameflow.add{type = "checkbox", name = "dyworld_stats_enabled", caption = {"dyworld_stats_gui.enabled"}, tooltip = {"dyworld_stats_gui.enabled_tooltip"}, state = config.enabled or false}
	-- labels for stats
		frameflow.add{type = "label", style = "dyworld_stats_divider_header_label", caption = {"dyworld_stats_gui.stats"}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.stats_crafted", (global.stats.crafted or 0)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.stats_mined", (global.stats.mined or 0)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.stats_build", (global.stats.build or 0)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.stats_killed", (global.stats.killed or 0)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.stats_scanned", (global.stats.scanned or 0)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.stats_ghostbuild", (global.stats.ghostbuild or 0)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.stats_ghostmined", (global.stats.ghostmined or 0)}}
		frameflow.add{type = "label", style = "dyworld_stats_divider_header_label", caption = {"dyworld_stats_gui.body"}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_physical"}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_strength", (global.body.physical.strength)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_endurance", (global.body.physical.endurance)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_speed", (global.body.physical.speed)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_creations", (global.body.physical.creations)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_implants", (global.body.physical.implants)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_mystical"}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_spirit", (global.body.mystical.spirit)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_intelligence", (global.body.mystical.intelligence)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_wisdom", (global.body.mystical.wisdom)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_guile", (global.body.mystical.guile)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_knowledge", (global.body.mystical.knowledge)}}
    local prioritized = frameflow.add{type = "scroll-pane", name = "prioritized", horizontal_scroll_policy = "never", vertical_scroll_policy = "auto"}
	prioritized.style.top_padding = 5
	prioritized.style.bottom_padding = 5
	prioritized.style.maximal_height = 192
	end
end
