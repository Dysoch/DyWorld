



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
end