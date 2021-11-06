

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

local function Time_Surival_Check(id, VAR, mult)
	if VAR == "food" then
		local rate = Round((global.dyworld.players[id].food_rate * mult), 2)
		local capacity = global.dyworld.players[id].food
		local total = capacity / rate
		local seconds_start = math.floor(total)
		local minutes_start = math.floor(seconds_start/60)
		local hours = math.floor(minutes_start/60)
		local minutes = (minutes_start-(hours*60))
		local seconds = (seconds_start-(minutes_start*60))
		return (hours..":"..minutes..":"..seconds)
	elseif VAR == "water" then
		local rate = Round((global.dyworld.players[id].water_rate * mult), 2)
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

function Close_Personal_GUI(player, id)
	if player.gui.left.DyDs_Personal_GUI then
		player.gui.left.DyDs_Personal_GUI.destroy()
	end
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

function Personal_GUI(player, id)
	local force = player.force
	local surface = game.players[id].surface.name
	local frame = player.gui.left.add{type = "frame", name = "DyDs_Personal_GUI", caption = "DyWorld-Dynamics"}
	local frameflow1 = frame.add{type = "flow", name = "flow1", direction = "vertical"}
	if not global.dyworld.players[id].implants then Implant_Check(id, nil, nil) end
    local GloPla = global.dyworld.players[id].implants
    local X = global.dyworld.players[id].posx
    local Y = global.dyworld.players[id].posy
    local Chunk_X = math.floor(X / 32)
    local Chunk_Y = math.floor(Y / 32)
    local Chunk = global.dyworld.game_stats.chunks_info[surface][Chunk_X..":"..Chunk_Y]
    --if not global.dyworld.players[id].personal_gui_loc then global.dyworld.players[id].personal_gui_loc = {X = 0, Y = 0} end
    --player.gui.screen.DyDs_Personal_GUI.location.x = global.dyworld.players[id].personal_gui_loc.X
    --player.gui.screen.DyDs_Personal_GUI.location.y = global.dyworld.players[id].personal_gui_loc.Y
	
	local table1 = frameflow1.add{type = "table", name = "table1", column_count = 4, draw_vertical_lines = false, draw_horizontal_lines = false, vertical_centering = true, draw_horizontal_line_after_headers = false}

	table1.add{type = "sprite-button", name = "dyworld_story", sprite = "virtual-signal/dyworld_story_button", tooltip = {"looped-name.dyworld_story_button"}}
	table1.add{type = "sprite-button", name = "dyworld_stats", sprite = "virtual-signal/dyworld_stats_button", tooltip = {"looped-name.dyworld_stats_button"}}
	table1.add{type = "sprite-button", name = "dyworld_smn", sprite = "item/satellite", tooltip = {"looped-name.dyworld_smn_button"}}
	table1.add{type = "sprite-button", name = "dyworld_dyson", sprite = "item/satellite", tooltip = {"looped-name.dyworld_dyson_button"}}

	if settings.global["DyWorld_Surival_Difficulty"].value ~= "Off" then
        local Mult = settings.global["DyWorld_Surival_Difficulty"].value == "Easy" and 0.5 or settings.global["DyWorld_Surival_Difficulty"].value == "Normal" and 1 or settings.global["DyWorld_Surival_Difficulty"].value == "Hard" and 2 or settings.global["DyWorld_Surival_Difficulty"].value == "Insane" and 5 or 1

		--frameflow1.add{type = "label", caption = "Water:"}
		frameflow1.add{type = "progressbar", value = (global.dyworld.players[id].water/global.dyworld.players[id].water_max), tooltip = "Water: [color=blue]"..Round(global.dyworld.players[id].water, 2).."[/color]\nMax Water: [color=blue]"..global.dyworld.players[id].water_max.."[/color]\nUse Rate: [color=blue]"..Round((global.dyworld.players[id].water_rate * Mult), 2).."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "water", Mult).."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].water/global.dyworld.players[id].water_max)), caption = GloPla["food-implant"].enabled and "   [color=red]Water (Auto)[/color]" or "         [color=red]Water[/color]"}

		--frameflow1.add{type = "label", caption = "Food:"}
		frameflow1.add{type = "progressbar", value = (global.dyworld.players[id].food/global.dyworld.players[id].food_max), tooltip = "Food: [color=blue]"..Round(global.dyworld.players[id].food, 2).."[/color]\nMax Food: [color=blue]"..global.dyworld.players[id].food_max.."[/color]\nUse Rate: [color=blue]"..Round((global.dyworld.players[id].food_rate * Mult), 2).."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "food", Mult).."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].food/global.dyworld.players[id].food_max)), caption = GloPla["food-implant"].enabled and "   [color=red]Food (Auto)[/color]" or "         [color=red]Food[/color]"}
        
    else
        frameflow1.add{type = "label", caption = "Food and Water Disabled"}
	end
    
    if game.players[id].character then
        frameflow1.add{type = "progressbar", value = (game.players[id].character.get_health_ratio()), style = Progress_Surival_Style_Check(game.players[id].character.get_health_ratio()), caption = GloPla["health-implant"].enabled and "   [color=red]Health (Auto)[/color]" or "         [color=red]Health[/color]"}
    end
	
	local table2 = frameflow1.add{type = "table", name = "table2", column_count = 2, draw_vertical_lines = false, draw_horizontal_lines = false, vertical_centering = true, draw_horizontal_line_after_headers = false}

	table2.add{type = "label", caption = "Pollution: ", tooltip = "WIP"}
	table2.add{type = "label", caption = "[color=yellow]"..Chunk.Pollution.."[/color]"}

    -- Temperature WIP
    table2.add{type = "label", caption = "Temperature: ", tooltip = "Temperature Threshold: [color=blue]"..Round(global.dyworld.players[id].temp.low.total, 0).."[/color]°C <-> [color=blue]"..Round(global.dyworld.players[id].temp.high.total, 0).."[/color]°C"}
    table2.add{type = "label", caption = "[color=yellow]"..Chunk.Temperature.."[/color]°C"}

    -- Radiation WIP
	local Rads_Gained = ((global.dyworld.players[id].rads.native_loss + global.dyworld.players[id].rads.artifical_loss) + Chunk.Radiation)
    table2.add{type = "label", caption = "Rads Gain: ", tooltip = "WIP"}
    table2.add{type = "label", caption = "[color=green]"..Round(Rads_Gained, 2).." Rads/s[/color]"}
    table2.add{type = "label", caption = "Rads: ", tooltip = "WIP"}
    table2.add{type = "label", caption = "[color=green]"..Round(global.dyworld.players[id].rads.stored, 2).." Rads[/color]"}
        -- send warning to player

    table2.add{type = "label", caption = "Position: "}
    table2.add{type = "label", caption = "[color=blue]"..global.dyworld.players[id].surface.."[/color]"}
    table2.add{type = "label", caption = "[color=blue]"..math.floor(global.dyworld.players[id].posx).."[/color]"}
    table2.add{type = "label", caption = "[color=blue]"..math.floor(global.dyworld.players[id].posy).."[/color]"}

    table2.add{type = "label", caption = "Evo:"}
    table2.add{type = "label", caption = "[color=blue]"..Round(game.forces.enemy.evolution_factor, 2).."[/color]"}
    table2.add{type = "label", caption = "Custom Evo:"}
    table2.add{type = "label", caption = "[color=blue]"..Round(global.dyworld.game_stats.difficulty, 0).."[/color]"}

    frameflow1.add{type = "label", caption = "[color=yellow]Implants[/color]", tooltip = "Food Reduction: \n"..Check_Implant_State(id, "usage-reduction").."\n\nSpeed Implant: \n"..Check_Implant_State(id, "speed-implant").."\n\nDeath Implant: \n"..Check_Implant_State(id, "death-implant")}
	
    if debugger then
    end
end

