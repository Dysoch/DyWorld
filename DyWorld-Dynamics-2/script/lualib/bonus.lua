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
local function LOG(str)
    local Time = "[color=red]["..global.dyworld.time.log.."][/color]"
    if not global.debug then global.debug = {} end
    table.insert(global.debug, (Time.." = "..str))
    debug(str)
end

local function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function Bonus_Threshold(id)
    global.dyworld.players[id].bonus_calc.total = global.dyworld.players[id].bonus_calc.total + 1
    if global.dyworld.players[id].bonus_calc.total >= global.dyworld.players[id].bonus_calc.threshold then
        global.dyworld.players[id].bonus_calc.total = 0
        debug("("..id..") Bonus_Threshold: Bonus threshold reached, started bonus calculation")
        Attribute_Calc(id)
    end
end

function Attribute_Calc(id)
    debug("("..id..") Attribute_Calc: Start Attribute Calculation")
    ----- Local Callbacks -----
    local level = global.dyworld.players[id].stats.level or 1
    local crafted = global.dyworld.players[id].stats.total.crafted or 1
    local mined = global.dyworld.players[id].stats.total.mined or 1
    local build = global.dyworld.players[id].stats.total.build or 1

    ----- Secondary Attributes -----
    debug("("..id..") Attribute_Calc: Start Secondary Attribute Calculation")
    -- strength secondaries --
    local power = (level * 0.05) + (0)
    local might = (level * 0.05) + (0)
    global.dyworld.players[id].attributes.secondary.power.stats = power
    global.dyworld.players[id].attributes.secondary.might.stats = might
    -- constitution secondaries --
    local fortitude = (level * 0.05) + (0)
    local speed = (level * 0.05) + (0)
    global.dyworld.players[id].attributes.secondary.fortitude.stats = fortitude
    global.dyworld.players[id].attributes.secondary.speed.stats = speed
    -- dexterity secondaries --
    local dodge = (level * 0.05) + (0)
    local reflex = (level * 0.05) + (0)
    global.dyworld.players[id].attributes.secondary.dodge.stats = dodge
    global.dyworld.players[id].attributes.secondary.reflex.stats = reflex
    -- intelligence secondaries --
    local iq = (level * 0.05) + (0)
    local will = (level * 0.05) + (0)
    global.dyworld.players[id].attributes.secondary.iq.stats = iq
    global.dyworld.players[id].attributes.secondary.will.stats = will
    -- wisdom secondaries --
    local luck = (level * 0.05) + (0)
    local perception = (level * 0.05) + (0)
    global.dyworld.players[id].attributes.secondary.luck.stats = luck
    global.dyworld.players[id].attributes.secondary.perception.stats = perception
    -- charisma secondaries --
    local leadership = (level * 0.05) + (0)
    local resolve = (level * 0.05) + (0)
    global.dyworld.players[id].attributes.secondary.leadership.stats = leadership
    global.dyworld.players[id].attributes.secondary.resolve.stats = resolve
    for k,v in pairs(global.dyworld.players[id].attributes.secondary) do
        v.total = v.native + v.implant + v.tech + v.stats
        debug("("..id..") Attribute_Calc: Secondary: "..tostring(k).." is now "..v.total)
    end

    ----- Primary Attributes -----
    local power = global.dyworld.players[id].attributes.secondary.power.total or 1
    local might = global.dyworld.players[id].attributes.secondary.might.total or 1
    local fortitude = global.dyworld.players[id].attributes.secondary.fortitude.total or 1
    local speed = global.dyworld.players[id].attributes.secondary.speed.total or 1
    local dodge = global.dyworld.players[id].attributes.secondary.dodge.total or 1
    local reflex = global.dyworld.players[id].attributes.secondary.reflex.total or 1
    local iq = global.dyworld.players[id].attributes.secondary.iq.total or 1
    local will = global.dyworld.players[id].attributes.secondary.will.total or 1
    local luck = global.dyworld.players[id].attributes.secondary.luck.total or 1
    local perception = global.dyworld.players[id].attributes.secondary.perception.total or 1
    local leadership = global.dyworld.players[id].attributes.secondary.leadership.total or 1
    local resolve = global.dyworld.players[id].attributes.secondary.resolve.total or 1
    debug("("..id..") Attribute_Calc: Start Primary Attribute Calculation")
    -- strength --
    local strength_stats = (mined / 10000) + (crafted / 50000) + (build / 2500)
    local strength_bonus = (level * 0.125) + (power / 200) + (might / 200)
    global.dyworld.players[id].attributes.primary.strength.stats = strength_stats
    global.dyworld.players[id].attributes.primary.strength.bonus = strength_bonus
    -- constitution --
    local constitution_stats = (mined / 2500) + (crafted / 10000) + (build / 50000)
    local constitution_bonus = (level * 0.075) + (fortitude / 200) + (speed / 200)
    global.dyworld.players[id].attributes.primary.constitution.stats = constitution_stats
    global.dyworld.players[id].attributes.primary.constitution.bonus = constitution_bonus
    -- dexterity --
    local dexterity_stats = (mined / 5000) + (build / 25000)
    local dexterity_bonus = (level * 0.1) + (dodge / 200) + (reflex / 200)
    global.dyworld.players[id].attributes.primary.dexterity.stats = dexterity_stats
    global.dyworld.players[id].attributes.primary.dexterity.bonus = dexterity_bonus
    -- intelligence --
    local intelligence_stats = (mined / 100000) + (crafted / 150000) + (build / 250000)
    local intelligence_bonus = (level * 0.089) + (iq / 200) + (will / 200)
    global.dyworld.players[id].attributes.primary.intelligence.stats = intelligence_stats
    global.dyworld.players[id].attributes.primary.intelligence.bonus = intelligence_bonus
    -- wisdom --
    local wisdom_stats = 0
    local wisdom_bonus = (level * 0.05) + (perception / 200) + (luck / 200)
    global.dyworld.players[id].attributes.primary.wisdom.stats = wisdom_stats
    global.dyworld.players[id].attributes.primary.wisdom.bonus = wisdom_bonus
    -- charisma --
    local charisma_stats = 0
    local charisma_bonus = (level * 0.01) + (leadership / 200) + (resolve / 200)
    global.dyworld.players[id].attributes.primary.charisma.stats = charisma_stats
    global.dyworld.players[id].attributes.primary.charisma.bonus = charisma_bonus
    -- total calculations --
    for k,v in pairs(global.dyworld.players[id].attributes.primary) do
        v.total = v.native + v.implant + v.bonus + v.tech + v.stats
        debug("("..id..") Attribute_Calc: Primary: "..tostring(k).." is now "..v.total)
    end
    debug("("..id..") Attribute_Calc: Done Attribute Calculation, moving to Bonus_Calc")
    Bonus_Calc(id)
end

function Bonus_Calc(id)
    debug("("..id..") Bonus_Calc: Start bonus calculation")
    -- main callbacks -- 
    local level = global.dyworld.players[id].stats.level or 1
    local deaths = global.dyworld.players[id].stats.deaths or 0
    local player = global.dyworld.players[id].attributes
    -- primary attributes callbacks -- 
    local strength = player.primary.strength.total or 1
    local constitution = player.primary.constitution.total or 1
    local dexterity = player.primary.dexterity.total or 1
    local intelligence = player.primary.intelligence.total or 1
    local wisdom = player.primary.wisdom.total or 1
    local charisma = player.primary.charisma.total or 1
    -- secondary attributes callbacks -- 
    local power = player.secondary.power.total or 1
    local might = player.secondary.might.total or 1
    local fortitude = player.secondary.fortitude.total or 1
    local speed = player.secondary.speed.total or 1
    local dodge = player.secondary.dodge.total or 1
    local reflex = player.secondary.reflex.total or 1
    local iq = player.secondary.iq.total or 1
    local will = player.secondary.will.total or 1
    local luck = player.secondary.luck.total or 1
    local perception = player.secondary.perception.total or 1
    local leadership = player.secondary.leadership.total or 1
    local resolve = player.secondary.resolve.total or 1

    -- main calculations --
    -- mining --
    local formula = ((strength + (constitution / 100) + (intelligence / 50) + (power / 5) + (might / 25) + (speed * 1.2) + luck + (reflex / 5)) / 2)
    global.dyworld.players[id].bonus["mining"].stats = formula
    
    -- crafting --
    local formula = (((wisdom / 2) + (intelligence / 3.5) + (dexterity / 1.5) + ((iq + will + luck) / 15) + fortitude + (speed * 2.5) + (perception / 50)) / 5)
    global.dyworld.players[id].bonus["crafting"].stats = formula
    
    -- health --
    local formula = 0
    global.dyworld.players[id].bonus["health"].stats = formula
    
    -- inventory --
    local formula = 0
    global.dyworld.players[id].bonus["inventory"].stats = formula
    
    -- reach-distance --
    local formula = 0
    global.dyworld.players[id].bonus["reach-distance"].stats = formula
    
    -- build-distance --
    local formula = 0
    global.dyworld.players[id].bonus["build-distance"].stats = formula
    
    -- loot-distance --
    local formula = 0
    global.dyworld.players[id].bonus["loot-distance"].stats = formula
    
    -- run-speed --
    local formula = 0
    global.dyworld.players[id].bonus["run-speed"].stats = formula
    
    -- item-drop-distance --
    local formula = 0
    global.dyworld.players[id].bonus["item-drop-distance"].stats = formula
    
    -- item-pickup-distance --
    local formula = 0
    global.dyworld.players[id].bonus["item-pickup-distance"].stats = formula
    
    -- max-robot-count --
    local formula = 0
    global.dyworld.players[id].bonus["max-robot-count"].stats = formula

    for k,v in pairs(global.dyworld.players[id].bonus) do
        v.deaths = (v.min_max.deaths * deaths)
        v.total = ((v.native + v.stats + v.implants + v.research + v.achievements) - v.death)
        debug("("..id..") Bonus_Calc: "..k.." is now "..v.total)
        if level >= v.min_max.min_level then
            v.enabled = true
            debug("("..id..") Bonus_Calc: enabled "..k)
        else
            v.enabled = false
            debug("("..id..") Bonus_Calc: disabled "..k)
        end
        if v.total >= v.min_max.min then
            if v.enabled and v.toggled then
                game.players[id][v.callback] = math.min(Round(v.total, v.min_max.rounded), v.min_max.max)
                LOG("("..id..") Bonus_Calc: enabled and toggled "..k..", it is now "..math.min(Round(v.total, v.min_max.rounded), v.min_max.max))
            end
        end
    end
    debug("("..id..") Bonus_Calc: Done bonus calculation")
end