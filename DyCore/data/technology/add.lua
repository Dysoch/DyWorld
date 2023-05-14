local DyDs_icon_temp = "__DyCore__/graphics/questionmark.png"

DyW.Tech.Add = {}

function DyW.Tech.Add.Basic(Name, PreReq)
    if data.raw.technology[Name] then
        data.raw.technology[Name].prerequisites = PreReq
        data.raw.technology[Name].order = Name
        data.raw.technology[Name].upgrade = true
        data.raw.technology[Name].unit = {
            count = 100,
            ingredients = {
                {"automation-science-pack", 1}
            },
            time = 100,
        }
    else
        data:extend({
        {
            type = "technology",
            name = Name,
            icon = DyDs_icon_temp,
            icon_size = 64,
            flag = {},
            effects = {},
            prerequisites = PreReq or {},
            unit = {
                count = 100,
                ingredients = {
                    {"automation-science-pack", 1}
                },
                time = 100,
            },
            order = Name,
            upgrade = true,
        },
        })
    end
end