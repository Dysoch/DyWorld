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

function Event_on_picked_up_item(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.item_stack.name
	local count = event.item_stack.count
    
    if not global.dyworld.game.stats then global.dyworld.game.stats = {} end
    if not global.dyworld.game.counters then global.dyworld.game.counters = {} end

    -- global --
    if not global.dyworld.game.counters.picked then
        global.dyworld.game.counters.picked = count
    else
        global.dyworld.game.counters.picked = global.dyworld.game.counters.picked + count
    end

    -- personal --
    if global.dyworld.players[id] and Player_Check(id) then
        global.dyworld.players[id].stats.total.picked = global.dyworld.players[id].stats.total.picked + count

        -- xp --
        XP_Calc(id, (count * 0.05))
        Bonus_Threshold(id)
        
        if not global.dyworld.players[id].stats.specific.picked[name] then
            global.dyworld.players[id].stats.specific.picked[name] = count
            debug("("..id..") Event_on_picked_up_item: Created specific mining table for "..name.." with "..count)
        else
            global.dyworld.players[id].stats.specific.picked[name] = global.dyworld.players[id].stats.specific.picked[name] + count
            debug("("..id..") Event_on_picked_up_item: increased specific mining table for "..name.." with "..count.." to "..global.dyworld.players[id].stats.specific.picked[name])
        end
    end
end

function Event_on_player_mined_item(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.item_stack.name
	local count = event.item_stack.count
    
    if not global.dyworld.game.stats then global.dyworld.game.stats = {} end
    if not global.dyworld.game.counters then global.dyworld.game.counters = {} end

    -- global --
    if not global.dyworld.game.counters.mined then
        global.dyworld.game.counters.mined = count
    else
        global.dyworld.game.counters.mined = global.dyworld.game.counters.mined + count
    end

    -- personal --
    if global.dyworld.players[id] and Player_Check(id) then
        global.dyworld.players[id].stats.total.mined = global.dyworld.players[id].stats.total.mined + count

        -- xp --
        XP_Calc(id, (count * 0.05))
        Bonus_Threshold(id)
        
        if not global.dyworld.players[id].stats.specific.mined[name] then
            global.dyworld.players[id].stats.specific.mined[name] = count
            debug("("..id..") Event_on_player_mined_item: Created specific mining table for "..name.." with "..count)
        else
            global.dyworld.players[id].stats.specific.mined[name] = global.dyworld.players[id].stats.specific.mined[name] + count
            debug("("..id..") Event_on_player_mined_item: increased specific mining table for "..name.." with "..count.." to "..global.dyworld.players[id].stats.specific.mined[name])
        end
    end
end

function Event_on_pre_player_mined_item(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.entity.name
	local type = event.entity.type
    
end

function Event_on_player_mined_entity(event)
	local player = game.players[event.player_index]
	local force = player.force
	local position = event.entity.position
	local type = event.entity.type
	local name = event.entity.name
    
    if not global.dyworld.game.stats then global.dyworld.game.stats = {} end
    if not global.dyworld.game.counters then global.dyworld.game.counters = {} end
    if not global.dyworld.game.world then global.dyworld.game.world = {} end
    if not global.dyworld.game.world.built then global.dyworld.game.world.built = {} end

    -- global --
    if name ~= "entity-ghost" then
        if not global.dyworld.game.world.built[name] then
            global.dyworld.game.world.built[name] = 0
        else
            global.dyworld.game.world.built[name] = global.dyworld.game.world.built[name] - 1
            if global.dyworld.game.world.built[name] <=0 then global.dyworld.game.world.built[name] = 0 end
        end
    end
end

function Event_on_robot_mined_entity(event)
	local position = event.entity.position
	local type = event.entity.type
	local name = event.entity.name
    
    if not global.dyworld.game.stats then global.dyworld.game.stats = {} end
    if not global.dyworld.game.counters then global.dyworld.game.counters = {} end
    if not global.dyworld.game.world then global.dyworld.game.world = {} end
    if not global.dyworld.game.world.built then global.dyworld.game.world.built = {} end

    -- global --
    if not global.dyworld.game.counters.mined then
        global.dyworld.game.counters.mined = 1
    else
        global.dyworld.game.counters.mined = global.dyworld.game.counters.mined + 1
    end

    if name ~= "entity-ghost" then
        if not global.dyworld.game.world.built[name] then
            global.dyworld.game.world.built[name] = 0
        else
            global.dyworld.game.world.built[name] = global.dyworld.game.world.built[name] - 1
            if global.dyworld.game.world.built[name] <=0 then global.dyworld.game.world.built[name] = 0 end
        end
    end
end