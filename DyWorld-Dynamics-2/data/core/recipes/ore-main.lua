
for k,v in pairs(DyWorld_2_Ore_Table_Main) do
    if Dy_Metal_Table[v.type] and data.raw.item[k.."-ground"] then
        data:extend({
            {
                type = "recipe",
                name = k.."-ground-to-"..v.ore,
                category = DyDs.."grinding",
                main_product = v.ore,
                Add_To_Tech = k.."-processing-1",
                normal = {
                    ingredients = {
                        {type = "item", name = k.."-ground", amount = 50},
                        {type = "fluid", name = "water", amount = 10},
                    },
                    results = {
                        {type = "item", name = v.ore, amount_min = (v.ratio_main * 10), amount_max = (v.ratio_main * 15), probability = 1},
                        {type = "item", name = v.chunk, amount_min = (v.ratio_main * 8), amount_max = (v.ratio_main * 8), probability = 0.15},
                        {type = "item", name = v.ore, amount_min = (v.ratio_main * 10), amount_max = (v.ratio_main * 30), probability = 0.01},
                        {type = "fluid", name = "steam-dirty", amount = 10, temperature = 150},
                    },
                    main_product = v.ore,
                    energy_required = 2.5,
                    enabled = true,
                },
            },
        })
    end
end
