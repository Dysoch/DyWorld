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
