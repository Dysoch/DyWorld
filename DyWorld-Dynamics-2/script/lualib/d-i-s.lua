
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

function DIS_Init(id)
    -- Checks if player has an DIS to its name --
    if not global.dyworld.players[id].dis then
        global.dyworld.players[id].dis = {
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
        }
    end

    if not global.dyworld.dis then
        global.dyworld.dis= {
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
                type = "global",
            },
            stats = {
                item = 0,
                total = 0,
                item_used = {},
                item_used_total = 0,
            },
        }
    end

    -- Check what the player has selected as type in settings and runs according function--
    if global.dyworld.players[id].dis.settings.type == "personal" then
        -- Check the max amount of storage --
        global.dyworld.players[id].dis.stats.item.max = Round(global.dyworld.players[id].dis.stats.item.max2,0)
        global.dyworld.players[id].dis.stats.total.max = global.dyworld.players[id].dis.stats.item.max
        global.dyworld.players[id].dis.stats.total.amount = global.dyworld.players[id].dis.stats.item.amount
        -- Found personal setting, run personal function --
        DIS_Personal(id)
    elseif global.dyworld.players[id].dis.settings.type == "global" then
        -- Check the max amount of storage --
        global.dyworld.dis.stats.total = global.dyworld.dis.stats.item
        -- Found global setting, run global function --
        DIS_Global(id)
    end
end

function DIS_Personal(id, override)
    if not global.dyworld.players[id].dis.stats.item_used then global.dyworld.players[id].dis.stats.item_used = {} end
    if not global.dyworld.players[id].dis.stats.item_used_total then global.dyworld.players[id].dis.stats.item_used_total = 0 end
    if not global.dyworld.players[id].stats.codai_level.dis then global.dyworld.players[id].stats.codai_level.dis = 0 end
    -- Checking the Digital inventory for items, and removing them for a bonus --
    if (global.dyworld.players[id].dis.settings.upgrade and global.dyworld.players[id].dis.settings.enabled) or (debugger or local_debug or override) then
        for k,v in pairs(global.dyworld.players[id].dis.items) do
            if k == "basic-circuit" then
                if v >= 1 then
                    global.dyworld.players[id].dis.stats.item.max2 = global.dyworld.players[id].dis.stats.item.max2 + (0.05 * v)
                    global.dyworld.players[id].dis.items[k] = global.dyworld.players[id].dis.items[k] - v
                    global.dyworld.players[id].dis.stats.item.amount = global.dyworld.players[id].dis.stats.item.amount - v
                    if not global.dyworld.players[id].dis.stats.item_used[k] then
                        global.dyworld.players[id].dis.stats.item_used[k] = v
                    else
                        global.dyworld.players[id].dis.stats.item_used[k] = global.dyworld.players[id].dis.stats.item_used[k] + v
                    end
                    global.dyworld.players[id].dis.stats.item_used_total = global.dyworld.players[id].dis.stats.item_used_total + v
                    global.dyworld.players[id].stats.codai_level.dis = global.dyworld.players[id].stats.codai_level.dis + (v * 0.01)
                end
            end
            if k == "electronic-circuit" then
                if v >= 1 then
                    global.dyworld.players[id].dis.stats.item.max2 = global.dyworld.players[id].dis.stats.item.max2 + (0.1 * v)
                    global.dyworld.players[id].dis.items[k] = global.dyworld.players[id].dis.items[k] - v
                    global.dyworld.players[id].dis.stats.item.amount = global.dyworld.players[id].dis.stats.item.amount - v
                    if not global.dyworld.players[id].dis.stats.item_used[k] then
                        global.dyworld.players[id].dis.stats.item_used[k] = v
                    else
                        global.dyworld.players[id].dis.stats.item_used[k] = global.dyworld.players[id].dis.stats.item_used[k] + v
                    end
                    global.dyworld.players[id].dis.stats.item_used_total = global.dyworld.players[id].dis.stats.item_used_total + v
                    global.dyworld.players[id].stats.codai_level.dis = global.dyworld.players[id].stats.codai_level.dis + (v * 0.03)
                end
            end
            if k == "advanced-circuit" then
                if v >= 1 then
                    global.dyworld.players[id].dis.stats.item.max2 = global.dyworld.players[id].dis.stats.item.max2 + (0.2 * v)
                    global.dyworld.players[id].dis.items[k] = global.dyworld.players[id].dis.items[k] - v
                    global.dyworld.players[id].dis.stats.item.amount = global.dyworld.players[id].dis.stats.item.amount - v
                    if not global.dyworld.players[id].dis.stats.item_used[k] then
                        global.dyworld.players[id].dis.stats.item_used[k] = v
                    else
                        global.dyworld.players[id].dis.stats.item_used[k] = global.dyworld.players[id].dis.stats.item_used[k] + v
                    end
                    global.dyworld.players[id].dis.stats.item_used_total = global.dyworld.players[id].dis.stats.item_used_total + v
                    global.dyworld.players[id].stats.codai_level.dis = global.dyworld.players[id].stats.codai_level.dis + (v * 0.05)
                end
            end
            if k == "processing-unit" then
                if v >= 1 then
                    global.dyworld.players[id].dis.stats.item.max2 = global.dyworld.players[id].dis.stats.item.max2 + (0.4 * v)
                    global.dyworld.players[id].dis.items[k] = global.dyworld.players[id].dis.items[k] - v
                    global.dyworld.players[id].dis.stats.item.amount = global.dyworld.players[id].dis.stats.item.amount - v
                    if not global.dyworld.players[id].dis.stats.item_used[k] then
                        global.dyworld.players[id].dis.stats.item_used[k] = v
                    else
                        global.dyworld.players[id].dis.stats.item_used[k] = global.dyworld.players[id].dis.stats.item_used[k] + v
                    end
                    global.dyworld.players[id].dis.stats.item_used_total = global.dyworld.players[id].dis.stats.item_used_total + v
                    global.dyworld.players[id].stats.codai_level.dis = global.dyworld.players[id].stats.codai_level.dis + (v * 0.07)
                end
            end
            if k == "advanced-processing-unit" then
                if v >= 1 then
                    global.dyworld.players[id].dis.stats.item.max2 = global.dyworld.players[id].dis.stats.item.max2 + (0.8 * v)
                    global.dyworld.players[id].dis.items[k] = global.dyworld.players[id].dis.items[k] - v
                    global.dyworld.players[id].dis.stats.item.amount = global.dyworld.players[id].dis.stats.item.amount - v
                    if not global.dyworld.players[id].dis.stats.item_used[k] then
                        global.dyworld.players[id].dis.stats.item_used[k] = v
                    else
                        global.dyworld.players[id].dis.stats.item_used[k] = global.dyworld.players[id].dis.stats.item_used[k] + v
                    end
                    global.dyworld.players[id].dis.stats.item_used_total = global.dyworld.players[id].dis.stats.item_used_total + v
                    global.dyworld.players[id].stats.codai_level.dis = global.dyworld.players[id].stats.codai_level.dis + (v * 0.1)
                end
            end
        end
    end
end

function DIS_Personal_Crafted(id)
    if game.players[id].get_main_inventory() then
        debug("[DIS]: Checking Inventory")
        local Inv = game.players[id].get_main_inventory()
        local Contents = Inv.get_contents()
        for k,v in pairs(Contents) do
            if k == "dynamic-interface-system" then
                Inv.remove({name = k, count = v})
            end
            if global.dyworld.players[id].dis.stats.item.amount < global.dyworld.players[id].dis.stats.item.max then
                if (global.dyworld.players[id].dis.stats.item.max - global.dyworld.players[id].dis.stats.item.amount) > v then
                    if not global.dyworld.players[id].dis.items[k] then
                        global.dyworld.players[id].dis.items[k] = v
                        debug("[DIS]: New table made: "..k.." removed: "..v)
                    else
                        global.dyworld.players[id].dis.items[k] = global.dyworld.players[id].dis.items[k] + v
                        debug("[DIS]: Added to old table: "..k.." removed: "..v)
                    end
                    Inv.remove({name = k, count = v})
                    debug("[DIS]: Removed Item: "..k)
                    global.dyworld.players[id].dis.stats.item.amount = global.dyworld.players[id].dis.stats.item.amount + v
                    debug("[DIS]: Changed used amount")
                else
                    debug("[DIS]: Not enough storage")
                end
            end
        end
    end
    DIS_Personal(id, true)
end

function DIS_Personal_Trash(id)
    if game.players[id].get_inventory(defines.inventory.character_trash) then
        debug("[DIS]: Checking Inventory")
        local Inv = game.players[id].get_inventory(defines.inventory.character_trash)
        local Contents = Inv.get_contents()
        for k,v in pairs(Contents) do
            if k == "dynamic-interface-system" then
                Inv.remove({name = k, count = v})
            end
            for i = 1, v do
                if global.dyworld.players[id].dis.stats.item.amount < global.dyworld.players[id].dis.stats.item.max then
                    if (global.dyworld.players[id].dis.stats.item.max - global.dyworld.players[id].dis.stats.item.amount) > 1 then
                        if not global.dyworld.players[id].dis.items[k] then
                            global.dyworld.players[id].dis.items[k] = 1
                            debug("[DIS]: New table made: "..k.." removed: "..1)
                        else
                            global.dyworld.players[id].dis.items[k] = global.dyworld.players[id].dis.items[k] + 1
                            debug("[DIS]: Added to old table: "..k.." removed: "..1)
                        end
                        Inv.remove({name = k, count = 1})
                        debug("[DIS]: Removed Item: "..k)
                        global.dyworld.players[id].dis.stats.item.amount = global.dyworld.players[id].dis.stats.item.amount + 1
                        debug("[DIS]: Changed used amount")
                    else
                        debug("[DIS]: Not enough storage")
                    end
                end
            end
        end
    end
    DIS_Personal(id, true)
end

function DIS_Chest_Check(id)
    if game.players[id].get_main_inventory() then
        debug("[DIS]: Checking Inventory")
        local Inv = game.players[id].get_main_inventory()
        local Contents = Inv.get_contents()
        for k,v in pairs(Contents) do
            if k == "dynamic-interface-system" then
                Inv.remove({name = k, count = v})
            end
            if global.dyworld.players[id].dis.stats.item.amount < global.dyworld.players[id].dis.stats.item.max then
                if (global.dyworld.players[id].dis.stats.item.max - global.dyworld.players[id].dis.stats.item.amount) > v then
                    if not global.dyworld.players[id].dis.items[k] then
                        global.dyworld.players[id].dis.items[k] = v
                        debug("[DIS]: New table made: "..k.." removed: "..v)
                    else
                        global.dyworld.players[id].dis.items[k] = global.dyworld.players[id].dis.items[k] + v
                        debug("[DIS]: Added to old table: "..k.." removed: "..v)
                    end
                    Inv.remove({name = k, count = v})
                    debug("[DIS]: Removed Item: "..k)
                    global.dyworld.players[id].dis.stats.item.amount = global.dyworld.players[id].dis.stats.item.amount + v
                    debug("[DIS]: Changed used amount")
                else
                    debug("[DIS]: Not enough storage")
                end
            end
        end
    end
    DIS_Personal(id, true)
end

function DIS_Global(id)

end