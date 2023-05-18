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

local function Time_Surival_Check(id, VAR)
	if VAR == "food" then
		local rate = Round((global.dyworld.players[id].survival.food.rate), 2)
		local capacity = global.dyworld.players[id].survival.food.storage
		local total = capacity / rate
		local seconds_start = math.floor(total)
		local minutes_start = math.floor(seconds_start/60)
		local hours = math.floor(minutes_start/60)
		local minutes = (minutes_start-(hours*60))
		local seconds = (seconds_start-(minutes_start*60))
		return (hours..":"..minutes..":"..seconds)
	elseif VAR == "water" then
		local rate = Round((global.dyworld.players[id].survival.water.rate), 2)
		local capacity = global.dyworld.players[id].survival.water.storage
		local total = capacity / rate
		local seconds_start = math.floor(total)
		local minutes_start = math.floor(seconds_start/60)
		local hours = math.floor(minutes_start/60)
		local minutes = (minutes_start-(hours*60))
		local seconds = (seconds_start-(minutes_start*60))
		return (hours..":"..minutes..":"..seconds)
	end
end

function Personal_GUI_Inner(player, id)
    local inner_frame = player.gui.screen.DyDs_PG_outer_frame.DyDs_PG_main_frame.DyDs_PG_inner_frame
    local display_scroll = inner_frame.add{type = "scroll-pane", name = "", style = "flib_naked_scroll_pane"}

    display_scroll.add{type = "label", name = "", caption = global.dyworld.time.log}

    if not global.dyworld.players[id].stats.codai_level then global.dyworld.players[id].stats.codai_level = 0 end
    
    -- Water --
    if global.dyworld.players[id].stats.codai_level >= 4 then
        display_scroll.add{type = "progressbar", value = (global.dyworld.players[id].survival.water.storage/global.dyworld.players[id].survival.water.storage_max), tooltip = "Water: [color=blue]"..Round(global.dyworld.players[id].survival.water.storage, 2).."[/color]\nMax Water: [color=blue]"..global.dyworld.players[id].survival.water.storage_max.."[/color]\nUse Rate: [color=blue]"..Round((global.dyworld.players[id].survival.water.rate), 2).."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "water").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].survival.water.storage/global.dyworld.players[id].survival.water.storage_max)), caption = "         [color=red]Water[/color]"}
    elseif global.dyworld.players[id].stats.codai_level >= 3 then
        display_scroll.add{type = "label", name = "", caption = "Water: "..((global.dyworld.players[id].survival.water.storage/global.dyworld.players[id].survival.water.storage_max)*100).."%"}
    end
    
    -- Food --
    if global.dyworld.players[id].stats.codai_level >= 4 then
        display_scroll.add{type = "progressbar", value = (global.dyworld.players[id].survival.food.storage/global.dyworld.players[id].survival.food.storage_max), tooltip = "Food: [color=blue]"..Round(global.dyworld.players[id].survival.food.storage, 2).."[/color]\nMax Food: [color=blue]"..global.dyworld.players[id].survival.food.storage_max.."[/color]\nUse Rate: [color=blue]"..Round((global.dyworld.players[id].survival.food.rate), 2).."[/color] per second\nTime Left: [color=blue]"..Time_Surival_Check(id, "food").."[/color]", style = Progress_Surival_Style_Check((global.dyworld.players[id].survival.food.storage/global.dyworld.players[id].survival.food.storage_max)), caption = "         [color=red]Food[/color]"}
    elseif global.dyworld.players[id].stats.codai_level >= 3 then
        display_scroll.add{type = "label", name = "", caption = "Food: "..((global.dyworld.players[id].survival.food.storage/global.dyworld.players[id].survival.food.storage_max)*100).."%"}
    end
end

function Personal_GUI_Main(player, id)
	--local force = player.force
	--local surface = game.players[id].surface.name
	--local outer_frame = player.gui.left.add{type = "frame", name = "DyDs_Personal_GUI", caption = "DyWorld-Dynamics"}
	--local frameflow1 = outer_frame.add{type = "flow", name = "flow1", direction = "vertical"}
    
    
    local screen_element = player.gui.screen
    local outer_frame = screen_element.add{type = "frame", name = "DyDs_PG_outer_frame", style = "outer_frame", visible = true}
    local main_frame = outer_frame.add{type = "frame", name = "DyDs_PG_main_frame", direction = "vertical", visible = true}
    local titlebar = main_frame.add{type = "flow", name = "", style = "flib_titlebar_flow", direction = "horizontal"}
    titlebar.add{type = "label", name = "", style = "frame_title", caption = "C.O.D.A.I.", ignored_by_interaction = true}
    titlebar.add{type = "empty-widget", style = "flib_titlebar_drag_handle", ignored_by_interaction = true}
    titlebar.add{type = "sprite-button", name = "DyDs_PG_close_button", style = "frame_action_button", mouse_button_filter = {"left"}, sprite = "utility/close_white", hovered_sprite = "utility/close_black", clicked_sprite = "utility/close_black", tooltip = "Close"}
    titlebar.drag_target = outer_frame
    main_frame.add{type = "frame", name = "DyDs_PG_inner_frame", direction = "vertical", visible = true, style="inside_shallow_frame"}
    
    Personal_GUI_Inner(player, id)
end

function Toggle_Personal_GUI(player, id)
    if player.gui.screen.DyDs_PG_outer_frame then
        if player.gui.screen.DyDs_PG_inner_frame then
            player.gui.screen.DyDs_PG_inner_frame.destroy()
        end
		player.gui.screen.DyDs_PG_outer_frame.destroy()
    else
        Personal_GUI_Main(player, id)
	end
end

function Refresh_Personal_GUI(player, id)
    if player.gui.screen.DyDs_PG_outer_frame and player.gui.screen.DyDs_PG_outer_frame.DyDs_PG_main_frame and player.gui.screen.DyDs_PG_outer_frame.DyDs_PG_main_frame.DyDs_PG_inner_frame then
		player.gui.screen.DyDs_PG_outer_frame.DyDs_PG_main_frame.DyDs_PG_inner_frame.clear()
        Personal_GUI_Inner(player, id)
	end
end

script.on_event("DyWorld_Personal_GUI_Key", function(event)
    if debugger or global.dyworld.players[player_index].stats.codai_level >= 1 then
        Toggle_Personal_GUI(game.players[event.player_index], event.player_index)
    else
        if not global.dyworld.players[player_index].messages.codai then global.dyworld.players[player_index].messages.codai = {} end
        if not global.dyworld.players[player_index].messages.codai["0"] then global.dyworld.players[player_index].messages.codai["0"] = true end
        game.players[player_index].print("C.O.D.A.I is disabled. Try again when it is unlocked!")
    end
end)



