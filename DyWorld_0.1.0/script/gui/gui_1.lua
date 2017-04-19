module("gui_1", package.seeall)
-- gui_1 is the stats menu
require "script/stats/functions"

function toggleGui(player, id)
	if player.gui.top.dyworld_stats_gui then
		player.gui.top.dyworld_stats_gui.destroy()
	end
	local frame = player.gui.top.add{type = "frame", name = "dyworld_stats_gui", direction = "vertical", caption = {"dyworld_stats_gui.title"}}
	local frameflow = frame.add{type = "flow", style = "dyworld_stats_list_flow", name = "flow", direction = "vertical"}
	stats_functions.BodySkills(id)
    local scrollbar = frameflow.add{type = "scroll-pane", name = "", horizontal_scroll_policy = "never", vertical_scroll_policy = "auto"}
	scrollbar.style.top_padding = 5
	scrollbar.style.bottom_padding = 5
	scrollbar.style.maximal_height = 192
	-- labels for stats
	frameflow.add{type = "label", style = "dyworld_stats_divider_header_label", caption = {"dyworld_stats_gui.stats_1"}}
	if (#game.players <= 1) then
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.stats_crafted", (global.players[id].stats.crafted or 0)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.stats_mined", (global.players[id].stats.mined or 0)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.stats_build", (global.players[id].stats.build or 0)}}
	else
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.stats_crafted_mp", (global.players[id].stats.crafted or 0), (global.stats.crafted or 0)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.stats_mined_mp", (global.players[id].stats.mined or 0), (global.stats.mined or 0)}}
		frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.stats_build_mp", (global.players[id].stats.build or 0), (global.stats.build or 0)}}
	end
	frameflow.add{type = "label", style = "dyworld_stats_divider_header_label", caption = {"dyworld_stats_gui.stats_2"}}
	frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.stats_killed", (global.stats.killed or 0)}}
	frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.stats_scanned", (global.stats.scanned or 0)}}
	frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.stats_research", (global.stats.research or 0)}}
	frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.stats_ghostbuild", (global.stats.ghostbuild or 0)}}
	frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.stats_ghostmined", (global.stats.ghostmined or 0)}}
	stats_functions.BodySkills(id)
	frameflow.add{type = "label", style = "dyworld_stats_divider_header_label", caption = {"dyworld_stats_gui.body"}}
	frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_physical"}}
	frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_strength", (global.players[id].physical.strength)}}
	frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_endurance", (global.players[id].physical.endurance)}}
	frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_speed", (global.players[id].physical.speed)}}
	frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_creations", (global.players[id].physical.creations)}}
	frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_implants", (global.players[id].physical.implants)}}
	frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_mystical"}}
	frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_spirit", (global.players[id].mystical.spirit)}}
	frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_intelligence", (global.players[id].mystical.intelligence)}}
	frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_wisdom", (global.players[id].mystical.wisdom)}}
	frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_guile", (global.players[id].mystical.guile)}}
	frameflow.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_knowledge", (global.players[id].mystical.knowledge)}}
end
