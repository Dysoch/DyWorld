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
	global.dyworld.players[id].alive = false
	global.dyworld.players[id].stats.deaths = global.dyworld.players[id].stats.deaths + 1
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
	global.dyworld.players[id].alive = true
	global.dyworld.players[id].survival.food.storage = global.dyworld.players[id].survival.food.storage_max
	global.dyworld.players[id].survival.water.storage = global.dyworld.players[id].survival.water.storage_max
	global.dyworld.players[id].survival.pollution.stored = 0
	global.dyworld.players[id].survival.radiation.stored = 0
    Codia_Calc(id, true, 0)
    
end

function Event_on_player_joined_game(event)
	local id = event.player_index
	local player = game.players[id]
	local force = player.force

    Dy_Player_init(event)
	global.dyworld.players[id].joined = true
    
end

function Event_on_player_left_game(event)
	local id = event.player_index
	local player = game.players[id]
	local force = player.force

    Dy_Player_init(event)
	global.dyworld.players[id].joined = false
    
end

function Event_on_player_changed_force(event)
	local id = event.player_index
	local player = game.players[id]
	local force = player.force

    Dy_Player_init(event)
	global.dyworld.players[id].force = force.name
end

function Event_on_player_respawned_script(event)
	local id = event.player_index
	local player = game.players[id]
	local force = player.force

    Dy_Player_init(event)
	global.dyworld.players[id].alive = true
	global.dyworld.players[id].survival.food.storage = global.dyworld.players[id].survival.food.storage_max
	global.dyworld.players[id].survival.water.storage = global.dyworld.players[id].survival.water.storage_max
	global.dyworld.players[id].survival.pollution.stored = 0
	global.dyworld.players[id].survival.radiation.stored = 0
    Codia_Calc(id, true, 0)
end

function Event_on_player_toggled_map_editor(event)
	local id = event.player_index
	local player = game.players[id]
	local force = player.force

    if not global.dyworld.players[id].editor then
        global.dyworld.players[id].editor = true
    else
        global.dyworld.players[id].editor = false
    end
end

function Dy_Player_init(event)
	local id = event.player_index
	local player = game.players[id]
	local force = player.force
    local name = player.name

    if not global.dyworld.players then global.dyworld.players = {} end
    if not global.dyworld.game.stats then global.dyworld.game.stats = {} end
    if not global.dyworld.game.counters then global.dyworld.game.counters = {} end

    debug("("..id..") Dy_Player_init: created player "..id.." with the name: "..name.." for force: "..force.name)
    
    if not global.dyworld.players[id] then
        global.dyworld.players[id] = {
            name = name,
            alive = true,
            joined = true,
            editor = false,
            sandbox = false,
            banned = false,
            force = force.name,
            coords = {x = 0, y = 0, surface = "nauvis", x2 = 0, y2 = 0, Cx = 0, Cy = 0},
            messages = {},
            toggles = {
                objectives_gui = false,
            },
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
                    rate = 0,
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
                    native_gain = 0.1,
                    artifical_gain = 0,
                    rate = 0,
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
                primary = {
                    strength = {
                        native = 1,
                        implant = 0,
                        bonus = 0,
                        tech = 0,
                        stats = 0,
                        total = 1,
                    },
                    constitution = {
                        native = 1,
                        implant = 0,
                        bonus = 0,
                        tech = 0,
                        stats = 0,
                        total = 1,
                    },
                    dexterity = {
                        native = 1,
                        implant = 0,
                        bonus = 0,
                        tech = 0,
                        stats = 0,
                        total = 1,
                    },
                    intelligence = {
                        native = 1,
                        implant = 0,
                        bonus = 0,
                        tech = 0,
                        stats = 0,
                        total = 1,
                    },
                    wisdom = {
                        native = 1,
                        implant = 0,
                        bonus = 0,
                        tech = 0,
                        stats = 0,
                        total = 1,
                    },
                    charisma = {
                        native = 1,
                        implant = 0,
                        bonus = 0,
                        tech = 0,
                        stats = 0,
                        total = 1,
                    },
                },
                secondary = {
                    dodge = {
                        native = 1,
                        implant = 0,
                        tech = 0,
                        stats = 0,
                        total = 1,
                        main = "dexterity",
                    },
                    speed = {
                        native = 1,
                        implant = 0,
                        tech = 0,
                        stats = 0,
                        total = 1,
                        main = "constitution",
                    },
                    luck = {
                        native = 1,
                        implant = 0,
                        tech = 0,
                        stats = 0,
                        total = 1,
                        main = "wisdom",
                    },
                    leadership = {
                        native = 1,
                        implant = 0,
                        tech = 0,
                        stats = 0,
                        total = 1,
                        main = "charisma",
                    },
                    iq = {
                        native = 1,
                        implant = 0,
                        tech = 0,
                        stats = 0,
                        total = 1,
                        main = "intelligence",
                    },
                    will = {
                        native = 1,
                        implant = 0,
                        tech = 0,
                        stats = 0,
                        total = 1,
                        main = "intelligence",
                    },
                    power = {
                        native = 1,
                        implant = 0,
                        tech = 0,
                        stats = 0,
                        total = 1,
                        main = "strength",
                    },
                    fortitude = {
                        native = 1,
                        implant = 0,
                        tech = 0,
                        stats = 0,
                        total = 1,
                        main = "constitution",
                    },
                    reflex = {
                        native = 1,
                        implant = 0,
                        tech = 0,
                        stats = 0,
                        total = 1,
                        main = "dexterity",
                    },
                    might = {
                        native = 1,
                        implant = 0,
                        tech = 0,
                        stats = 0,
                        total = 1,
                        main = "strength",
                    },
                    perception = {
                        native = 1,
                        implant = 0,
                        tech = 0,
                        stats = 0,
                        total = 1,
                        main = "wisdom",
                    },
                    resolve = {
                        native = 1,
                        implant = 0,
                        tech = 0,
                        stats = 0,
                        total = 1,
                        main = "charisma",
                    },
                },
            },
            stats = {
                total = {
                    crafted = 0,
                    mined = 0,
                    build = 0,
                    killed = 0,
                    picked = 0,
                    capsules = 0,
                    food_used= 0,
                    water_used = 0,
                    odometer_walk = 0,
                    odometer_car = 0,
                    odometer_train = 0,
                },
                specific = {
                    crafted = {},
                    mined= {},
                    build = {},
                    killed = {},
                    picked = {},
                    capsules = {},
                },
                deaths = 0,
                xp = 0,
                xp_to_level = 50,
                level = 1,
                codai_level = {
                    armor = 0,
                    dis = 0,
                    total = 0,
                },
                changes = {},
            },
            bonus_calc = {
                total = 0,
                threshold = 5,
            },
            achievements = DyWorld_2_Achievements_Bonuses,
            bonus = {
                ["mining"] = {
                    native = -0.5,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 1,
                    death = 0,
                    enabled = false,
                    toggled = true,
                    total = 0,
                    callback = "character_mining_speed_modifier",
                    min_max = {min_level = -25, max = 999999, rounded = 2, deaths = -0.1, min = -0.99},
                },
                ["crafting"] = {
                    native = -0.25,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 1,
                    death = 0,
                    enabled = false,
                    toggled = true,
                    total = 0,
                    callback = "character_crafting_speed_modifier",
                    min_max = {min_level = -25, max = 999999, rounded = 2, deaths = -0.1, min = -0.99},
                },
                ["health"] = {
                    native = 0,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 1,
                    death = 0,
                    enabled = false,
                    toggled = true,
                    total = 0,
                    callback = "character_health_bonus",
                    min_max = {min_level = 3, max = 999999999, rounded = 0, deaths = -25, min = 0},
                },
                ["inventory"] = {
                    native = 0,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 1,
                    death = 0,
                    enabled = false,
                    toggled = true,
                    total = 0,
                    callback = "character_inventory_slots_bonus",
                    min_max = {min_level = 5, max = 980, rounded = 0, deaths = -1, min = 0},
                },
                ["reach-distance"] = {
                    native = 0,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 1,
                    death = 0,
                    enabled = false,
                    toggled = true,
                    total = 0,
                    callback = "character_reach_distance_bonus",
                    min_max = {min_level = 7, max = (100 - game.entity_prototypes["character"].reach_distance), rounded = 2, deaths = -0.25, min = 0},
                },
                ["build-distance"] = {
                    native = 0,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 1,
                    death = 0,
                    enabled = false,
                    toggled = true,
                    total = 0,
                    callback = "character_build_distance_bonus",
                    min_max = {min_level = 7, max = (100 - game.entity_prototypes["character"].build_distance), rounded = 2, deaths = -0.1, min = 0},
                },
                ["loot-distance"] = {
                    native = 0,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 1,
                    death = 0,
                    enabled = false,
                    toggled = true,
                    total = 0,
                    callback = "character_loot_pickup_distance_bonus",
                    min_max = {min_level = 10, max = (100 - game.entity_prototypes["character"].loot_pickup_distance), rounded = 2, deaths = -0.1, min = 0},
                },
                ["run-speed"] = {
                    native = 0,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 1,
                    death = 0,
                    enabled = false,
                    toggled = false,
                    total = 0,
                    callback = "character_running_speed_modifier",
                    min_max = {min_level = 50, max = 0, rounded = 2, deaths = -0.1, min = 0},
                },
                ["item-drop-distance"] = {
                    native = 0,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 1,
                    death = 0,
                    enabled = false,
                    toggled = true,
                    total = 0,
                    callback = "character_item_drop_distance_bonus",
                    min_max = {min_level = 20, max = 0, rounded = 2, deaths = -0.1, min = 0},
                },
                ["item-pickup-distance"] = {
                    native = 0,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 1,
                    death = 0,
                    enabled = false,
                    toggled = true,
                    total = 0,
                    callback = "character_item_pickup_distance_bonus",
                    min_max = {min_level = 25, max = 0, rounded = 2, deaths = -0.1, min = 0},
                },
                ["max-robot-count"] = {
                    native = 0,
                    stats = 0,
                    implants = 0,
                    research = 0,
                    achievements = 1,
                    death = 0,
                    enabled = false,
                    toggled = true,
                    total = 0,
                    callback = "character_maximum_following_robot_count_bonus",
                    min_max = {min_level = 30, max = 0, rounded = 2, deaths = -0.1, min = 0},
                },
            },
            dis = {
                items = {},
                settings = {
                    enabled = false,
                    auto_refill = false,
                    settings_refill = {},
                    auto_trash = false,
                    settings_trash = {},
                    auto_survival = false,
                    upgrade = true,
                    settings_survival = {heal_threshold = 50, food_threshold = 50, water_threshold = 50,},
                    type = "personal",
                },
                stats = {
                    item = {max = 500, amount = 0, max2 = 500},
                    total = {max = 500, amount = 0},
                    item_used = {},
                    item_used_total = 0,
                },
            },
        }
    end
end