module("gui_4", package.seeall)
-- gui_4 is the needs window

function RefreshGUI(player, id)
	if player.gui.top.dyworld_needs_gui then
		player.gui.top.dyworld_needs_gui.destroy()
	end
	local force = player.force
	local frame = player.gui.top.add{type = "frame", name = "dyworld_needs_gui", direction = "vertical", caption = {"dyworld_needs_gui.title"}}
	local frameflow = frame.add{type = "flow", name = "flow", direction = "vertical"}
	frameflow.add{type = "label", caption = {"dyworld_needs_gui.food"}}
	frameflow.add{type = "progressbar", size = 26, value = (global.players[id].Food/global.players[id].Food_Max)}
	frameflow.add{type = "label", caption = {"dyworld_needs_gui.water"}}
	frameflow.add{type = "progressbar", size = 26, value = (global.players[id].Water/global.players[id].Water_Max)}
end

function CloseGUI(player, id)
	if player.gui.top.dyworld_needs_gui then
		player.gui.top.dyworld_needs_gui.destroy()
	end
end
