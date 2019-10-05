-- gui_2 is the skills menu

function gui_2_toggleGui(player, id)
	if player.gui.top.dyworld_skills_gui then
		player.gui.top.dyworld_skills_gui.destroy()
	else
	local force = player.force
	local frame = player.gui.top.add{type = "frame", name = "dyworld_skills_gui", direction = "vertical", caption = {"dyworld_skills_gui.title"}}
	local frameflow = frame.add{type = "flow", name = "flow", direction = "vertical"}
	-- checkboxes
		-- frameflow.add{type = "checkbox", name = "dyworld_stats_enabled", caption = {"dyworld_skills_gui.enabled"}, tooltip = {"dyworld_skills_gui.enabled_tooltip"}, state = config.enabled or false}
	-- labels for stats
	frameflow.add{type = "label", style = "dyworld_label", caption = {"dyworld_skills_gui.explain"}}
	frameflow.add{type = "label", style = "dyworld_label", caption = {"dyworld_skills_gui.skill_points", global.players[id].Skill_Points}}
    local prioritized = frameflow.add{type = "scroll-pane", name = "prioritized", horizontal_scroll_policy = "never", vertical_scroll_policy = "auto"}
	prioritized.style.top_padding = 5
	prioritized.style.bottom_padding = 5
	prioritized.style.maximal_height = 192
	for k,v in pairs(global.players[id].Skills) do
		----- RUNNING SKILL -----
		if v.CD_On then
			prioritized.add{type = "label", style = "dyworld_label", caption = {"dyworld_skills_gui."..v.Name.."-cd", v.CD}}
		elseif (v.Active == false or v.Active == nil) and v.Active_Time then
			if (global.players[id].Skill_Points >= v.SP_Usage) then
				prioritized.add{type = "button", name = v.Name, style = "dyworld_skills_sprite_button", caption = {"dyworld_skills_gui."..v.Name, v.Active_Time, v.SP_Usage}}
			end
		elseif (v.Active == false or v.Active == nil) and v.Strength then
			if (global.players[id].Skill_Points >= v.SP_Usage) then
				prioritized.add{type = "button", name = v.Name, style = "dyworld_skills_sprite_button", caption = {"dyworld_skills_gui."..v.Name, v.Strength, v.SP_Usage}}
			end
		elseif v.Active then
			prioritized.add{type = "label", style = "dyworld_label", caption = {"dyworld_skills_gui."..v.Name.."-active", v.Active_Time_Left}}
		else
		end
	end
	end
end
