mod_gui = require("__core__/lualib/mod-gui")


function DyDs_GUI_Toggle(player, id)
	Main_GUI(player, id)
end

function Dy_update_overhead_buttons(player)
	local button_flow = mod_gui.get_button_flow(player)
	if button_flow["dyworld_story"] then
		button_flow["dyworld_story"].destroy()
	end
	--button_flow.add{type = "sprite-button", name = "dyworld_story", sprite = "virtual-signal/dyworld_story_button", tooltip = {"looped-name.dyworld_story_button"}}

	if button_flow["dyworld_stats"] then
		button_flow["dyworld_stats"].destroy()
	end
	--button_flow.add{type = "sprite-button", name = "dyworld_stats", sprite = "virtual-signal/dyworld_stats_button", tooltip = {"looped-name.dyworld_stats_button"}}

	if button_flow["dyworld_smn"] then
		button_flow["dyworld_smn"].destroy()
	end
	--button_flow.add{type = "sprite-button", name = "dyworld_smn", sprite = "item/satellite", tooltip = {"looped-name.dyworld_smn_button"}}

	if button_flow["dyworld_dyson"] then
		button_flow["dyworld_dyson"].destroy()
	end
	--button_flow.add{type = "sprite-button", name = "dyworld_dyson", sprite = "item/satellite", tooltip = {"looped-name.dyworld_dyson_button"}}

	if button_flow["dyworld_personal"] then
		button_flow["dyworld_personal"].destroy()
	end
	button_flow.add{type = "sprite-button", name = "dyworld_personal", sprite = "virtual-signal/dyworld_button", tooltip = {"looped-name.dyworld_personal_button"}}

	if button_flow["dyworld_phase_forward"] then
		button_flow["dyworld_phase_forward"].destroy()
	end
	if debugger then
		button_flow.add{type = "sprite-button", name = "dyworld_phase_forward", sprite = "virtual-signal/dyworld_story_button", tooltip = "DEBUG: Phase Forward"}
	end
end