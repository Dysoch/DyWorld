

local Science_Table = {"automation", "logistic", "chemical", "military", "production", "utility", "biological"}

for k,v in pairs(Science_Table) do
    DyDS_Add_Tool({
        name = v.."-science-pack",
        icon = DyDs_path_icon.."science-1/"..v..".png",
        icon_size = 32,
       -- icons = {{icon = "__base__/graphics/icons/space-science-pack.png", tint = Science_Colors[v]}},
        stack_size = 200,
        durability = 1,
        subgroup = DyDs.."science-packs",
    })
    DyDS_Add_Tool({
        name = v.."-science-pack-advanced",
        icon = DyDs_path_icon.."science-2/"..v..".png",
        icon_size = 32,
        --icons = {{icon = "__base__/graphics/icons/space-science-pack.png", tint = Science_Colors[v]}},
        stack_size = 100,
        durability = 1,
        subgroup = DyDs.."science-packs",
    })
end

for i = 1,10 do
    DyDS_Add_Tool({
        name = "dyworld-story-objectives-main-"..i,
        icon = DyDs_tech_temp,
        icon_size = 256,
        stack_size = 1,
        durability = 1,
        subgroup = DyDs.."science-packs",
    })
    DyDS_Add_Tool({
        name = "dyworld-story-objectives-side-"..i,
        icon = DyDs_tech_temp,
        icon_size = 256,
        stack_size = 1,
        durability = 1,
        subgroup = DyDs.."science-packs",
    })
end