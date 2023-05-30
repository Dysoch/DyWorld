

local function number_abre(number, km)
    if km then
        if number >= 1000000 then
            return "[color=blue]"..Round((number / 1000000), 2).."Mm[/color]"
        elseif number >= 1000 then
            return "[color=blue]"..Round((number / 1000), 2).."Km[/color]"
        else
            return "[color=blue]"..Round((number), 2).."m[/color]"
        end
    else
        if number >= 1000000 then
            return "[color=blue]"..Round((number / 1000000), 2).."m[/color]"
        elseif number >= 1000 then
            return "[color=blue]"..Round((number / 1000), 2).."k[/color]"
        else
            return "[color=blue]"..Round((number), 2).."[/color]"
        end
    end
end

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
    if page_name == "stats" then
        element.add{type="label", name="", caption={"DyWorld.page_stats"}}
        if (global.dyworld.players[player_index].stats.codai_level.total >= 1) then
            local table2 = element.add{type = "table", name = "table2", column_count = 12, draw_vertical_lines = false, draw_horizontal_lines = false, vertical_centering = true, draw_horizontal_line_after_headers = false}

            table2.add{type = "label", caption = "Name"}
            table2.add{type = "label", caption = {"DyWorld_2.crafted"}, tooltip = {"DyWorld_2.crafted_tp"}}
            table2.add{type = "label", caption = {"DyWorld_2.mined"}, tooltip = {"DyWorld_2.mined_tp"}}
            table2.add{type = "label", caption = {"DyWorld_2.built"}, tooltip = {"DyWorld_2.built_tp"}}
            table2.add{type = "label", caption = {"DyWorld_2.picked"}, tooltip = {"DyWorld_2.picked_tp"}}
            table2.add{type = "label", caption = {"DyWorld_2.killed"}, tooltip = {"DyWorld_2.killed_tp"}}
            table2.add{type = "label", caption = {"DyWorld_2.odometer_1"}, tooltip = {"DyWorld_2.odometer_1_tp"}}
            table2.add{type = "label", caption = {"DyWorld_2.odometer_2"}, tooltip = {"DyWorld_2.odometer_2_tp"}}
            table2.add{type = "label", caption = {"DyWorld_2.odometer_3"}, tooltip = {"DyWorld_2.odometer_3_tp"}}
            table2.add{type = "label", caption = {"DyWorld_2.food"}, tooltip = {"DyWorld_2.food_tp"}}
            table2.add{type = "label", caption = {"DyWorld_2.water"}, tooltip = {"DyWorld_2.water_tp"}}
            table2.add{type = "label", caption = {"DyWorld_2.capsules"}, tooltip = {"DyWorld_2.capsules_tp"}}
            for i = 1, 12 do
                table2.add{type = "line", direction = "horizontal"}
            end

            for k,v in pairs(global.dyworld.players) do
                table2.add{type = "label", caption = v.name}
                table2.add{type = "label", caption = number_abre(v.stats.total.crafted)}
                table2.add{type = "label", caption = number_abre(v.stats.total.mined)}
                table2.add{type = "label", caption = number_abre(v.stats.total.build)}
                table2.add{type = "label", caption = number_abre(v.stats.total.picked)}
                table2.add{type = "label", caption = number_abre(v.stats.total.killed)}
                table2.add{type = "label", caption = number_abre(v.stats.total.odometer_walk, true)}
                table2.add{type = "label", caption = number_abre(v.stats.total.odometer_car, true)}
                table2.add{type = "label", caption = number_abre(v.stats.total.odometer_train, true)}
                table2.add{type = "label", caption = number_abre(v.stats.total.food_used)}
                table2.add{type = "label", caption = number_abre(v.stats.total.water_used)}
                table2.add{type = "label", caption = number_abre(v.stats.total.capsules)}

                for i = 1, 12 do
                    table2.add{type = "line", direction = "horizontal"}
                end
            end
            table2.add{type = "label", caption = {"DyWorld_2.total"}, tooltip = {"DyWorld_2.total_tp"}}
            table2.add{type = "label", caption = number_abre(global.dyworld.game.counters.crafted or 0)}
            table2.add{type = "label", caption = number_abre(global.dyworld.game.counters.mined or 0)}
            table2.add{type = "label", caption = number_abre(global.dyworld.game.counters.build or 0)}
            table2.add{type = "label", caption = number_abre(global.dyworld.game.counters.picked or 0)}
            table2.add{type = "label", caption = number_abre(global.dyworld.game.counters.killed or 0)}
            table2.add{type = "label", caption = number_abre(global.dyworld.game.counters.odometer_walk or 0, true)}
            table2.add{type = "label", caption = number_abre(global.dyworld.game.counters.odometer_car or 0, true)}
            table2.add{type = "label", caption = number_abre(global.dyworld.game.counters.odometer_train or 0, true)}
            table2.add{type = "label", caption = number_abre(global.dyworld.game.counters.food_used or 0)}
            table2.add{type = "label", caption = number_abre(global.dyworld.game.counters.water_used or 0)}
            table2.add{type = "label", caption = number_abre(global.dyworld.game.counters.capsules or 0)}
        end
        element.add{type = "line", direction = "horizontal"}
        if (global.dyworld.players[player_index].stats.codai_level.total >= 2) then
            element.add{type = "label", name = "", caption = "[color=red]Work In Progress[/color]"}
        end
        element.add{type = "line", direction = "horizontal"}
        if (global.dyworld.players[player_index].stats.codai_level.total >= 3) then
            element.add{type = "label", name = "", caption = "Attributes"}
            local table2 = element.add{type = "table", name = "", column_count = 8, draw_vertical_lines = false, draw_horizontal_lines = true, vertical_centering = false, horizontal_centering = false, draw_horizontal_line_after_headers = false}
		
            table2.add{type = "label", caption = ""}
            table2.add{type = "label", caption = {"DyWorld_2.native"}}
            table2.add{type = "label", caption = {"DyWorld_2.stats"}}
            table2.add{type = "label", caption = {"DyWorld_2.implants"}}
            table2.add{type = "label", caption = {"DyWorld_2.research"}}
            table2.add{type = "label", caption = {"DyWorld_2.bonus"}}
            table2.add{type = "label", caption = {"DyWorld_2.total"}}
            table2.add{type = "label", caption = {"DyWorld_2.main"}}
            for k,v in pairs(global.dyworld.players[player_index].attributes.primary) do
                table2.add{type = "label", caption = {"DyWorld_2."..k}}
                table2.add{type = "label", caption = "[color=cyan]"..Round(v.native, 2).."[/color]", tooltip = v.native}
                table2.add{type = "label", caption = "[color=cyan]"..Round(v.stats, 2).."[/color]", tooltip = v.stats}
                table2.add{type = "label", caption = "[color=cyan]"..Round(v.implant, 2).."[/color]", tooltip = v.implant}
                table2.add{type = "label", caption = "[color=cyan]"..Round(v.tech, 2).."[/color]", tooltip = v.tech}
                table2.add{type = "label", caption = "[color=cyan]"..Round(v.bonus, 2).."[/color]", tooltip = v.bonus}
                table2.add{type = "label", caption = "[color=cyan]"..Round(v.total, 2).."[/color]", tooltip = v.total}
                table2.add{type = "label", caption = "[color=red]NA[/color]"}
            end
            table2.add{type = "line", direction = "horizontal"}
            table2.add{type = "line", direction = "horizontal"}
            table2.add{type = "line", direction = "horizontal"}
            table2.add{type = "line", direction = "horizontal"}
            table2.add{type = "line", direction = "horizontal"}
            table2.add{type = "line", direction = "horizontal"}
            table2.add{type = "line", direction = "horizontal"}
            table2.add{type = "line", direction = "horizontal"}
            for k,v in pairs(global.dyworld.players[player_index].attributes.secondary) do
                table2.add{type = "label", caption = {"DyWorld_2."..k}}
                table2.add{type = "label", caption = "[color=cyan]"..Round(v.native, 2).."[/color]", tooltip = v.native}
                table2.add{type = "label", caption = "[color=cyan]"..Round(v.stats, 2).."[/color]", tooltip = v.stats}
                table2.add{type = "label", caption = "[color=cyan]"..Round(v.implant, 2).."[/color]", tooltip = v.implant}
                table2.add{type = "label", caption = "[color=cyan]"..Round(v.tech, 2).."[/color]", tooltip = v.tech}
                table2.add{type = "label", caption = "[color=red]NA[/color]"}
                table2.add{type = "label", caption = "[color=cyan]"..Round(v.total, 2).."[/color]", tooltip = v.total}
                table2.add{type = "label", caption = {"DyWorld_2."..v.main}}
            end
        end
	end

    if page_name == "bonuses" and (global.dyworld.players[player_index].stats.codai_level.total >= 1) then
		element.add{type = "label", name = "", caption = {"DyWorld.page_bonuses"}}
        local table2 = element.add{type = "table", name = "", column_count = 10, draw_vertical_lines = false, draw_horizontal_lines = false, vertical_centering = true, draw_horizontal_line_after_headers = false}
		
		table2.add{type = "label", caption = ""}
		table2.add{type = "label", caption = {"DyWorld_2.native"}}
		table2.add{type = "label", caption = {"DyWorld_2.stats"}}
		table2.add{type = "label", caption = {"DyWorld_2.implants"}}
		table2.add{type = "label", caption = {"DyWorld_2.research"}}
		table2.add{type = "label", caption = {"DyWorld_2.deaths"}}
		table2.add{type = "label", caption = {"DyWorld_2.achievements"}}
		table2.add{type = "label", caption = {"DyWorld_2.total"}}
		table2.add{type = "label", caption = {"DyWorld_2.enabled"}}
		table2.add{type = "label", caption = {"DyWorld_2.toggled"}}
        for k,v in pairs(global.dyworld.players[player_index].bonus) do
            table2.add{type = "label", caption = {"DyWorld_2."..k}}
            table2.add{type = "label", caption = "[color=cyan]"..Round(v.native, v.min_max.rounded).."[/color]", tooltip = v.native}
            table2.add{type = "label", caption = "[color=cyan]"..Round(v.stats, v.min_max.rounded).."[/color]", tooltip = v.stats}
            table2.add{type = "label", caption = "[color=cyan]"..Round(v.implants, v.min_max.rounded).."[/color]", tooltip = v.implants}
            table2.add{type = "label", caption = "[color=cyan]"..Round(v.research, v.min_max.rounded).."[/color]", tooltip = v.research}
            table2.add{type = "label", caption = "[color=red]"..Round(v.death, v.min_max.rounded).."[/color]", tooltip = {"DyWorld_2.deaths_tp_2"}}
            table2.add{type = "label", caption = "[color=cyan]"..Round((v.achievements * 100), 2).."%[/color]", tooltip = {"DyWorld_2.achievements_tp_2"}}
            table2.add{type = "label", caption = "[color=blue]"..Round(v.total, v.min_max.rounded).."[/color]", tooltip = {"DyWorld_2.total_tp_2"}}
            if v.enabled then
                table2.add{type = "label", caption = "[color=green] ✔[/color]"}
            else
                table2.add{type = "label", caption = "[color=red] ✘[/color]"}
            end
            table2.add{type = "checkbox", caption = "", state = v.toggled, name = "dy_player_"..player_index.."toggle_"..k}
            table2.add{type = "line", direction = "horizontal"}
            table2.add{type = "line", direction = "horizontal"}
            table2.add{type = "line", direction = "horizontal"}
            table2.add{type = "line", direction = "horizontal"}
            table2.add{type = "line", direction = "horizontal"}
            table2.add{type = "line", direction = "horizontal"}
            table2.add{type = "line", direction = "horizontal"}
            table2.add{type = "line", direction = "horizontal"}
            table2.add{type = "line", direction = "horizontal"}
            table2.add{type = "line", direction = "horizontal"}
        end
	end
end