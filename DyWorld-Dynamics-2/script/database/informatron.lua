

function dyworld_menu(player_index)
	local Table = {
		tips = 1,
		info = 1,
		entities = {
			trees = 1,
		},
		mechanics = {
			survival = {
                food = 1,
                water = 1,
				temperature = 1,
				radiation = 1,
				pollution = 1,
				implants = 1,
				health = 1,
			},
			bonus = {
				stats = 1,
				bonuses = 1,
			},
            codai = 1,
		},
	}
	-- Main Pages --
    if debugger then
		Table.debug = {
            d_crafted = 1,
            d_mined = 1,
            d_build = 1,
            d_log = 1,
        }
    end
    return Table
end

function dyworld_page_content(page_name, player_index, element)
	-- debug page
    if debugger then
        if page_name == "debug" then
            element.add{type = "label", name = "", caption = {"DyWorld.page_debug"}}
        end
        if page_name == "d_crafted" then
            for id,I in pairs(global.dyworld.players) do
                element.add{type = "label", name = "", caption = "Player "..tostring(id).." \n"}
                for k,v in pairs(I.stats.specific.crafted) do
                    element.add{type = "label", name = "", caption = "[color=red]"..k.."[/color] = [color=blue]"..v.."[/color]"}
                end
                element.add{type = "label", name = "", caption = "\n\n\n\n\n"}
            end
        end
        if page_name == "d_mined" then
            for id,I in pairs(global.dyworld.players) do
                element.add{type = "label", name = "", caption = "Player "..tostring(id).." \n"}
                for k,v in pairs(I.stats.specific.mined) do
                    element.add{type = "label", name = "", caption = "[color=red]"..k.."[/color] = [color=blue]"..v.."[/color]"}
                end
                element.add{type = "label", name = "", caption = "\n\n\n\n\n"}
            end
        end
        if page_name == "d_build" then
            local table2 = element.add{type = "table", name = "", column_count = 2, draw_vertical_lines = true, draw_horizontal_lines = true, vertical_centering = true, horizontal_centering = true, draw_horizontal_line_after_headers = false}
            table2.add{type = "label", name = "", caption = "Name"}
            table2.add{type = "label", name = "", caption = "Count"}
            for k,v in pairs(global.dyworld.game.world.built) do
                if v >= 1 then
                    table2.add{type = "label", name = "", caption = "[color=red]"..k.."[/color]"}
                    table2.add{type = "label", name = "", caption = "    [color=blue]"..v.."[/color]"}
                end
            end
            for id,I in pairs(global.dyworld.players) do
                element.add{type = "label", name = "", caption = "\n"}
                element.add{type = "label", name = "", caption = "Player "..tostring(id)}
                local table3 = element.add{type = "table", name = "", column_count = 2, draw_vertical_lines = true, draw_horizontal_lines = true, vertical_centering = true, horizontal_centering = true, draw_horizontal_line_after_headers = false}
                table3.add{type = "label", name = "", caption = "Name"}
                table3.add{type = "label", name = "", caption = "Count"}
                for k,v in pairs(I.stats.specific.build) do
                    table3.add{type = "label", name = "", caption = "[color=red]"..k.."[/color]"}
                    table3.add{type = "label", name = "", caption = "    [color=blue]"..v.."[/color]"}
                end
            end
        end
        if page_name == "d_log" then
            for k,v in pairs(global.debug) do
                element.add{type = "label", name = "", caption = v}
            end
        end
    end
    if page_name == "codai" then
        element.add{type = "label", name = "", caption = {"DyWorld.page_codai_0"}}
        if global.dyworld.players[player_index].stats.codai_level.total >= 0 then
            element.add{type = "label", name = "", caption = {"DyWorld.page_codai_1"}}
        end
        if global.dyworld.players[player_index].stats.codai_level.total >= 1 then
            element.add{type = "label", name = "", caption = {"DyWorld.page_codai_2"}}
        end
        if global.dyworld.players[player_index].stats.codai_level.total >= 2 then
            element.add{type = "label", name = "", caption = {"DyWorld.page_codai_3"}}
        end
        if global.dyworld.players[player_index].stats.codai_level.total >= 3 then
            element.add{type = "label", name = "", caption = {"DyWorld.page_codai_4"}}
        end
        if global.dyworld.players[player_index].stats.codai_level.total >= 4 then
            element.add{type = "label", name = "", caption = {"DyWorld.page_codai_5"}}
        end
        if global.dyworld.players[player_index].stats.codai_level.total >= 5 then
            element.add{type = "label", name = "", caption = {"DyWorld.page_codai_6"}}
        end
        if global.dyworld.players[player_index].stats.codai_level.total >= 6 then
            element.add{type = "label", name = "", caption = {"DyWorld.page_codai_7"}}
        end
        if global.dyworld.players[player_index].stats.codai_level.total >= 7 then
            element.add{type = "label", name = "", caption = {"DyWorld.page_codai_8"}}
        end
        if global.dyworld.players[player_index].stats.codai_level.total >= 8 then
            element.add{type = "label", name = "", caption = {"DyWorld.page_codai_9"}}
        end
        if global.dyworld.players[player_index].stats.codai_level.total >= 9 then
            element.add{type = "label", name = "", caption = {"DyWorld.page_codai_10"}}
        end
        if global.dyworld.players[player_index].stats.codai_level.total >= 10 then
            element.add{type = "label", name = "", caption = {"DyWorld.page_codai_11"}}
        end
    end
    if page_name == "stats" and (global.dyworld.players[player_index].stats.codai_level.total >= 1) then
		element.add{type="label", name="", caption={"DyWorld.page_stats"}}
	
		local table2 = element.add{type = "table", name = "table2", column_count = 3, draw_vertical_lines = false, draw_horizontal_lines = false, vertical_centering = true, draw_horizontal_line_after_headers = false}
		
		table2.add{type = "label", caption = ""}
		table2.add{type = "label", caption = {"DyWorld_2.personal"}, tooltip = {"DyWorld_2.personal_tp"}}
		table2.add{type = "label", caption = {"DyWorld_2.total"}, tooltip = {"DyWorld_2.total_tp"}}
	
		table2.add{type = "label", caption = {"DyWorld_2.crafted"}, tooltip = {"DyWorld_2.crafted_tp"}}
        if global.dyworld.players[player_index].stats.total.crafted >= 1000000 then
            table2.add{type = "label", caption = "[color=blue]"..Round((global.dyworld.players[player_index].stats.total.crafted / 1000000), 2).."m[/color]"}
        elseif global.dyworld.players[player_index].stats.total.crafted >= 1000 then
            table2.add{type = "label", caption = "[color=blue]"..Round((global.dyworld.players[player_index].stats.total.crafted / 1000), 2).."k[/color]"}
        else
            table2.add{type = "label", caption = "[color=blue]"..Round(global.dyworld.players[player_index].stats.total.crafted, 2).."[/color]"}
        end
        if (global.dyworld.game.counters.crafted or 0) >= 1000000 then
            table2.add{type = "label", caption = "[color=blue]"..Round(((global.dyworld.game.counters.crafted or 0) / 1000000), 2).."m[/color]"}
        elseif (global.dyworld.game.counters.crafted or 0) >= 1000 then
            table2.add{type = "label", caption = "[color=blue]"..Round(((global.dyworld.game.counters.crafted or 0) / 1000), 2).."k[/color]"}
        else
            table2.add{type = "label", caption = "[color=blue]"..Round((global.dyworld.game.counters.crafted or 0), 2).."[/color]"}
        end
		
		table2.add{type = "label", caption = {"DyWorld_2.mined"}, tooltip = {"DyWorld_2.mined_tp"}}
        if global.dyworld.players[player_index].stats.total.mined >= 1000000 then
            table2.add{type = "label", caption = "[color=blue]"..Round((global.dyworld.players[player_index].stats.total.mined / 1000000), 2).."m[/color]"}
        elseif global.dyworld.players[player_index].stats.total.mined >= 1000 then
            table2.add{type = "label", caption = "[color=blue]"..Round((global.dyworld.players[player_index].stats.total.mined / 1000), 2).."k[/color]"}
        else
            table2.add{type = "label", caption = "[color=blue]"..Round(global.dyworld.players[player_index].stats.total.mined, 2).."[/color]"}
        end
        if (global.dyworld.game.counters.mined or 0) >= 1000000 then
            table2.add{type = "label", caption = "[color=blue]"..Round(((global.dyworld.game.counters.mined or 0) / 1000000), 2).."m[/color]"}
        elseif (global.dyworld.game.counters.mined or 0) >= 1000 then
            table2.add{type = "label", caption = "[color=blue]"..Round(((global.dyworld.game.counters.mined or 0) / 1000), 2).."k[/color]"}
        else
            table2.add{type = "label", caption = "[color=blue]"..Round((global.dyworld.game.counters.mined or 0), 2).."[/color]"}
        end
		
		table2.add{type = "label", caption = {"DyWorld_2.built"}, tooltip = {"DyWorld_2.built_tp"}}
        if global.dyworld.players[player_index].stats.total.build >= 1000000 then
            table2.add{type = "label", caption = "[color=blue]"..Round((global.dyworld.players[player_index].stats.total.build / 1000000), 2).."m[/color]"}
        elseif global.dyworld.players[player_index].stats.total.build >= 1000 then
            table2.add{type = "label", caption = "[color=blue]"..Round((global.dyworld.players[player_index].stats.total.build / 1000), 2).."k[/color]"}
        else
            table2.add{type = "label", caption = "[color=blue]"..Round(global.dyworld.players[player_index].stats.total.build, 2).."[/color]"}
        end
        if (global.dyworld.game.counters.build or 0) >= 1000000 then
            table2.add{type = "label", caption = "[color=blue]"..Round(((global.dyworld.game.counters.build or 0) / 1000000), 2).."m[/color]"}
        elseif (global.dyworld.game.counters.build or 0) >= 1000 then
            table2.add{type = "label", caption = "[color=blue]"..Round(((global.dyworld.game.counters.build or 0) / 1000), 2).."k[/color]"}
        else
            table2.add{type = "label", caption = "[color=blue]"..Round((global.dyworld.game.counters.build or 0), 2).."[/color]"}
        end
		
		table2.add{type = "label", caption = {"DyWorld_2.picked"}, tooltip = {"DyWorld_2.picked_tp"}}
        if global.dyworld.players[player_index].stats.total.picked >= 1000000 then
            table2.add{type = "label", caption = "[color=blue]"..Round((global.dyworld.players[player_index].stats.total.picked / 1000000), 2).."m[/color]"}
        elseif global.dyworld.players[player_index].stats.total.picked >= 1000 then
            table2.add{type = "label", caption = "[color=blue]"..Round((global.dyworld.players[player_index].stats.total.picked / 1000), 2).."k[/color]"}
        else
            table2.add{type = "label", caption = "[color=blue]"..Round(global.dyworld.players[player_index].stats.total.picked, 2).."[/color]"}
        end
        if (global.dyworld.game.counters.picked or 0) >= 1000000 then
            table2.add{type = "label", caption = "[color=blue]"..Round(((global.dyworld.game.counters.picked or 0) / 1000000), 2).."m[/color]"}
        elseif (global.dyworld.game.counters.picked or 0) >= 1000 then
            table2.add{type = "label", caption = "[color=blue]"..Round(((global.dyworld.game.counters.picked or 0) / 1000), 2).."k[/color]"}
        else
            table2.add{type = "label", caption = "[color=blue]"..Round((global.dyworld.game.counters.picked or 0), 2).."[/color]"}
        end
		
		table2.add{type = "label", caption = {"DyWorld_2.killed"}, tooltip = {"DyWorld_2.killed_tp"}}
        if global.dyworld.players[player_index].stats.total.killed >= 1000000 then
            table2.add{type = "label", caption = "[color=blue]"..Round((global.dyworld.players[player_index].stats.total.killed / 1000000), 2).."m[/color]"}
        elseif global.dyworld.players[player_index].stats.total.killed >= 1000 then
            table2.add{type = "label", caption = "[color=blue]"..Round((global.dyworld.players[player_index].stats.total.killed / 1000), 2).."k[/color]"}
        else
            table2.add{type = "label", caption = "[color=blue]"..Round(global.dyworld.players[player_index].stats.total.killed, 2).."[/color]"}
        end
        if (global.dyworld.game.counters.killed or 0) >= 1000000 then
            table2.add{type = "label", caption = "[color=blue]"..Round(((global.dyworld.game.counters.killed or 0) / 1000000), 2).."m[/color]"}
        elseif (global.dyworld.game.counters.killed or 0) >= 1000 then
            table2.add{type = "label", caption = "[color=blue]"..Round(((global.dyworld.game.counters.killed or 0) / 1000), 2).."k[/color]"}
        else
            table2.add{type = "label", caption = "[color=blue]"..Round((global.dyworld.game.counters.killed or 0), 2).."[/color]"}
        end
	end

    if page_name == "bonuses" and (global.dyworld.players[player_index].stats.codai_level.total >= 1) then
		element.add{type = "label", name = "", caption = {"DyWorld.page_bonuses"}}
        local table2 = element.add{type = "table", name = "", column_count = 10, draw_vertical_lines = true, draw_horizontal_lines = true, vertical_centering = true, horizontal_centering = true, draw_horizontal_line_after_headers = false}
		
		table2.add{type = "label", caption = ""}
		table2.add{type = "label", caption = {"DyWorld_2.native"}}
		table2.add{type = "label", caption = {"DyWorld_2.stats"}}
		table2.add{type = "label", caption = {"DyWorld_2.implants"}}
		table2.add{type = "label", caption = {"DyWorld_2.research"}}
		table2.add{type = "label", caption = {"DyWorld_2.achievements"}}
		table2.add{type = "label", caption = {"DyWorld_2.deaths"}}
		table2.add{type = "label", caption = {"DyWorld_2.total"}}
		table2.add{type = "label", caption = {"DyWorld_2.enabled"}}
		table2.add{type = "label", caption = {"DyWorld_2.toggled"}}
        for k,v in pairs(global.dyworld.players[player_index].bonus) do
		    table2.add{type = "label", caption = "[color=white]"..k..": [/color]"}
		    table2.add{type = "label", caption = "[color=cyan]"..Round(v.native, 2).."[/color]"}
		    table2.add{type = "label", caption = "[color=cyan]"..Round(v.stats, 2).."[/color]"}
		    table2.add{type = "label", caption = "[color=cyan]"..Round(v.implants, 2).."[/color]"}
		    table2.add{type = "label", caption = "[color=cyan]"..Round(v.research, 2).."[/color]"}
		    table2.add{type = "label", caption = "[color=cyan]"..Round(v.achievements, 2).."[/color]"}
		    table2.add{type = "label", caption = "[color=red]"..Round(v.death, 2).."[/color]", tooltip = {"DyWorld_2.deaths_tp_2"}}
		    table2.add{type = "label", caption = "[color=blue]"..Round(v.total, 2).."[/color]", tooltip = {"DyWorld_2.total_tp_2"}}
            if v.enabled then
                table2.add{type = "label", caption = "[color=green] ✔[/color]"}
            else
                table2.add{type = "label", caption = "[color=red] ✘[/color]"}
            end
            if v.toggled then
                table2.add{type = "label", caption = "[color=green] ✔[/color]"}
            else
                table2.add{type = "label", caption = "[color=red] ✘[/color]"}
            end
        end
	end
end