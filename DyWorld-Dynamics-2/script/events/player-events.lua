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

function Event_on_raised_revive(event)
	--local id = event.player_index
	--local entity = event.entity
	
end

function Event_script_raised_destroy(event)
	--local id = event.player_index
	--local entity = event.entity
	
end

function Event_on_player_created(event)
	local id = event.player_index
	local player = game.players[id]
	local force = player.force.name
	local name = player.name

    Dy_Player_init(event)
end

function Event_on_player_died(event)
	local id = event.player_index
	local player = game.players[id]
	local force = player.force

    Dy_Player_init(event)
	
end

function Event_on_pre_player_died(event)
	local id = event.player_index
	local player = game.players[id]
	local force = player.force

    Dy_Player_init(event)
    
end

function Event_on_player_respawned(event)
	local id = event.player_index
	local player = game.players[id]
	local force = player.force

    Dy_Player_init(event)
    
end

function Event_on_player_joined_game(event)
	local id = event.player_index
	local player = game.players[id]
	local force = player.force

    Dy_Player_init(event)
    
end

function Event_on_player_left_game(event)
	local id = event.player_index
	local player = game.players[id]
	local force = player.force

    Dy_Player_init(event)
    
end

function Event_on_player_changed_force(event)
	local id = event.player_index
	local player = game.players[id]
	local force = player.force

    Dy_Player_init(event)
	
end

function Event_on_player_respawned_script(event)
	local id = event.player_index
	local player = game.players[id]
	local force = player.force

    Dy_Player_init(event)
    
end

function Dy_Player_init(event)
	local id = event.player_index
	local player = game.players[id]
	local force = player.force
    local name = player.name

    if not global.dyworld.players then global.dyworld.players = {} end
    if not global.dyworld.game.stats then global.dyworld.game.stats = {} end
    if not global.dyworld.game.counters then global.dyworld.game.counters = {} end

    debug("("..id..") player_event: created player "..id.." with the name: "..name.." for force: "..force.name)
    
    if not global.dyworld.players[id] then
        global.dyworld.players[id] = {
            name = name,
            alive = true,
            joined = true,
            banned = false,
            force = force.name,
            coords = {x = 0, y = 0, surface = "nauvis"},
            survival = {
                food = {
                    storage = 1000,
                    storage_max = 1000,
                    rate = 0.33,
                },
                water = {
                    storage = 1000,
                    storage_max = 1000,
                    rate = 1.25,
                },
                pollution = {
                    native_loss = -0.1,
                    artifical_loss = 0,
                    native_gain = 0,
                    artifical_gain = 0,
                    stored = 0,
                    threshold = {
                        native = 15000,
                        implant = 0,
                        bonus = 0,
                        tech = 0,
                        total = 15000,
                    },
                },
                radiation = {
                    native_loss = -0.1,
                    artifical_loss = 0,
                    native_gain = 0,
                    artifical_gain = 0,
                    stored = 0,
                    threshold = {
                        native = 5000,
                        implant = 0,
                        bonus = 0,
                        tech = 0,
                        total = 5000,
                    },
                },
                oxygen = {

                },
            },
            attributes = {
                strength = {
                    native = 1,
                    implant = 0,
                    bonus = 0,
                    tech = 0,
                    total = 1,
                },
                constitution = {
                    native = 1,
                    implant = 0,
                    bonus = 0,
                    tech = 0,
                    total = 1,
                },
                dexterity = {
                    native = 1,
                    implant = 0,
                    bonus = 0,
                    tech = 0,
                    total = 1,
                },
                intelligence = {
                    native = 1,
                    implant = 0,
                    bonus = 0,
                    tech = 0,
                    total = 1,
                },
                wisdom = {
                    native = 1,
                    implant = 0,
                    bonus = 0,
                    tech = 0,
                    total = 1,
                },
                charisma = {
                    native = 1,
                    implant = 0,
                    bonus = 0,
                    tech = 0,
                    total = 1,
                },
            },
            stats = {
                total = {
                    crafted = 0,
                    mined= 0,
                    build = 0,
                    killed = 0,
                    picked = 0,
                    capsules = 0,
                },
                specific = {
                    crafted = {},
                    mined= {},
                    build = {},
                    killed = {},
                    picked = {},
                    capsules = {},
                },
                distance = {
                    personal = 0,
                    vehicle = 0,
                    train = 0,
                },
                deaths = 0,
                xp = 0,
                xp_to_level = 100,
                level = 1,
            },
            bonus_calc = {
                total = 0,
                threshold = 250,
            },
            bonus = {
                ["mining"] = {
                    native = -0.5,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 0,
                    death = 0,
                    enabled = false,
                    toggled = false,
                    total = 0,
                },
                ["crafting"] = {
                    native = -0.25,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 0,
                    death = 0,
                    enabled = false,
                    toggled = false,
                    total = 0,
                },
                ["health"] = {
                    native = 0,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 0,
                    death = 0,
                    enabled = false,
                    toggled = false,
                    total = 0,
                },
                ["inventory"] = {
                    native = 0,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 0,
                    death = 0,
                    enabled = false,
                    toggled = false,
                    total = 0,
                },
                ["reach-distance"] = {
                    native = 0,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 0,
                    death = 0,
                    enabled = false,
                    toggled = false,
                    total = 0,
                },
                ["build-distance"] = {
                    native = 0,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 0,
                    death = 0,
                    enabled = false,
                    toggled = false,
                    total = 0,
                },
                ["loot-distance"] = {
                    native = 0,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 0,
                    death = 0,
                    enabled = false,
                    toggled = false,
                    total = 0,
                },
                ["run-speed"] = {
                    native = 0,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 0,
                    death = 0,
                    enabled = false,
                    toggled = false,
                    total = 0,
                },
                ["item-drop-distance"] = {
                    native = 0,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 0,
                    death = 0,
                    enabled = false,
                    toggled = false,
                    total = 0,
                },
                ["item-pickup-distance"] = {
                    native = 0,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 0,
                    death = 0,
                    enabled = false,
                    toggled = false,
                    total = 0,
                },
                ["max-robot-count"] = {
                    native = 0,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 0,
                    death = 0,
                    enabled = false,
                    toggled = false,
                    total = 0,
                },
            },
        }
    end
end