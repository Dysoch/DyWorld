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

function Vitals_Change(ID, Player)

    -- Coordinates --
    global.dyworld.players[ID].coords.x2 = global.dyworld.players[ID].coords.x
    global.dyworld.players[ID].coords.y2 = global.dyworld.players[ID].coords.y
    global.dyworld.players[ID].coords.x = Player.position.x
    global.dyworld.players[ID].coords.y = Player.position.y
    global.dyworld.players[ID].coords.surface = Player.surface.name
    global.dyworld.players[ID].coords.Cx = math.floor(global.dyworld.players[ID].coords.x / 32)
    global.dyworld.players[ID].coords.Cy = math.floor(global.dyworld.players[ID].coords.y / 32)

    -- Food --
    local Food = global.dyworld.players[ID].survival.food
    global.dyworld.players[ID].survival.food.storage = global.dyworld.players[ID].survival.food.storage - (1 * global.dyworld.players[ID].survival.food.rate)
    if global.dyworld.players[ID].survival.food.storage <= 0 then global.dyworld.players[ID].survival.food.storage = 0 end

    -- Water --
    local Water = global.dyworld.players[ID].survival.water
    global.dyworld.players[ID].survival.water.storage = global.dyworld.players[ID].survival.water.storage - (1 * global.dyworld.players[ID].survival.water.rate)
    if global.dyworld.players[ID].survival.water.storage <= 0 then global.dyworld.players[ID].survival.water.storage = 0 end

    -- Pollution --
    local Pol = global.dyworld.players[ID].survival.pollution
    global.dyworld.players[ID].survival.pollution.native_gain = (Round(game.surfaces[global.dyworld.players[ID].coords.surface].get_pollution({global.dyworld.players[ID].coords.x, global.dyworld.players[ID].coords.y}), 0) * 0.001)
    global.dyworld.players[ID].survival.pollution.rate = ((Pol.native_gain + Pol.artifical_gain) + (Pol.native_loss + Pol.artifical_loss))
    global.dyworld.players[ID].survival.pollution.stored = global.dyworld.players[ID].survival.pollution.stored + (global.dyworld.players[ID].survival.pollution.rate)
    --- Threshold ---
    global.dyworld.players[ID].survival.pollution.threshold.total = (Pol.threshold.native + Pol.threshold.implant + Pol.threshold.bonus + Pol.threshold.tech)
    --- Check stored ---
    if Pol.stored <= 0 then global.dyworld.players[ID].survival.pollution.stored = 0 end

    -- Radiation --
    local Rad = global.dyworld.players[ID].survival.radiation
    global.dyworld.players[ID].survival.radiation.rate = ((Rad.native_gain + Rad.artifical_gain) + (Rad.native_loss + Rad.artifical_loss))
    global.dyworld.players[ID].survival.radiation.stored = global.dyworld.players[ID].survival.radiation.stored + (global.dyworld.players[ID].survival.radiation.rate)
    --- Threshold ---
    global.dyworld.players[ID].survival.radiation.threshold.total = (Rad.threshold.native + Rad.threshold.implant + Rad.threshold.bonus + Rad.threshold.tech)
    --- Check stored ---
    if Rad.stored <= 0 then global.dyworld.players[ID].survival.radiation.stored = 0 end

    -- Weight -- (todo for DLC)

    -- Damage parts --
end