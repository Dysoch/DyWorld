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

function Event_on_entity_died(event)
	local force = event.force  -- force that kill
	local killer = event.cause -- cause of the kill
	local type_killed = event.entity.type
	local name = event.entity.name
	local position = event.entity.position
    
    if not global.dyworld.game.stats then global.dyworld.game.stats = {} end
    if not global.dyworld.game.counters then global.dyworld.game.counters = {} end

    -- global --
    if not global.dyworld.game.counters.killed then
        global.dyworld.game.counters.killed = 1
    else
        global.dyworld.game.counters.killed = global.dyworld.game.counters.killed + 1
    end

    -- personal --
	if killer and killer.valid and killer.type == "character" then
	    if killer.player and killer.player.index then
            local id = killer.player.index
            if global.dyworld.players[id] then
                global.dyworld.players[id].stats.total.killed = global.dyworld.players[id].stats.total.killed + 1

                -- xp --
                XP_Calc(id, (1 * 1))
                Bonus_Threshold(id)
                
                if not global.dyworld.players[id].stats.specific.killed[name] then
                    global.dyworld.players[id].stats.specific.killed[name] = 1
                    debug("("..id..") Event_on_entity_died: Created specific mining table for "..name.." with 1")
                else
                    global.dyworld.players[id].stats.specific.killed[name] = global.dyworld.players[id].stats.specific.killed[name] + 1
                    debug("("..id..") Event_on_entity_died: increased specific mining table for "..name.." with 1 to "..global.dyworld.players[id].stats.specific.killed[name])
                end
            end
        end
    end

end