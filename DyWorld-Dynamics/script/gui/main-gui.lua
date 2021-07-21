

local function Progress_Surival_Style_Check(VAR)
	local Percent = VAR * 100
	if Percent >= 90 then return "dy-bar-1"
	elseif Percent >= 80 then return "dy-bar-2"
	elseif Percent >= 70 then return "dy-bar-3"
	elseif Percent >= 60 then return "dy-bar-4"
	elseif Percent >= 50 then return "dy-bar-5"
	elseif Percent >= 40 then return "dy-bar-6"
	elseif Percent >= 30 then return "dy-bar-7"
	elseif Percent >= 20 then return "dy-bar-8"
	elseif Percent >= 10 then return "dy-bar-9"
	elseif Percent < 10 then return "dy-bar-10"
	else return "dy-bar-10"
	end
end

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

local function Time_Surival_Check(id, VAR)
	if VAR == "food" then
		local rate = global.dyworld.players[id].food_rate
		local capacity = global.dyworld.players[id].food
		local total = capacity / rate
		local seconds_start = math.floor(total)
		local minutes_start = math.floor(seconds_start/60)
		local hours = math.floor(minutes_start/60)
		local minutes = (minutes_start-(hours*60))
		local seconds = (seconds_start-(minutes_start*60))
		return (hours..":"..minutes..":"..seconds)
	elseif VAR == "water" then
		local rate = global.dyworld.players[id].water_rate
		local capacity = global.dyworld.players[id].water
		local total = capacity / rate
		local seconds_start = math.floor(total)
		local minutes_start = math.floor(seconds_start/60)
		local hours = math.floor(minutes_start/60)
		local minutes = (minutes_start-(hours*60))
		local seconds = (seconds_start-(minutes_start*60))
		return (hours..":"..minutes..":"..seconds)
	end
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
		
	frameflow1.add{type = "label", caption = "Water:"}
	frameflow1.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].water/global.dyworld.players[id].water_max), tooltip = "Water: [color=blue]"..Round(global.dyworld.players[id].water, 2).."[/color]\nMax Water: [color=blue]"..global.dyworld.players[id].water_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].water_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "water").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].water/global.dyworld.players[id].water_max))}
		
	frameflow1.add{type = "label", caption = "Food:"}
	frameflow1.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].food/global.dyworld.players[id].food_max), tooltip = "Food: [color=blue]"..Round(global.dyworld.players[id].food, 2).."[/color]\nMax Food: [color=blue]"..global.dyworld.players[id].food_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].food_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "food").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].food/global.dyworld.players[id].food_max))}
	frameflow1.add{type = "line", direction = "horizontal"}
			
	if global.dyworld.game_stats.sector_scanned > 0 or debugger then
		frameflow1.add{type = "label", caption = "Sectors Scanned: [color=blue]"..global.dyworld.game_stats.sector_scanned.."[/color]"}
	end
	if global.dyworld.game_stats.rockets_launched > 0 or debugger then
		frameflow1.add{type = "label", caption = "Rockets Launched: [color=blue]"..global.dyworld.game_stats.rockets_launched.."[/color]"}
	end
	frameflow1.add{type = "label", caption = "Special Entities Built: [color=blue]"..((global.dyworld.game_stats.inserters or 0) + (global.dyworld.game_stats.radars or 0)).."[/color]", tooltip = "Inserters: [color=blue]"..(global.dyworld.game_stats.inserters or 0).."[/color]\nRadars: [color=blue]"..(global.dyworld.game_stats.radars or 0).."[/color]"}
	
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
		
	if debugger then
		frameflow1.add{type = "label", caption = "Chunks: [color=blue]"..global.dyworld.game_stats.chunks.."[/color]"}
		frameflow1.add{type = "label", caption = "Difficulty of game: [color=blue]"..global.dyworld.game_stats.difficulty.."[/color]"}
	end
		
	frameflow1.add{type = "label", caption = "Game Days: [color=blue]"..global.dyworld.game_stats.days.."[/color]"}
	frameflow1.add{type = "label", caption = "Game Kills: [color=blue]"..global.dyworld.game_stats.killed_amount.."[/color]"}
	frameflow1.add{type = "line", direction = "horizontal"}

-------------------------------- Player stats TAB -------------------------------------
	local tab2 = tabbed_pane.add{type="tab", caption="Player Stats"}
	local frameflow2 = tabbed_pane.add{type = "flow", name = "flow2", direction = "vertical"}
	tabbed_pane.add_tab(tab2, frameflow2)
	
	frameflow2.add{type = "label", caption = "Water:"}
	frameflow2.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].water/global.dyworld.players[id].water_max), tooltip = "Water: [color=blue]"..Round(global.dyworld.players[id].water, 2).."[/color]\nMax Water: [color=blue]"..global.dyworld.players[id].water_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].water_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "water").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].water/global.dyworld.players[id].water_max))}
		
	frameflow2.add{type = "label", caption = "Food:"}
	frameflow2.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].food/global.dyworld.players[id].food_max), tooltip = "Food: [color=blue]"..Round(global.dyworld.players[id].food, 2).."[/color]\nMax Food: [color=blue]"..global.dyworld.players[id].food_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].food_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "food").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].food/global.dyworld.players[id].food_max))}
	frameflow2.add{type = "line", direction = "horizontal"}
		
	frameflow2.add{type = "label", caption = "Total Attributes: [color=blue]"..(global.dyworld.players[id].strength + global.dyworld.players[id].constitution + global.dyworld.players[id].dexterity + global.dyworld.players[id].intelligence + global.dyworld.players[id].wisdom + global.dyworld.players[id].charisma).."[/color]", tooltip = "Strength: [color=blue]"..global.dyworld.players[id].strength.."[/color]\nConstitution: [color=blue]"..global.dyworld.players[id].constitution.."[/color]\nDexterity: [color=blue]"..global.dyworld.players[id].dexterity.."[/color]\nIntelligence: [color=blue]"..global.dyworld.players[id].intelligence.."[/color]\nWisdom: [color=blue]"..global.dyworld.players[id].wisdom.."[/color]\nCharisma: [color=blue]"..global.dyworld.players[id].charisma.."[/color]"}
		
	frameflow2.add{type = "label", caption = "Total Stats: [color=blue]"..(global.dyworld.players[id].crafted + global.dyworld.players[id].mined + global.dyworld.players[id].picked + global.dyworld.players[id].build + global.dyworld.players[id].killed).."[/color]", tooltip = "Crafted: [color=blue]"..global.dyworld.players[id].crafted.."[/color]\nMined: [color=blue]"..global.dyworld.players[id].mined.."[/color]\nPicked Up: [color=blue]"..global.dyworld.players[id].picked.."[/color]\nBuilt: [color=blue]"..global.dyworld.players[id].build.."[/color]\nPersonal Killed: [color=blue]"..global.dyworld.players[id].killed.."[/color]\nCapsules Used: [color=blue]"..(global.dyworld.players[id].capsules or 0).."[/color]\nTimes Died: [color=blue]"..(global.dyworld.players[id].died or 0).."[/color]"}
		
	frameflow2.add{type = "label", caption = "Position: [color=blue]"..math.floor(global.dyworld.players[id].posx).."[/color] , [color=blue]"..math.floor(global.dyworld.players[id].posy).."[/color] on [color=blue]"..global.dyworld.players[id].surface.."[/color]"}
		
	frameflow2.add{type = "label", caption = "Distance Total: [color=blue]"..(Round(global.dyworld.players[id].distance, 2) + Round(global.dyworld.players[id].distance_car, 2) + Round(global.dyworld.players[id].distance_train, 2)).."[/color] Km", tooltip = "Walked: [color=blue]"..Round(global.dyworld.players[id].distance, 2).."[/color] Km\nDriven Vehicles: [color=blue]"..Round(global.dyworld.players[id].distance_car, 2).."[/color] Km\nDriven Trains: [color=blue]"..Round(global.dyworld.players[id].distance_train, 2).."[/color] Km"}

-------------------------------- Bonuses TAB ------------------------------------
	local tab3 = tabbed_pane.add{type="tab", caption="Bonuses"}
	local frameflow3 = tabbed_pane.add{type = "flow", name = "flow3", direction = "vertical"}
	tabbed_pane.add_tab(tab3, frameflow3)
		
	frameflow3.add{type = "label", caption = "Water:"}
	frameflow3.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].water/global.dyworld.players[id].water_max), tooltip = "Water: [color=blue]"..Round(global.dyworld.players[id].water, 2).."[/color]\nMax Water: [color=blue]"..global.dyworld.players[id].water_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].water_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "water").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].water/global.dyworld.players[id].water_max))}
		
	frameflow3.add{type = "label", caption = "Food:"}
	frameflow3.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].food/global.dyworld.players[id].food_max), tooltip = "Food: [color=blue]"..Round(global.dyworld.players[id].food, 2).."[/color]\nMax Food: [color=blue]"..global.dyworld.players[id].food_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].food_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "food").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].food/global.dyworld.players[id].food_max))}
	frameflow3.add{type = "line", direction = "horizontal"}
		
	if game.players[id].character then
		----- Player Bonuses -----
		frameflow3.add{type = "label", caption = "Build Distance: [color=blue]"..(Round((game.entity_prototypes["character"].build_distance + game.players[id].character_build_distance_bonus), 2)).."[/color]"}
		frameflow3.add{type = "label", caption = "Reach Distance: [color=blue]"..(Round((game.entity_prototypes["character"].reach_distance + game.players[id].character_reach_distance_bonus), 2)).."[/color]"}
		frameflow3.add{type = "label", caption = "Loot Pickup Distance: [color=blue]"..(Round((game.entity_prototypes["character"].loot_pickup_distance + game.players[id].character_loot_pickup_distance_bonus), 2)).."[/color]"}
		frameflow3.add{type = "label", caption = "Crafting Speed: [color=blue]"..(Round(game.players[id].character_crafting_speed_modifier + 1, 2)).."[/color]"}
		frameflow3.add{type = "label", caption = "Mining Speed: [color=blue]"..(Round(game.players[id].character_mining_speed_modifier + game.entity_prototypes["character"].mining_speed, 2)).."[/color]"}
		frameflow3.add{type = "label", caption = "Inventory Slots: [color=blue]"..(game.entity_prototypes["character"].get_inventory_size(1) + game.players[id].character_inventory_slots_bonus).."[/color]"}
		frameflow3.add{type = "label", caption = "Health: [color=blue]"..(game.entity_prototypes["character"].max_health + game.players[id].character_health_bonus).."[/color]"}
			
		----- Game Bonuses ----
		frameflow3.add{type = "line", direction = "horizontal"}
		frameflow3.add{type = "label", caption = "Stack Inserter Stack Bonus: [color=blue]"..(Round((game.forces.player.stack_inserter_capacity_bonus), 0)).."[/color]"}
		frameflow3.add{type = "label", caption = "Laboratory Productivity: [color=blue]"..(Round((game.forces.player.laboratory_productivity_bonus), 2)).."[/color]"}
		frameflow3.add{type = "label", caption = "Laboratory Speed: [color=blue]"..(Round((game.forces.player.laboratory_speed_modifier + 1), 2)).."[/color]"}
	end

-------------------------------- Implants TAB ------------------------------------
	if not global.dyworld.players[id].implants_used then global.dyworld.players[id].implants_used = 0 end
	if global.dyworld.players[id].implants_used >= 1 then
		local tab4 = tabbed_pane.add{type="tab", caption="Implants"}
		local frameflow4 = tabbed_pane.add{type = "flow", name = "flow4", direction = "vertical"}
		tabbed_pane.add_tab(tab4, frameflow4)
		
		frameflow4.add{type = "label", caption = "Water:"}
		frameflow4.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].water/global.dyworld.players[id].water_max), tooltip = "Water: [color=blue]"..Round(global.dyworld.players[id].water, 2).."[/color]\nMax Water: [color=blue]"..global.dyworld.players[id].water_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].water_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "water").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].water/global.dyworld.players[id].water_max))}
		
		frameflow4.add{type = "label", caption = "Food:"}
		frameflow4.add{type = "progressbar", size = 26, value = (global.dyworld.players[id].food/global.dyworld.players[id].food_max), tooltip = "Food: [color=blue]"..Round(global.dyworld.players[id].food, 2).."[/color]\nMax Food: [color=blue]"..global.dyworld.players[id].food_max.."[/color]\nUse Rate: [color=blue]"..global.dyworld.players[id].food_rate.."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "food").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].food/global.dyworld.players[id].food_max))}
		frameflow4.add{type = "line", direction = "horizontal"}
		
		frameflow4.add{type = "label", caption = "[color=green]Active Implants:[/color]"}
		frameflow4.add{type = "line", direction = "horizontal"}
		for k,v in pairs(global.dyworld.players[id].implants) do
			if v == true then
				frameflow4.add{type = "label", caption = {"looped-name.implant", {"item-name."..k}, tostring(v)}, tooltip = {"item-description."..k}}
			end
		end
	end

-------------------------------- Space Mining TAB ------------------------------------

	if game.forces.player.technologies["advanced-asteroid-mining"].researched or debugger then
		if global.dyworld.game_stats.space_mining then
			local tab5 = tabbed_pane.add{type="tab", caption = {"gui-stats.space-mining-title"}}
			local frameflow5 = tabbed_pane.add{type = "flow", name = "flow5", direction = "vertical"}
			tabbed_pane.add_tab(tab5, frameflow5)
			
			frameflow5.add{type = "label", caption = {"gui-stats.space-mining-time"}}
			for k,v in pairs(global.dyworld.game_stats.space_mining) do
				frameflow5.add{type = "line", direction = "horizontal"}
				frameflow5.add{type = "label", caption = {"gui-stats.space-mining-caption", {"looped-name."..k}, Round((v.pure_mined + v.impure_mined), 2)}, tooltip = {"gui-stats.space-mining-tooltip", {"looped-name."..k}, Round(v.impure_mined, 2), v.impure_storage, Round(v.impure_rate, 2), Round(v.pure_mined, 2), v.pure_storage, Round(v.pure_rate, 2), Round((v.efficiency * 100), 2)}}
				frameflow5.add{type = "progressbar", size = 26, value = (Round((v.pure_mined + v.impure_mined), 2)/Round((v.pure_storage + v.impure_storage), 2)), style = "dy-bar-1"}
			end
		end
	end
end
