

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
                    element.add{type = "label", name = "", caption = k.." = "..v}
                end
                element.add{type = "label", name = "", caption = "\n\n\n\n\n"}
            end
        end
        if page_name == "d_mined" then
            for id,I in pairs(global.dyworld.players) do
                element.add{type = "label", name = "", caption = "Player "..tostring(id).." \n"}
                for k,v in pairs(I.stats.specific.mined) do
                    element.add{type = "label", name = "", caption = k.." = "..v}
                end
                element.add{type = "label", name = "", caption = "\n\n\n\n\n"}
            end
        end
        if page_name == "d_build" then
            for id,I in pairs(global.dyworld.players) do
                element.add{type = "label", name = "", caption = "Player "..tostring(id).." \n"}
                --[[for k,v in pairs(I.stats.specific.mined) do
                    element.add{type = "label", name = "", caption = k.." = "..v.}
                end]]--
                element.add{type = "label", name = "", caption = "\n\n\n\n\n"}
            end
        end
        if page_name == "d_log" then
            for k,v in pairs(global.debug) do
                element.add{type = "label", name = "", caption = v}
            end
        end
    end
end