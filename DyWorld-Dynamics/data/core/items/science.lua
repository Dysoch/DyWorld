

local Science_Table = {"automation", "logistic", "chemical", "military", "production", "utility", "biological"}

for k,v in pairs(Science_Table) do
    DyDS_Add_Tool({
        name = v.."-science-pack",
        icons = {{icon = "__base__/graphics/icons/space-science-pack.png", tint = Science_Colors[v]}},
        stack_size = 200,
        durability = 1,
        subgroup = DyDs.."science-packs",
    })
    DyDS_Add_Tool({
        name = v.."-science-pack-advanced",
        icons = {{icon = "__base__/graphics/icons/space-science-pack.png", tint = Science_Colors_Advanced[v]}},
        stack_size = 100,
        durability = 1,
        subgroup = DyDs.."science-packs",
    })
end

