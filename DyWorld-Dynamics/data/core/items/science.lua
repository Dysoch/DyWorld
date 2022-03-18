

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
        icons = {{icon = "__base__/graphics/icons/space-science-pack.png", tint = Science_Colors[v]}},
        stack_size = 100,
        durability = 1,
        subgroup = DyDs.."science-packs",
    })
end

DyDS_Add_Tool({
    name = "unobtainium-science-pack",
    icon = DyDs_tech_temp,
    icon_size = 256,
    localised_description = {"item-description.unobtainium-science-pack"},
    stack_size = 1,
    durability = 1,
    subgroup = DyDs.."science-packs",
})