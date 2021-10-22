

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
	local tab1 = tabbed_pane.add{type="tab", caption="Game Stats"}
	local frameflow1 = tabbed_pane.add{type = "flow", name = "flow1", direction = "vertical"}
	tabbed_pane.add_tab(tab1, frameflow1)

	local total = Round(((global.dyworld.game_stats.crafted_amount or 0) + (global.dyworld.game_stats.mined_amount or 0) + (global.dyworld.game_stats.build_amount or 0) + (global.dyworld.game_stats.killed_amount or 0) + (global.dyworld.game_stats.picked_amount or 0)), 0)
	frameflow1.add{type = "label", caption = "Game Stats (1/3): [color=blue]"..total.."[/color]", tooltip = "Total Crafted: [color=blue]"..(global.dyworld.game_stats.crafted_amount or 0).."[/color]\nTotal Mined: [color=blue]"..(global.dyworld.game_stats.mined_amount or 0).."[/color]\nTotal Built: [color=blue]"..(global.dyworld.game_stats.build_amount or 0).."[/color]\nTotal Killed: [color=blue]"..(global.dyworld.game_stats.killed_amount or 0).."[/color]\nTotal Looted: [color=blue]"..(global.dyworld.game_stats.picked_amount or 0).."[/color]"}
		
	local total = Round(((global.dyworld.game_stats.sector_scanned or 0) + (global.dyworld.game_stats.rockets_launched or 0)), 0)
	frameflow1.add{type = "label", caption = "Game Stats (2/3): [color=blue]"..total.."[/color]", tooltip = "Sectors Scanned: [color=blue]"..(global.dyworld.game_stats.sector_scanned or 0).."[/color]\nRockets Launched: [color=blue]"..(global.dyworld.game_stats.rockets_launched or 0).."[/color]\nGame Days: [color=blue]"..(global.dyworld.game_stats.days or 0).."[/color]"}
	
	local total = Round(((global.dyworld.game_stats.inserters or 0) + (global.dyworld.game_stats.radars or 0) + (global.dyworld.game_stats.ghosts or 0)), 0)
	frameflow1.add{type = "label", caption = "Game Stats (3/3): [color=blue]"..total.."[/color]", tooltip = "Special Entities Built:\n\nInserters: [color=blue]"..(global.dyworld.game_stats.inserters or 0).."[/color]\nRadars: [color=blue]"..(global.dyworld.game_stats.radars or 0).."[/color]\nGhost Entities: [color=blue]"..(global.dyworld.game_stats.ghosts or 0).."[/color]"}
	
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
	frameflow1.add{type = "label", caption = "Evolution: [color=blue]"..Round(game.forces.enemy.evolution_factor, 2).."[/color]"}
	frameflow1.add{type = "label", caption = "Custom Evolution: [color=blue]"..Round(global.dyworld.game_stats.difficulty, 0).."[/color]"}
		
	if debugger then
		--frameflow1.add{type = "line", direction = "horizontal"}
		--frameflow1.add{type = "label", caption = "Chunks: [color=blue]"..global.dyworld.game_stats.chunks.."[/color]"}
		--frameflow1.add{type = "line", direction = "horizontal"}
	end
		

-------------------------------- Player stats TAB -------------------------------------
	local tab2 = tabbed_pane.add{type="tab", caption="Player Stats"}
	local frameflow2 = tabbed_pane.add{type = "flow", name = "flow2", direction = "vertical"}
	if not global.dyworld.players[id].implants then Implant_Check(id, nil, nil) end
    local GloPla = global.dyworld.players[id].implants
	tabbed_pane.add_tab(tab2, frameflow2)
		
	frameflow2.add{type = "label", caption = "Total Attributes: [color=blue]"..(global.dyworld.players[id].strength + global.dyworld.players[id].constitution + global.dyworld.players[id].dexterity + global.dyworld.players[id].intelligence + global.dyworld.players[id].wisdom + global.dyworld.players[id].charisma).."[/color]", tooltip = "Strength: [color=blue]"..global.dyworld.players[id].strength.."[/color]\nConstitution: [color=blue]"..global.dyworld.players[id].constitution.."[/color]\nDexterity: [color=blue]"..global.dyworld.players[id].dexterity.."[/color]\nIntelligence: [color=blue]"..global.dyworld.players[id].intelligence.."[/color]\nWisdom: [color=blue]"..global.dyworld.players[id].wisdom.."[/color]\nCharisma: [color=blue]"..global.dyworld.players[id].charisma.."[/color]"}
    frameflow2.add{type = "label", caption = "[color=yellow]Implants[/color]", tooltip = "Strength Implant: \n"..Check_Implant_State(id, "strength-implant").."\n\nConstitution Implant: \n"..Check_Implant_State(id, "constitution-implant").."\n\nDexterity Implant: \n"..Check_Implant_State(id, "dexterity-implant").."\n\nIntelligence Implant: \n"..Check_Implant_State(id, "intelligence-implant").."\n\nWisdom Implant: \n"..Check_Implant_State(id, "wisdom-implant").."\n\nCharisma Implant: \n"..Check_Implant_State(id, "charisma-implant")}
		
	frameflow2.add{type = "label", caption = "Total Stats: [color=blue]"..(global.dyworld.players[id].crafted + global.dyworld.players[id].mined + global.dyworld.players[id].picked + global.dyworld.players[id].build + global.dyworld.players[id].killed).."[/color]", tooltip = "Crafted: [color=blue]"..global.dyworld.players[id].crafted.."[/color]\nMined: [color=blue]"..global.dyworld.players[id].mined.."[/color]\nPicked Up: [color=blue]"..global.dyworld.players[id].picked.."[/color]\nBuilt: [color=blue]"..global.dyworld.players[id].build.."[/color]\nPersonal Killed: [color=blue]"..global.dyworld.players[id].killed.."[/color]\nCapsules Used: [color=blue]"..(global.dyworld.players[id].capsules or 0).."[/color]\nTimes Died: [color=blue]"..(global.dyworld.players[id].died or 0).."[/color]"}
		
	frameflow2.add{type = "label", caption = "Distance Total: [color=blue]"..(Round(global.dyworld.players[id].distance, 2) + Round(global.dyworld.players[id].distance_car, 2) + Round(global.dyworld.players[id].distance_train, 2)).."[/color] Km", tooltip = "Walked: [color=blue]"..Round(global.dyworld.players[id].distance, 2).."[/color] Km\nDriven Vehicles: [color=blue]"..Round(global.dyworld.players[id].distance_car, 2).."[/color] Km\nDriven Trains: [color=blue]"..Round(global.dyworld.players[id].distance_train, 2).."[/color] Km"}

-------------------------------- Game Bonuses TAB ------------------------------------
	local tab3 = tabbed_pane.add{type="tab", caption = "Game Bonuses"}
	local frameflow3 = tabbed_pane.add{type = "flow", name = "flow3", direction = "vertical"}
	tabbed_pane.add_tab(tab3, frameflow3)
		
		----- Game Bonuses ----
	frameflow3.add{type = "line", direction = "horizontal"}
	frameflow3.add{type = "label", caption = "Stack Inserter Stack Bonus: [color=blue]"..(Round((game.forces.player.stack_inserter_capacity_bonus), 0)).."[/color]"}
	frameflow3.add{type = "label", caption = "Laboratory Productivity: [color=blue]"..(Round((game.forces.player.laboratory_productivity_bonus), 2)).."[/color]"}
	frameflow3.add{type = "label", caption = "Laboratory Speed: [color=blue]"..(Round((game.forces.player.laboratory_speed_modifier + 1), 2)).."[/color]"}
	if game.forces.player.ghost_time_to_live >= 60 then
		frameflow3.add{type = "label", caption = "Ghost Time To Live: [color=blue]"..Time_Check(Round((game.forces.player.ghost_time_to_live / 60), 0)).."[/color]", tooltip = "This is only for destroyed entities.\nThis does not effect hand placed ghosts\nIncrease time by building more ghosts (shift place)\nTime format: Hours:Minutes:Seconds"}
	end

-------------------------------- Player Bonuses TAB ------------------------------------
	local tab4 = tabbed_pane.add{type="tab", caption = "Player Bonuses"}
	local frameflow4 = tabbed_pane.add{type = "flow", name = "flow4", direction = "vertical"}
	tabbed_pane.add_tab(tab4, frameflow4)
		
	if game.players[id].character then
		----- Player Bonuses -----
		frameflow4.add{type = "label", caption = "Build Distance: [color=blue]"..(Round((game.entity_prototypes["character"].build_distance + game.players[id].character_build_distance_bonus), 2)).."[/color]"}
		frameflow4.add{type = "label", caption = "Reach Distance: [color=blue]"..(Round((game.entity_prototypes["character"].reach_distance + game.players[id].character_reach_distance_bonus), 2)).."[/color]"}
		frameflow4.add{type = "label", caption = "Loot Pickup Distance: [color=blue]"..(Round((game.entity_prototypes["character"].loot_pickup_distance + game.players[id].character_loot_pickup_distance_bonus), 2)).."[/color]"}
		frameflow4.add{type = "label", caption = "Crafting Speed: [color=blue]"..(Round(game.players[id].character_crafting_speed_modifier + 1, 2)).."[/color]"}
		frameflow4.add{type = "label", caption = "Mining Speed: [color=blue]"..(Round(game.players[id].character_mining_speed_modifier + game.entity_prototypes["character"].mining_speed, 2)).."[/color]"}
		frameflow4.add{type = "label", caption = "Inventory Slots: [color=blue]"..(game.entity_prototypes["character"].get_inventory_size(1) + game.players[id].character_inventory_slots_bonus).."[/color]"}
		frameflow4.add{type = "label", caption = "Health: [color=blue]"..(game.entity_prototypes["character"].max_health + game.players[id].character_health_bonus).."[/color]"}
	end
end
