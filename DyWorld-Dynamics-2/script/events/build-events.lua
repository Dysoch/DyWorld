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

function Event_on_player_used_capsule(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.item.name

end

function Event_on_built_entity(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.created_entity.name
	local position = event.created_entity.position
	local type = event.created_entity.type
    
    if not global.dyworld.game.stats then global.dyworld.game.stats = {} end
    if not global.dyworld.game.counters then global.dyworld.game.counters = {} end
    if not global.dyworld.game.world then global.dyworld.game.world = {} end
    if not global.dyworld.game.world.built then global.dyworld.game.world.built = {} end

    -- global --
    if not global.dyworld.game.counters.build then
        global.dyworld.game.counters.build = 1
    else
        global.dyworld.game.counters.build = global.dyworld.game.counters.build + 1
    end
    if name ~= "entity-ghost" then
        if not global.dyworld.game.world.built[name] then
            global.dyworld.game.world.built[name] = 1
        else
            global.dyworld.game.world.built[name] = global.dyworld.game.world.built[name] + 1
        end
    end

    -- personal --
    if global.dyworld.players[id] then
        global.dyworld.players[id].stats.total.build = global.dyworld.players[id].stats.total.build + 1

        -- xp --
        XP_Calc(id, (1 * 0.25))
        Bonus_Threshold(id)
        
        if not global.dyworld.players[id].stats.specific.build[name] then
            global.dyworld.players[id].stats.specific.build[name] = 1
            debug("("..id..") Event_on_built_entity: Created specific mining table for "..name.." with 1")
        else
            global.dyworld.players[id].stats.specific.build[name] = global.dyworld.players[id].stats.specific.build[name] + 1
            debug("("..id..") Event_on_built_entity: increased specific mining table for "..name.." with 1 to "..global.dyworld.players[id].stats.specific.build[name])
        end
    end

end

function Event_on_player_built_tile(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.tile.name

end

function Event_on_robot_built_entity(event)
	--local player = game.players[event.player_index]
	--local force = player.force
	--local id = event.player_index
	local name = event.created_entity.name
	local position = event.created_entity.position
	local surface = event.created_entity.surface.name
	local type = event.created_entity.type

    -- global --
    if not global.dyworld.game.counters.build then
        global.dyworld.game.counters.build = 1
    else
        global.dyworld.game.counters.build = global.dyworld.game.counters.build + 1
    end
    if name ~= "entity-ghost" then
        if not global.dyworld.game.world.built[name] then
            global.dyworld.game.world.built[name] = 1
        else
            global.dyworld.game.world.built[name] = global.dyworld.game.world.built[name] + 1
        end
    end
end

function Event_on_robot_built_tile(event)
	local name = event.tile.name

end

function Event_script_raised_built(event)
	local name = event.entity.name
	local position = event.entity.position
	local type = event.entity.type
    
    -- global --
    if not global.dyworld.game.counters.build then
        global.dyworld.game.counters.build = 1
    else
        global.dyworld.game.counters.build = global.dyworld.game.counters.build + 1
    end
    if name ~= "entity-ghost" then
        if not global.dyworld.game.world.built[name] then
            global.dyworld.game.world.built[name] = 1
        else
            global.dyworld.game.world.built[name] = global.dyworld.game.world.built[name] + 1
        end
    end
end

function Event_built_test(event)

end

function Event_script_raised_revive(event)
	local name = event.entity.name
	local position = event.entity.position
	local type = event.entity.type
    
    -- global --
    if not global.dyworld.game.counters.build then
        global.dyworld.game.counters.build = 1
    else
        global.dyworld.game.counters.build = global.dyworld.game.counters.build + 1
    end
    if name ~= "entity-ghost" then
        if not global.dyworld.game.world.built[name] then
            global.dyworld.game.world.built[name] = 1
        else
            global.dyworld.game.world.built[name] = global.dyworld.game.world.built[name] + 1
        end
    end

end

function Event_on_pre_ghost_upgraded(event)
	local name = event.target.name
	local position = event.target.position
	local type = event.target.type

    -- global --
    if not global.dyworld.game.counters.build then
        global.dyworld.game.counters.build = 1
    else
        global.dyworld.game.counters.build = global.dyworld.game.counters.build + 1
    end
    if name ~= "entity-ghost" then
        if not global.dyworld.game.world.built[name] then
            global.dyworld.game.world.built[name] = 1
        else
            global.dyworld.game.world.built[name] = global.dyworld.game.world.built[name] + 1
        end
    end

end