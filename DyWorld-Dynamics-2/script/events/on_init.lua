



function Event_on_init()
    if not global.dyworld then
        global.dyworld = {
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
        }
    end
end

