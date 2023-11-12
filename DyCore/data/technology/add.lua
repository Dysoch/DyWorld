local DyDs_icon_temp = "__DyCore__/graphics/questionmark.png"

DyW.Tech.Add = {}

function DyW.Tech.Add.Basic(Name, PreReq, Count)
    if not Count then Count = 100 end
    if data.raw.technology[Name] then
        data.raw.technology[Name].prerequisites = PreReq
        data.raw.technology[Name].order = Name
        data.raw.technology[Name].upgrade = true
        data.raw.technology[Name].unit = {
            count = 1,
            ingredients = {
                {"automation-science-pack", Count}
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
                count = 1,
                ingredients = {
                    {"automation-science-pack", Count}
                },
                time = 100,
            },
            order = Name,
            upgrade = true,
        },
        })
    end
end