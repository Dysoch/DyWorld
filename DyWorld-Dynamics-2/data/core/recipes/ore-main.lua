
for k,v in pairs(DyWorld_2_Ore_Table_Main) do
    if Dy_Metal_Table[v.type] then
        data:extend({
            {
                type = "recipe",
                name = k.."-to-"..v.ore,
                category = DyDs.."grinding",
                main_product = v.ore,
                Add_To_Tech = k.."-processing-1",
                normal = {
                    ingredients = {
                        {type = "item", name = k, amount = 1},
                    },
                    results = {
                        {type = "item", name = v.ore, amount_min = v.ratio_main, amount_max = v.ratio_main, probability = 1},
                        {type = "item", name = v.chunk, amount_min = (v.ratio_main * 8), amount_max = (v.ratio_main * 8), probability = 0.15},
                        {type = "item", name = v.ore, amount_min = 1, amount_max = (v.ratio_main * 10), probability = 0.01},
                    },
                    main_product = v.ore,
                    energy_required = 2.5,
                    enabled = true,
                },
            },
        })
    end
end
