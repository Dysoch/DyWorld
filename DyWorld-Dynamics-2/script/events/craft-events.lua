local local_debug = false
local local_log = false
local function debug(str)
    local Time = "[color=red]["..global.dyworld.time.log.."][/color]"
    local DyWorld = Time.." - [color=red]DyWorld-Dynamics-2:[/color] "
    if not global.debug then global.debug = {} end
    if local_log then table.insert(global.debug, (Time.." = "..str)) end
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
            XP_Calc(id, (count * 0.1))
            Bonus_Threshold(id)

            if not global.dyworld.players[id].stats.specific.crafted[name] then
                global.dyworld.players[id].stats.specific.crafted[name] = count
                debug("("..id..") Event_on_player_crafted_item: Created specific crafting table for "..name.." with "..count)
            else
                global.dyworld.players[id].stats.specific.crafted[name] = global.dyworld.players[id].stats.specific.crafted[name] + count
                debug("("..id..") Event_on_player_crafted_item: increased specific crafting table for "..name.." with "..count.." to "..global.dyworld.players[id].stats.specific.crafted[name])
            end
        end

        if name == "dynamic-interface-system" then
            DIS_Personal_Crafted(id)
        end
	end
end