



function Event_on_tick(event)
    if event.tick%(60*1)==1 then
        global.dyworld.time.actual.second = global.dyworld.time.actual.second + 1
        if global.dyworld.time.actual.second >= 59 then
            global.dyworld.time.actual.second = 0
            global.dyworld.time.actual.minute = global.dyworld.time.actual.minute + 1
        end
        if global.dyworld.time.actual.minute >= 59 then
            global.dyworld.time.actual.minute = 0
            global.dyworld.time.actual.hour = global.dyworld.time.actual.hour + 1
        end
        if global.dyworld.time.actual.hour >= 23 then
            global.dyworld.time.actual.hour = 0
            global.dyworld.time.actual.day = global.dyworld.time.actual.day + 1
        end
        if global.dyworld.time.actual.day >= 364 then
            global.dyworld.time.actual.day = 0
            global.dyworld.time.actual.year = global.dyworld.time.actual.year + 1
        end
        global.dyworld.time.log = global.dyworld.time.actual.year..":"..global.dyworld.time.actual.day..":"..global.dyworld.time.actual.hour..":"..global.dyworld.time.actual.minute..":"..global.dyworld.time.actual.second
    end
    
    if event.tick%(60*1)==1 then
        for k,v in pairs(game.players) do
            local player = v
            local id = k
            global.dyworld.players[id].coords.x2 = global.dyworld.players[id].coords.x
            global.dyworld.players[id].coords.y2 = global.dyworld.players[id].coords.y
            global.dyworld.players[id].coords.x = v.position.x
			global.dyworld.players[id].coords.y = v.position.y
			global.dyworld.players[id].coords.surface = v.surface.name
            global.dyworld.players[id].survival.water.storage = global.dyworld.players[id].survival.water.storage - (1 * global.dyworld.players[id].survival.water.rate)
            global.dyworld.players[id].survival.food.storage = global.dyworld.players[id].survival.food.storage - (1 * global.dyworld.players[id].survival.food.rate)
            if global.dyworld.players[id].survival.water.storage <= 0 then global.dyworld.players[id].survival.water.storage = 0 end
            if global.dyworld.players[id].survival.food.storage <= 0 then global.dyworld.players[id].survival.food.storage = 0 end
            Refresh_Personal_GUI(player, id)
        end
    end
end