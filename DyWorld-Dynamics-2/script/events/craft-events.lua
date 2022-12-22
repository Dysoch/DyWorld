local local_debug = false
local function debug(str)
    if local_debug then
        DyWorld_debug(str)
    end
end

function Event_on_player_crafted_item(event)
	if not game.players[event.player_index].cheat_mode then
		local player = game.players[event.player_index]
		local force = player.force
		local id = event.player_index
		local name = event.item_stack.name
		local count = event.item_stack.count
    
        if not global.dyworld.game.stats then global.dyworld.game.stats = {} end
        if not global.dyworld.game.counters then global.dyworld.game.counters = {} end

        -- global --
        if not global.dyworld.game.counters.crafted then
            global.dyworld.game.counters.crafted = count
        else
            global.dyworld.game.counters.crafted = global.dyworld.game.counters.crafted + count
        end

        -- personal --
        if global.dyworld.players[id] then
            global.dyworld.players[id].stats.total.crafted = global.dyworld.players[id].stats.total.crafted + count
            global.dyworld.players[id].bonus_calc.total = global.dyworld.players[id].bonus_calc.total + 1
            if global.dyworld.players[id].bonus_calc.total >= global.dyworld.players[id].bonus_calc.threshold then
                -- run bonus calc
                global.dyworld.players[id].bonus_calc.total = 0
                debug("craft_event: Bonus threshold reached, started bonus calculation")
            end
            if not global.dyworld.players[id].stats.specific[name] then
                global.dyworld.players[id].stats.specific[name] = count
                debug("craft_event: Created specific crafting table for "..name.." with "..count)
            else
                global.dyworld.players[id].stats.specific[name] = global.dyworld.players[id].stats.specific[name] + count
                debug("craft_event: increased specific crafting table for "..name.." with "..count.." to "..global.dyworld.players[id].stats.specific[name])
            end
        end

	end
end