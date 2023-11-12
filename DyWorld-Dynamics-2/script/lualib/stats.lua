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

function XP_Calc(id, amount)
    global.dyworld.players[id].stats.xp = global.dyworld.players[id].stats.xp + (amount)
    debug("("..id..") XP_Calc: added "..(amount).." xp, xp now: "..global.dyworld.players[id].stats.xp)
    if global.dyworld.players[id].stats.xp >= global.dyworld.players[id].stats.xp_to_level then
        global.dyworld.players[id].stats.xp = 0
        local increase = (0.95 + math.random())
        if increase >= 1.5 then increase = 1.5 end
        global.dyworld.players[id].stats.xp_to_level = global.dyworld.players[id].stats.xp_to_level * increase
        global.dyworld.players[id].stats.level = global.dyworld.players[id].stats.level + 1
        global.dyworld.players[id].bonus_calc.threshold = (global.dyworld.players[id].stats.level * 5)
        Codia_Calc(id)
        debug("("..id..") XP_Calc: gained a level, level is now "..global.dyworld.players[id].stats.level..", xp needed to next level is now: "..global.dyworld.players[id].stats.xp_to_level..". Threshold for bonuscalc is now "..global.dyworld.players[id].bonus_calc.threshold)
    end
end

function Codia_Calc(id, armor, lvl)
    if armor then
        global.dyworld.players[id].stats.codai_level.armor = lvl
    end
    if global.dyworld.players[id].dis.stats.codai.xp >= global.dyworld.players[id].dis.stats.codai.xp_to_level then
        global.dyworld.players[id].dis.stats.codai.level = global.dyworld.players[id].dis.stats.codai.level + 1
        global.dyworld.players[id].dis.stats.codai.xp_to_level = Round((global.dyworld.players[id].dis.stats.codai.xp_to_level * 1.6), 0)
    end
    global.dyworld.players[id].stats.codai_level.dis = global.dyworld.players[id].dis.stats.codai.level
    global.dyworld.players[id].stats.codai_level.xp = (global.dyworld.players[id].stats.level / 2)
    global.dyworld.players[id].stats.codai_level.total = math.floor(global.dyworld.players[id].stats.codai_level.armor + global.dyworld.players[id].stats.codai_level.xp + global.dyworld.players[id].stats.codai_level.dis)
    game.players[id].print("[color=blue]C.O.D.A.I.[/color] has been upgraded to firmware version: [color=red]"..global.dyworld.players[id].stats.codai_level.total.."[/color]")
end

function Distance_Calc(id)
    local objA_X = global.dyworld.players[id].coords.x
    local objA_Y = global.dyworld.players[id].coords.y
    local objB_X = global.dyworld.players[id].coords.x2
    local objB_Y = global.dyworld.players[id].coords.y2
    -- Get the length for each of the components x and y
    local xDist = objB_X - objA_X
    local yDist = objB_Y - objA_Y
	local distance = math.sqrt((xDist^2)+(yDist^2))

    -- global --
    if not global.dyworld.game.counters then global.dyworld.game.counters = {} end
    if not global.dyworld.game.counters.odometer_walk then global.dyworld.game.counters.odometer_walk = 0 end
    if not global.dyworld.game.counters.odometer_car then global.dyworld.game.counters.odometer_car = 0 end
    if not global.dyworld.game.counters.odometer_train then global.dyworld.game.counters.odometer_train = 0 end

    if game.players[id].vehicle then
        local name = game.players[id].vehicle.name
        if name == "car-1" then
            global.dyworld.players[id].stats.total.odometer_car = global.dyworld.players[id].stats.total.odometer_car + distance
            global.dyworld.game.counters.odometer_car = global.dyworld.game.counters.odometer_car + distance
        elseif name == "boat-1" then
            global.dyworld.players[id].stats.total.odometer_car = global.dyworld.players[id].stats.total.odometer_car + distance
            global.dyworld.game.counters.odometer_car = global.dyworld.game.counters.odometer_car + distance
        elseif name == "car" then
            global.dyworld.players[id].stats.total.odometer_car = global.dyworld.players[id].stats.total.odometer_car + distance
            global.dyworld.game.counters.odometer_car = global.dyworld.game.counters.odometer_car + distance
        elseif name == "spidertron" then
            global.dyworld.players[id].stats.total.odometer_car = global.dyworld.players[id].stats.total.odometer_car + distance
            global.dyworld.game.counters.odometer_car = global.dyworld.game.counters.odometer_car + distance
        elseif name == "locomotive" then
            global.dyworld.players[id].stats.total.odometer_train = global.dyworld.players[id].stats.total.odometer_train + distance
            global.dyworld.game.counters.odometer_train = global.dyworld.game.counters.odometer_train + distance
        elseif name == "cargo-wagon-1" then
            global.dyworld.players[id].stats.total.odometer_train = global.dyworld.players[id].stats.total.odometer_train + distance
            global.dyworld.game.counters.odometer_train = global.dyworld.game.counters.odometer_train + distance
        elseif name == "locomotive-1" then
            global.dyworld.players[id].stats.total.odometer_train = global.dyworld.players[id].stats.total.odometer_train + distance
            global.dyworld.game.counters.odometer_train = global.dyworld.game.counters.odometer_train + distance
        end
    else
        global.dyworld.players[id].stats.total.odometer_walk = global.dyworld.players[id].stats.total.odometer_walk + distance
        global.dyworld.game.counters.odometer_walk = global.dyworld.game.counters.odometer_walk + distance
    end
end