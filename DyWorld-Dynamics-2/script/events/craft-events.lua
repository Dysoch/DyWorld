local local_debug = false
local function debug(str)
    local Time = "[color=red]["..global.dyworld.time.log.."][/color]"
    local DyWorld = Time.." - [color=red]DyWorld-Dynamics-2:[/color] "
    if not global.debug then global.debug = {} end
    table.insert(global.debug, (Time.." = "..str))
    if debugger and local_debug then
        for k,v in pairs(game.players) do
            v.print(DyWorld..str)
        end
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

            -- xp --
            global.dyworld.players[id].stats.xp = global.dyworld.players[id].stats.xp + (count * 0.1)
            debug("("..id..") craft_event: added "..(count * 0.1).." xp, xp now: "..global.dyworld.players[id].stats.xp)
            if global.dyworld.players[id].stats.xp >= global.dyworld.players[id].stats.xp_to_level then
                global.dyworld.players[id].stats.xp = 0
                global.dyworld.players[id].stats.xp_to_level = global.dyworld.players[id].stats.xp_to_level * (1 + math.random())
                global.dyworld.players[id].stats.level = global.dyworld.players[id].stats.level + 1
                global.dyworld.players[id].bonus_calc.threshold = 250 * global.dyworld.players[id].stats.level
                debug("("..id..") craft_event: gained a level, level is now "..global.dyworld.players[id].stats.level..", xp needed to next level is now: "..global.dyworld.players[id].stats.xp_to_level..". Threshold for bonuscalc is now "..global.dyworld.players[id].bonus_calc.threshold)
            end

            global.dyworld.players[id].bonus_calc.total = global.dyworld.players[id].bonus_calc.total + 1
            if global.dyworld.players[id].bonus_calc.total >= global.dyworld.players[id].bonus_calc.threshold then
                -- run bonus calc
                global.dyworld.players[id].bonus_calc.total = 0
                debug("("..id..") craft_event: Bonus threshold reached, started bonus calculation")
            end
            if not global.dyworld.players[id].stats.specific.crafted[name] then
                global.dyworld.players[id].stats.specific.crafted[name] = count
                debug("("..id..") craft_event: Created specific crafting table for "..name.." with "..count)
            else
                global.dyworld.players[id].stats.specific.crafted[name] = global.dyworld.players[id].stats.specific.crafted[name] + count
                debug("("..id..") craft_event: increased specific crafting table for "..name.." with "..count.." to "..global.dyworld.players[id].stats.specific.crafted[name])
            end
        end

	end
end