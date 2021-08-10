



function Close_SMN_GUI(player, id)
	if player.gui.top.DyDs_SMN_GUI then
		player.gui.top.DyDs_SMN_GUI.destroy()
	end
end

function SMN_GUI(player, id)
if game.forces.player.technologies["advanced-asteroid-mining"].researched or debugger then
	local force = player.force
	local surface = game.players[id].surface.name
	local tabbed_pane = player.gui.top.add{type = "tabbed-pane", name = "DyDs_SMN_GUI"}

-------------------------------- Total TAB ----------------------------------------
	local tab1 = tabbed_pane.add{type = "tab", caption = "Ores Total"}
	local frameflow1 = tabbed_pane.add{type = "flow", name = "flow1", direction = "vertical"}
	tabbed_pane.add_tab(tab1, frameflow1)
	
	frameflow1.add{type = "label", caption = {"gui-stats.space-mining-time"}}

if global.dyworld.game_stats.space_mining then
-------------------------------- Ore Tier 1 TAB -------------------------------------
	local tab2 = tabbed_pane.add{type = "tab", caption = "Ores Tier 1"}
	local frameflow2 = tabbed_pane.add{type = "flow", name = "flow2", direction = "vertical"}
	tabbed_pane.add_tab(tab2, frameflow2)
			
	for k,v in pairs(global.dyworld.game_stats.space_mining) do
		if (Dy_Metals[k] and Dy_Metals[k].Ore_Tier == 1) then
			frameflow2.add{type = "line", direction = "horizontal"}
			frameflow2.add{type = "progressbar", size = 26, value = (Round((v.pure_mined + v.impure_mined), 2)/Round((v.pure_storage + v.impure_storage), 2)), style = "dy-bar-1", caption = {"gui-stats.space-mining-caption", {"looped-name."..k}, math.floor(v.pure_mined + v.impure_mined)}, tooltip = {"gui-stats.space-mining-tooltip", {"looped-name."..k}, math.floor(v.impure_mined), v.impure_storage, Round(v.impure_rate, 0), math.floor(v.pure_mined), v.pure_storage, Round(v.pure_rate, 0), Round((v.efficiency * 100), 2)}}
		end
	end

-------------------------------- Ore Tier 2 TAB -------------------------------------
	local tab3 = tabbed_pane.add{type = "tab", caption = "Ores Tier 2"}
	local frameflow3 = tabbed_pane.add{type = "flow", name = "flow3", direction = "vertical"}
	tabbed_pane.add_tab(tab3, frameflow3)
			
	for k,v in pairs(global.dyworld.game_stats.space_mining) do
		if (Dy_Metals[k] and Dy_Metals[k].Ore_Tier == 2) then
			frameflow3.add{type = "line", direction = "horizontal"}
			frameflow3.add{type = "progressbar", size = 26, value = (Round((v.pure_mined + v.impure_mined), 2)/Round((v.pure_storage + v.impure_storage), 2)), style = "dy-bar-1", caption = {"gui-stats.space-mining-caption", {"looped-name."..k}, math.floor(v.pure_mined + v.impure_mined)}, tooltip = {"gui-stats.space-mining-tooltip", {"looped-name."..k}, math.floor(v.impure_mined), v.impure_storage, Round(v.impure_rate, 0), math.floor(v.pure_mined), v.pure_storage, Round(v.pure_rate, 0), Round((v.efficiency * 100), 2)}}
		end
	end

-------------------------------- Ore Tier 3 TAB -------------------------------------
	local tab4 = tabbed_pane.add{type = "tab", caption = "Ores Tier 3"}
	local frameflow4 = tabbed_pane.add{type = "flow", name = "flow4", direction = "vertical"}
	tabbed_pane.add_tab(tab4, frameflow4)
			
	for k,v in pairs(global.dyworld.game_stats.space_mining) do
		if (Dy_Metals[k] and Dy_Metals[k].Ore_Tier == 3) then
			frameflow4.add{type = "line", direction = "horizontal"}
			frameflow4.add{type = "progressbar", size = 26, value = (Round((v.pure_mined + v.impure_mined), 2)/Round((v.pure_storage + v.impure_storage), 2)), style = "dy-bar-1", caption = {"gui-stats.space-mining-caption", {"looped-name."..k}, math.floor(v.pure_mined + v.impure_mined)}, tooltip = {"gui-stats.space-mining-tooltip", {"looped-name."..k}, math.floor(v.impure_mined), v.impure_storage, Round(v.impure_rate, 0), math.floor(v.pure_mined), v.pure_storage, Round(v.pure_rate, 0), Round((v.efficiency * 100), 2)}}
		end
	end

-------------------------------- Ore Tier 4 TAB -------------------------------------
	local tab5 = tabbed_pane.add{type = "tab", caption = "Ores Tier 4"}
	local frameflow5 = tabbed_pane.add{type = "flow", name = "flow5", direction = "vertical"}
	tabbed_pane.add_tab(tab5, frameflow5)
			
	for k,v in pairs(global.dyworld.game_stats.space_mining) do
		if (Dy_Metals[k] and Dy_Metals[k].Ore_Tier == 4) then
			frameflow5.add{type = "line", direction = "horizontal"}
			frameflow5.add{type = "progressbar", size = 26, value = (Round((v.pure_mined + v.impure_mined), 2)/Round((v.pure_storage + v.impure_storage), 2)), style = "dy-bar-1", caption = {"gui-stats.space-mining-caption", {"looped-name."..k}, math.floor(v.pure_mined + v.impure_mined)}, tooltip = {"gui-stats.space-mining-tooltip", {"looped-name."..k}, math.floor(v.impure_mined), v.impure_storage, Round(v.impure_rate, 0), math.floor(v.pure_mined), v.pure_storage, Round(v.pure_rate, 0), Round((v.efficiency * 100), 2)}}
		end
	end

-------------------------------- Ore Tier 5 TAB -------------------------------------
	local tab6 = tabbed_pane.add{type = "tab", caption = "Ores Tier 5"}
	local frameflow6 = tabbed_pane.add{type = "flow", name = "flow6", direction = "vertical"}
	tabbed_pane.add_tab(tab6, frameflow6)
			
	for k,v in pairs(global.dyworld.game_stats.space_mining) do
		if (Dy_Metals[k] and Dy_Metals[k].Ore_Tier == 5) then
			frameflow6.add{type = "line", direction = "horizontal"}
			frameflow6.add{type = "progressbar", size = 26, value = (Round((v.pure_mined + v.impure_mined), 2)/Round((v.pure_storage + v.impure_storage), 2)), style = "dy-bar-1", caption = {"gui-stats.space-mining-caption", {"looped-name."..k}, math.floor(v.pure_mined + v.impure_mined)}, tooltip = {"gui-stats.space-mining-tooltip", {"looped-name."..k}, math.floor(v.impure_mined), v.impure_storage, Round(v.impure_rate, 0), math.floor(v.pure_mined), v.pure_storage, Round(v.pure_rate, 0), Round((v.efficiency * 100), 2)}}
		end
	end
end
end
end

