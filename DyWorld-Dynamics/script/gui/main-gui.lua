

local function Dyson_Power_Check(VAR)
	if VAR >= 1000000000 then
		local Return = VAR / 1000000000
		return "[color=blue]"..Round(Return, 2).."[/color] PW"
	elseif VAR >= 1000000 then
		local Return = VAR / 1000000
		return "[color=blue]"..Round(Return, 2).."[/color] TW"
	elseif VAR >= 1000 then
		local Return = VAR / 1000
		return "[color=blue]"..Round(Return, 2).."[/color] GW"
	elseif VAR < 1 then
		local Return = VAR * 1000
		return "[color=blue]"..Round(Return, 2).."[/color] kW"
	else 
		return "[color=blue]"..Round(VAR, 2).."[/color] MW"
	end
end

local function Time_Check(time)
	local seconds_start = math.floor(time)
	local minutes_start = math.floor(seconds_start/60)
	local hours = math.floor(minutes_start/60)
	local minutes = (minutes_start-(hours*60))
	local seconds = (seconds_start-(minutes_start*60))
	return (hours..":"..minutes..":"..seconds)
end

local function Check_State(id, IMPLANT, Tier)
    local GloPla = global.dyworld.players[id].implants
    GloImplant = IMPLANT.."-"..Tier
    if GloPla[GloImplant].enabled == true then
        if Tier == 1 then return "[color=green]Mk I[/color]"
        elseif Tier == 2 then return "[color=green]Mk II[/color]"
        elseif Tier == 3 then return "[color=green]Mk III[/color]"
        elseif Tier == 4 then return "[color=green]Mk IV[/color]"
        elseif Tier == 5 then return "[color=green]Mk V[/color]"
        end
    else
        if Tier == 1 then return "[color=red]Mk I[/color]"
        elseif Tier == 2 then return "[color=red]Mk II[/color]"
        elseif Tier == 3 then return "[color=red]Mk III[/color]"
        elseif Tier == 4 then return "[color=red]Mk IV[/color]"
        elseif Tier == 5 then return "[color=red]Mk V[/color]"
        end
    end
end

local function Check_Implant_State_2(id, IMPLANT)	
    local GloPla = global.dyworld.players[id].implants
    if GloPla[IMPLANT].enabled == true then
		return "[color=green]✔[/color]"
	else
		return "[color=red]✘[/color]"
	end
end

local function Check_Implant_State(id, IMPLANT)
    local GloPla = global.dyworld.players[id].implants
    local GloPla_1 = Check_State(id, IMPLANT, 1)
    local GloPla_2 = Check_State(id, IMPLANT, 2)
    local GloPla_3 = Check_State(id, IMPLANT, 3)
    local GloPla_4 = Check_State(id, IMPLANT, 4)
    local GloPla_5 = Check_State(id, IMPLANT, 5)
    return GloPla_1..", "..GloPla_2..", "..GloPla_3..", "..GloPla_4..", "..GloPla_5
end

function Close_Main_GUI(player, id)
	if player.gui.top.DyDs_Main_GUI then
		player.gui.top.DyDs_Main_GUI.destroy()
	end
end

function Main_GUI(player, id)
	local force = player.force
	local surface = game.players[id].surface.name
	local tabbed_pane = player.gui.top.add{type = "tabbed-pane", name = "DyDs_Main_GUI"}

-------------------------------- Game Stats TAB ----------------------------------------
	local tab1 = tabbed_pane.add{type="tab", caption = {"dyworld-gui-main.tab-1-caption"}}
	local frameflow1 = tabbed_pane.add{type = "flow", name = "flow1", direction = "vertical"}
	tabbed_pane.add_tab(tab1, frameflow1)
	local table1 = frameflow1.add{type = "table", name = "table1", column_count = 2, draw_vertical_lines = false, draw_horizontal_lines = false, vertical_centering = true, draw_horizontal_line_after_headers = false}
		
	local total = Round(((global.dyworld.game_stats.sector_scanned or 0) + (global.dyworld.game_stats.rockets_launched or 0)), 0)
	frameflow1.add{type = "label", caption = "Game Stats (1/2): [color=blue]"..total.."[/color]", tooltip = "Sectors Scanned: [color=blue]"..(global.dyworld.game_stats.sector_scanned or 0).."[/color]\nRockets Launched: [color=blue]"..(global.dyworld.game_stats.rockets_launched or 0).."[/color]\nGame Days: [color=blue]"..(global.dyworld.game_stats.days or 0).."[/color]"}
	
	local total = Round(((global.dyworld.game_stats.inserters or 0) + (global.dyworld.game_stats.radars or 0) + (global.dyworld.game_stats.ghosts or 0)), 0)
	frameflow1.add{type = "label", caption = "Game Stats (2/2): [color=blue]"..total.."[/color]", tooltip = "Special Entities Built:\n\nInserters: [color=blue]"..(global.dyworld.game_stats.inserters or 0).."[/color]\nRadars: [color=blue]"..(global.dyworld.game_stats.radars or 0).."[/color]\nGhost Entities: [color=blue]"..(global.dyworld.game_stats.ghosts or 0).."[/color]"}
	
	if not global.dyworld.game_stats.dyson then
		global.dyworld.game_stats.dyson = {
			power_total = 0,
			power = 0,
			power_used = 0,
			effect = 0,
			sats = 0,
			structures = 0,
		}
	end
	if not global.dyworld.game_stats.dyson_1[surface] then
		global.dyworld.game_stats.dyson_1[surface] = {
			power_total = 0,
			power = 0,
			power_used = 0,
			effect = game.surfaces[surface].solar_power_multiplier,
			sats = 0,
			structures = 0,
		}
	end
	if game.forces.player.technologies["dyson-network-1"].researched or debugger then
		frameflow1.add{type = "label", caption = "Dyson Network Power: "..Dyson_Power_Check(global.dyworld.game_stats.dyson.power_total), tooltip = "Universal Dyson Network:\nPower Total: "..Dyson_Power_Check(global.dyworld.game_stats.dyson.power_total).."\nPower Available: "..Dyson_Power_Check(global.dyworld.game_stats.dyson.power).."\nPower Used: "..Dyson_Power_Check(global.dyworld.game_stats.dyson.power_used).."\nNetwork Efficiency: [color=blue]"..Round(global.dyworld.game_stats.dyson.effect, 2).."[/color]%\nSatellites: [color=blue]"..global.dyworld.game_stats.dyson.sats.."[/color]\nStructures: [color=blue]"..global.dyworld.game_stats.dyson.structures.."[/color]\n\n"..surface.." Dyson Network: \n(Contribution to the Universal Network)\nPower Total Gained: "..Dyson_Power_Check(global.dyworld.game_stats.dyson_1[surface].power_total).."\nSolar Efficiency: [color=blue]"..Round((global.dyworld.game_stats.dyson_1[surface].effect * 100), 2).."[/color]%\nSatellites: [color=blue]"..global.dyworld.game_stats.dyson_1[surface].sats.."[/color]\nStructures: [color=blue]"..global.dyworld.game_stats.dyson_1[surface].structures.."[/color]"}
	end
	frameflow1.add{type = "line", direction = "horizontal"}
		

-------------------------------- Player stats TAB -------------------------------------
	local tab2 = tabbed_pane.add{type = "tab", caption = {"dyworld-gui-main.tab-2-caption"}}
	local frameflow2 = tabbed_pane.add{type = "flow", name = "flow2", direction = "vertical"}
	if not global.dyworld.players[id].implants then Implant_Check(id, nil, nil) end
    local GloPla = global.dyworld.players[id].implants
	tabbed_pane.add_tab(tab2, frameflow2)
	
	if debugger then
		frameflow2.add{type = "label", caption = "Total Attributes: [color=blue]"..(global.dyworld.players[id].strength + global.dyworld.players[id].constitution + global.dyworld.players[id].dexterity + global.dyworld.players[id].intelligence + global.dyworld.players[id].wisdom + global.dyworld.players[id].charisma).."[/color]", tooltip = "Strength: [color=blue]"..global.dyworld.players[id].strength.."[/color]\nConstitution: [color=blue]"..global.dyworld.players[id].constitution.."[/color]\nDexterity: [color=blue]"..global.dyworld.players[id].dexterity.."[/color]\nIntelligence: [color=blue]"..global.dyworld.players[id].intelligence.."[/color]\nWisdom: [color=blue]"..global.dyworld.players[id].wisdom.."[/color]\nCharisma: [color=blue]"..global.dyworld.players[id].charisma.."[/color]"}
	end
	
	local table2 = frameflow2.add{type = "table", name = "table2", column_count = 3, draw_vertical_lines = false, draw_horizontal_lines = false, vertical_centering = true, draw_horizontal_line_after_headers = false}
	
	
	table2.add{type = "label", caption = ""}
	table2.add{type = "label", caption = "[color=yellow]Personal: [/color]"}
	table2.add{type = "label", caption = "[color=yellow]Total: [/color]"}
	
	table2.add{type = "label", caption = "[color=yellow]Crafted: [/color]"}
	table2.add{type = "label", caption = "[color=blue]"..global.dyworld.players[id].crafted.."[/color]"}
	table2.add{type = "label", caption = "[color=blue]"..(global.dyworld.game_stats.crafted_amount or 0).."[/color]"}
	
	table2.add{type = "label", caption = "[color=yellow]Mined: [/color]"}
	table2.add{type = "label", caption = "[color=blue]"..global.dyworld.players[id].mined.."[/color]"}
	table2.add{type = "label", caption = "[color=blue]"..(global.dyworld.game_stats.mined_amount or 0).."[/color]"}
	
	table2.add{type = "label", caption = "[color=yellow]Built: [/color]"}
	table2.add{type = "label", caption = "[color=blue]"..global.dyworld.players[id].build.."[/color]"}
	table2.add{type = "label", caption = "[color=blue]"..(global.dyworld.game_stats.build_amount or 0).."[/color]"}
	
	table2.add{type = "label", caption = "[color=yellow]Picked: [/color]"}
	table2.add{type = "label", caption = "[color=blue]"..global.dyworld.players[id].picked.."[/color]"}
	table2.add{type = "label", caption = "[color=blue]"..(global.dyworld.game_stats.picked_amount or 0).."[/color]"}
	
	table2.add{type = "label", caption = "[color=yellow]Built: [/color]"}
	table2.add{type = "label", caption = "[color=blue]"..global.dyworld.players[id].killed.."[/color]"}
	table2.add{type = "label", caption = "[color=blue]"..(global.dyworld.game_stats.killed_amount or 0).."[/color]"}
	
	frameflow2.add{type = "line", direction = "horizontal"}
	
	frameflow2.add{type = "label", caption = "Total Stats:", tooltip = "Capsules Used: [color=blue]"..(global.dyworld.players[id].capsules or 0).."[/color]\nTimes Died: [color=blue]"..(global.dyworld.players[id].died or 0).."[/color]"}
		
	frameflow2.add{type = "label", caption = "Distance Total: [color=blue]"..(Round(global.dyworld.players[id].distance, 2) + Round(global.dyworld.players[id].distance_car, 2) + Round(global.dyworld.players[id].distance_train, 2)).."[/color] Km", tooltip = "Walked: [color=blue]"..Round(global.dyworld.players[id].distance, 2).."[/color] Km\nDriven Vehicles: [color=blue]"..Round(global.dyworld.players[id].distance_car, 2).."[/color] Km\nDriven Trains: [color=blue]"..Round(global.dyworld.players[id].distance_train, 2).."[/color] Km"}
		

-------------------------------- Player Bonuses TAB ------------------------------------
	local tab4 = tabbed_pane.add{type="tab", caption = {"dyworld-gui-main.tab-3-caption"}}
	local frameflow4 = tabbed_pane.add{type = "flow", name = "flow4", direction = "vertical"}
	tabbed_pane.add_tab(tab4, frameflow4)
	local table4 = frameflow4.add{type = "table", name = "table4", column_count = 2, draw_vertical_lines = false, draw_horizontal_lines = false, vertical_centering = true, draw_horizontal_line_after_headers = false}
		
	if game.players[id].character then
		----- Player Bonuses -----
		if (game.entity_prototypes["character"].build_distance + game.players[id].character_build_distance_bonus) > game.entity_prototypes["character"].build_distance then
			table4.add{type = "label", caption = {"dyworld-gui-main.caption-3-1"}, tooltip = {"dyworld-gui-main.tooltip-3-1-1"}}
			table4.add{type = "label", caption = "[color=blue]"..(Round((game.entity_prototypes["character"].build_distance + game.players[id].character_build_distance_bonus), 2)).."[/color]", tooltip = {"dyworld-gui-main.tooltip-3-1-2"}}
		end
		
		if (game.entity_prototypes["character"].reach_distance + game.players[id].character_reach_distance_bonus) > game.entity_prototypes["character"].reach_distance then
			table4.add{type = "label", caption = {"dyworld-gui-main.caption-3-2"}, tooltip = {"dyworld-gui-main.tooltip-3-2-1"}}
			table4.add{type = "label", caption = "[color=blue]"..(Round((game.entity_prototypes["character"].reach_distance + game.players[id].character_reach_distance_bonus), 2)).."[/color]", tooltip = {"dyworld-gui-main.tooltip-3-2-2"}}
		end
		
		if (game.entity_prototypes["character"].loot_pickup_distance + game.players[id].character_loot_pickup_distance_bonus) > game.entity_prototypes["character"].loot_pickup_distance then
			table4.add{type = "label", caption = {"dyworld-gui-main.caption-3-3"}, tooltip = {"dyworld-gui-main.tooltip-3-3-1"}}
			table4.add{type = "label", caption = "[color=blue]"..(Round((game.entity_prototypes["character"].loot_pickup_distance + game.players[id].character_loot_pickup_distance_bonus), 2)).."[/color]", tooltip = {"dyworld-gui-main.tooltip-3-3-2"}}
		end
		
		if (game.players[id].character_crafting_speed_modifier + 1) > 1 then
			table4.add{type = "label", caption = {"dyworld-gui-main.caption-3-4"}, tooltip = {"dyworld-gui-main.tooltip-3-4-1"}}
			table4.add{type = "label", caption = "[color=blue]"..(Round(game.players[id].character_crafting_speed_modifier + 1, 2)).."[/color]", tooltip = {"dyworld-gui-main.tooltip-3-4-2"}}
		end
		
		if (game.players[id].character_mining_speed_modifier + game.entity_prototypes["character"].mining_speed) > game.entity_prototypes["character"].mining_speed then
			table4.add{type = "label", caption = {"dyworld-gui-main.caption-3-5"}, tooltip = {"dyworld-gui-main.tooltip-3-5-1"}}
			table4.add{type = "label", caption = "[color=blue]"..(Round(game.players[id].character_mining_speed_modifier + game.entity_prototypes["character"].mining_speed, 2)).."[/color]", tooltip = {"dyworld-gui-main.tooltip-3-5-2"}}
		end
		
		if (game.entity_prototypes["character"].get_inventory_size(1) + game.players[id].character_inventory_slots_bonus) > game.entity_prototypes["character"].get_inventory_size(1) then
			table4.add{type = "label", caption = {"dyworld-gui-main.caption-3-6"}, tooltip = {"dyworld-gui-main.tooltip-3-6-1"}}
			table4.add{type = "label", caption = "[color=blue]"..(game.entity_prototypes["character"].get_inventory_size(1) + game.players[id].character_inventory_slots_bonus).."[/color]", tooltip = {"dyworld-gui-main.tooltip-3-6-2"}}
		end
		
		if (game.entity_prototypes["character"].max_health + game.players[id].character_health_bonus) > game.entity_prototypes["character"].max_health then
			table4.add{type = "label", caption = {"dyworld-gui-main.caption-3-7"}, tooltip = {"dyworld-gui-main.tooltip-3-7-1"}}
			table4.add{type = "label", caption = "[color=blue]"..(game.entity_prototypes["character"].max_health + game.players[id].character_health_bonus).."[/color]", tooltip = {"dyworld-gui-main.tooltip-3-7-2"}}
		end
	end
	
		----- Game Bonuses ----
	table4.add{type = "line", direction = "horizontal"}
	table4.add{type = "line", direction = "horizontal"}
	
	if game.forces.player.stack_inserter_capacity_bonus > 0 then
		table4.add{type = "label", caption = {"dyworld-gui-main.caption-3-8"}, tooltip = {"dyworld-gui-main.tooltip-3-8-1"}}
		table4.add{type = "label", caption = "[color=blue]"..(Round((game.forces.player.stack_inserter_capacity_bonus), 0)).."[/color]", tooltip = {"dyworld-gui-main.tooltip-3-8-2"}}
	end
	
	if game.forces.player.laboratory_productivity_bonus > 1 then
		table4.add{type = "label", caption = {"dyworld-gui-main.caption-3-9"}, tooltip = {"dyworld-gui-main.tooltip-3-9-1"}}
		table4.add{type = "label", caption = "[color=blue]"..(Round((game.forces.player.laboratory_productivity_bonus), 2)).."[/color]", tooltip = {"dyworld-gui-main.tooltip-3-9-2"}}
	end
	
	if (game.forces.player.laboratory_speed_modifier + 1) > 1 then
		table4.add{type = "label", caption = {"dyworld-gui-main.caption-3-10"}, tooltip = {"dyworld-gui-main.tooltip-3-10-1"}}
		table4.add{type = "label", caption = "[color=blue]"..(Round((game.forces.player.laboratory_speed_modifier + 1), 2)).."[/color]", tooltip = {"dyworld-gui-main.tooltip-3-10-2"}}
	end
	
	if game.forces.player.ghost_time_to_live >= 60 then
		table4.add{type = "label", caption = {"dyworld-gui-main.caption-3-11"}, tooltip = {"dyworld-gui-main.tooltip-3-11-1"}}
		table4.add{type = "label", caption = "[color=blue]"..Time_Check(Round((game.forces.player.ghost_time_to_live / 60), 0)).."[/color]", tooltip = {"dyworld-gui-main.tooltip-3-11-2"}}
	end
		

-------------------------------- Implants TAB ------------------------------------
	local tab5 = tabbed_pane.add{type="tab", caption = {"dyworld-gui-main.tab-4-caption"}}
	local frameflow5 = tabbed_pane.add{type = "flow", name = "flow5", direction = "vertical"}
	tabbed_pane.add_tab(tab5, frameflow5)
	
	local table5 = frameflow5.add{type = "table", name = "table5", column_count = 6, draw_vertical_lines = true, draw_horizontal_lines = false, vertical_centering = true, draw_horizontal_line_after_headers = false}
	
	table5.add{type = "label", caption = ""}
	table5.add{type = "label", caption = "Mk 1"}
	table5.add{type = "label", caption = "Mk 2"}
	table5.add{type = "label", caption = "Mk 3"}
	table5.add{type = "label", caption = "Mk 4"}
	table5.add{type = "label", caption = "MK 5"}
	
	table5.add{type = "label", caption = {"looped-name.strength"}, tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.strength"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "strength-implant-1"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.strength"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "strength-implant-2"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.strength"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "strength-implant-3"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.strength"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "strength-implant-4"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.strength"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "strength-implant-5"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.strength"}}}
	
	table5.add{type = "label", caption = {"looped-name.constitution"}, tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.constitution"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "constitution-implant-1"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.constitution"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "constitution-implant-2"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.constitution"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "constitution-implant-3"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.constitution"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "constitution-implant-4"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.constitution"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "constitution-implant-5"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.constitution"}}}
	
	table5.add{type = "label", caption = {"looped-name.dexterity"}, tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.dexterity"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "dexterity-implant-1"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.dexterity"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "dexterity-implant-2"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.dexterity"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "dexterity-implant-3"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.dexterity"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "dexterity-implant-4"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.dexterity"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "dexterity-implant-5"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.dexterity"}}}
	
	table5.add{type = "label", caption = {"looped-name.intelligence"}, tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.intelligence"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "intelligence-implant-1"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.intelligence"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "intelligence-implant-2"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.intelligence"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "intelligence-implant-3"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.intelligence"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "intelligence-implant-4"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.intelligence"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "intelligence-implant-5"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.intelligence"}}}
	
	table5.add{type = "label", caption = {"looped-name.wisdom"}, tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.wisdom"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "wisdom-implant-1"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.wisdom"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "wisdom-implant-2"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.wisdom"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "wisdom-implant-3"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.wisdom"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "wisdom-implant-4"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.wisdom"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "wisdom-implant-5"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.wisdom"}}}
	
	table5.add{type = "label", caption = {"looped-name.charisma"}, tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.charisma"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "charisma-implant-1"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.charisma"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "charisma-implant-2"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.charisma"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "charisma-implant-3"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.charisma"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "charisma-implant-4"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.charisma"}}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "charisma-implant-5"), tooltip = {"dyworld-gui-main.tooltip-4-1", {"looped-name.charisma"}}}
	
	table5.add{type = "label", caption = {"dyworld-gui-main.caption-4-1"}, tooltip = {"dyworld-gui-main.tooltip-4-2"}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "usage-reduction-1"), tooltip = {"dyworld-gui-main.tooltip-4-2"}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "usage-reduction-2"), tooltip = {"dyworld-gui-main.tooltip-4-2"}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "usage-reduction-3"), tooltip = {"dyworld-gui-main.tooltip-4-2"}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "usage-reduction-4"), tooltip = {"dyworld-gui-main.tooltip-4-2"}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "usage-reduction-5"), tooltip = {"dyworld-gui-main.tooltip-4-2"}}
	
	table5.add{type = "label", caption = {"dyworld-gui-main.caption-4-2"}, tooltip = {"dyworld-gui-main.tooltip-4-3"}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "speed-implant-1"), tooltip = {"dyworld-gui-main.tooltip-4-3"}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "speed-implant-2"), tooltip = {"dyworld-gui-main.tooltip-4-3"}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "speed-implant-3"), tooltip = {"dyworld-gui-main.tooltip-4-3"}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "speed-implant-4"), tooltip = {"dyworld-gui-main.tooltip-4-3"}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "speed-implant-5"), tooltip = {"dyworld-gui-main.tooltip-4-3"}}
	
	table5.add{type = "label", caption = {"dyworld-gui-main.caption-4-3"}, tooltip = {"dyworld-gui-main.tooltip-4-4"}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "death-implant-1"), tooltip = {"dyworld-gui-main.tooltip-4-4"}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "death-implant-2"), tooltip = {"dyworld-gui-main.tooltip-4-4"}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "death-implant-3"), tooltip = {"dyworld-gui-main.tooltip-4-4"}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "death-implant-4"), tooltip = {"dyworld-gui-main.tooltip-4-4"}}
	table5.add{type = "label", caption = Check_Implant_State_2(id, "death-implant-5"), tooltip = {"dyworld-gui-main.tooltip-4-4"}}
	
end
