

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
	local frame = player.gui.left.add{type = "frame", name = "DyDs_Personal_GUI", caption = "Survival"}
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

    if Chunk.Pollution > 500 then
		frameflow1.add{type = "label", caption = "Pollution: [color=yellow]"..Chunk.Pollution.."[/color]", tooltip = "WIP"}
        --frameflow1.add{type = "progressbar", value = (Chunk.Pollution / Max_Pollution), style = "dy-bar-1", tooltip = "[color=red]Warning!\nPollution getting high\nVacate the area[/color]\n\n[color=blue]WIP, no pollution based damage implemented yet[/color]", caption = "        [color=yellow]Pollution[/color]"}
    end

    frameflow1.add{type = "label", caption = "[color=yellow]Implants[/color]", tooltip = "Food Reduction: \n"..Check_Implant_State(id, "usage-reduction").."\n\nSpeed Implant: \n"..Check_Implant_State(id, "speed-implant").."\n\nDeath Implant: \n"..Check_Implant_State(id, "death-implant")}

    -- Temperature WIP
    if Chunk.Temperature <= -5 then
        frameflow1.add{type = "label", caption = "Temperature: [color=blue]"..Chunk.Temperature.."[/color]", tooltip = "WIP"}
    elseif Chunk.Temperature <= 10 then
        frameflow1.add{type = "label", caption = "Temperature: [color=cyan]"..Chunk.Temperature.."[/color]", tooltip = "WIP"}
    elseif Chunk.Temperature >= 30 then
        frameflow1.add{type = "label", caption = "Temperature: [color=yellow]"..Chunk.Temperature.."[/color]", tooltip = "WIP"}
    elseif Chunk.Temperature >= 45 then
        frameflow1.add{type = "label", caption = "Temperature: [color=red]"..Chunk.Temperature.."[/color]", tooltip = "WIP"}
    else
        frameflow1.add{type = "label", caption = "Temperature: [color=green]"..Chunk.Temperature.."[/color]", tooltip = "WIP"}
    end

    -- Radiation WIP
    if Chunk.Radiation >= 0.075 then
        frameflow1.add{type = "label", caption = "[color=green]Radiation: "..Chunk.Radiation.." Rad/s[/color]", tooltip = "WIP"}
        -- send warning to player
    end

    frameflow1.add{type = "label", caption = "[color=blue]"..math.floor(global.dyworld.players[id].posx).."[/color] , [color=blue]"..math.floor(global.dyworld.players[id].posy).."[/color], [color=blue]"..global.dyworld.players[id].surface.."[/color]"}

    if debugger then
    end
end

