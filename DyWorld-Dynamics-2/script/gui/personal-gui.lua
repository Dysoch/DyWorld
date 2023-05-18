

function Personal_GUI_Inner(player, id)
    local inner_frame = player.gui.screen.DyDs_PG_outer_frame.DyDs_PG_main_frame.DyDs_PG_inner_frame
    local display_scroll = inner_frame.add{type = "scroll-pane", name = "", style = "flib_naked_scroll_pane"}
    display_scroll.add{type = "label", name = "", caption = global.dyworld.time.log}
end

function Personal_GUI_Main(player, id)
	--local force = player.force
	--local surface = game.players[id].surface.name
	--local outer_frame = player.gui.left.add{type = "frame", name = "DyDs_Personal_GUI", caption = "DyWorld-Dynamics"}
	--local frameflow1 = outer_frame.add{type = "flow", name = "flow1", direction = "vertical"}
    
    
    local screen_element = player.gui.screen
    local outer_frame = screen_element.add{type = "frame", name = "DyDs_PG_outer_frame", style = "outer_frame", visible = true}
    local main_frame = outer_frame.add{type = "frame", name = "DyDs_PG_main_frame", direction = "vertical", visible = true}
    local titlebar = main_frame.add{type = "flow", name = "milestones_titlebar", style = "flib_titlebar_flow", direction = "horizontal"}
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
    Toggle_Personal_GUI(game.players[event.player_index], event.player_index)
end)



