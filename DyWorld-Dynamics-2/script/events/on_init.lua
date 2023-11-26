local created_items = function()
    if debugger then
        return
        {
            ["iron-plate"] = 80,
            ["copper-plate"] = 80,
            ["log"] = 10,
            ["pistol"] = 1,
            ["firearm-magazine"] = 100,
            ["burner-mining-drill"] = 10,
            ["stone-furnace"] = 10,
            ["solar-panel-3"] = 10,
        }
    else
        return
        {
            ["iron-plate"] = 8,
            ["copper-plate"] = 8,
            ["log"] = 2,
            ["pistol"] = 1,
            ["firearm-magazine"] = 10,
            ["burner-mining-drill"] = 1,
            ["stone-furnace"] = 1,
        }
    end
end
  
  local respawn_items = function()
    if debugger then
        return
        {
            ["pistol"] = 1,
            ["firearm-magazine"] = 100,
        }
    else
        return
        {
            ["pistol"] = 1,
            ["firearm-magazine"] = 10,
        }
    end
end
  
  local ship_items = function()
    if debugger then
        return
        {
            ["pistol"] = 1,
            ["firearm-magazine"] = 100,
        }
    else
        return
        {
            ["pistol"] = 1,
            ["firearm-magazine"] = 10,
        }
    end
end
  
  local debris_items = function()
    if debugger then
        return
        {
            ["iron-plate"] = 80,
            ["copper-plate"] = 80,
        }
    else
        return
        {
            ["iron-plate"] = 8,
            ["copper-plate"] = 8,
        }
    end
end



function Event_on_init()
    if not global.dyworld then
        global.dyworld = {
            version = {
                major = Version_Build_Major,
                minor = Version_Build_Minor,
                hotfix = Version_Build_Hotfix,
                version = Version_Build,
            },
            players = {},
            game = {},
            surfaces = {},
            time = {
                actual = {
                    tick = 0,
                    second = 0,
                    minute = 0,
                    hour = 0,
                    day = 0,
                    year = 0,
                },
                log = "0:0:0:0:0",
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
                    type = "global",
                },
                stats = {
                    item = 0,
                    total = 0,
                    item_used = {},
                    item_used_total = 0,
                },
            },
            story = settings.startup["DyWorld_Story"].value,
        }
    end
    if settings.startup["DyWorld_Debug"].value then
        if not remote.call("freeplay", "get_skip_intro") then
            remote.call("freeplay", "set_skip_intro", true)
            --remote.call("freeplay", "set_disable_crashsite", true)
        end
    end
    if settings.startup["DyWorld_Story"].value then
        remote.call("freeplay", "set_custom_intro_message", "Welcome to DyWorld-Dynamics 2\n\nStory is enabled. Owh glorious times!")
    else
        remote.call("freeplay", "set_custom_intro_message", "Welcome to DyWorld-Dynamics 2\n\nStory is disabled. I am sad!")
    end
    remote.call("freeplay", "set_created_items", created_items())
    remote.call("freeplay", "set_respawn_items", respawn_items())
    remote.call("freeplay", "set_ship_items", ship_items())
    remote.call("freeplay", "set_debris_items", debris_items())
end

