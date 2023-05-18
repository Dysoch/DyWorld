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
        global.dyworld.players[id].stats.xp_to_level = global.dyworld.players[id].stats.xp_to_level * (1 + math.random())
        global.dyworld.players[id].stats.level = global.dyworld.players[id].stats.level + 1
        global.dyworld.players[id].bonus_calc.threshold = 250
        debug("("..id..") XP_Calc: gained a level, level is now "..global.dyworld.players[id].stats.level..", xp needed to next level is now: "..global.dyworld.players[id].stats.xp_to_level..". Threshold for bonuscalc is now "..global.dyworld.players[id].bonus_calc.threshold)
    end
end