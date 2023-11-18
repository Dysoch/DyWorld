

-- Main Ore to Ore --
for k,v in pairs(DyWorld_2_Ore_Table_Main) do 
    if v.plate and data.raw.item[v.plate] and data.raw.item[k] then
        data:extend({
            {
              type = "recipe",
              name = v.plate.."-0a",
              category = "smelting",
              main_product = v.plate,
              Add_To_Tech = v.Tech and v.Tech or nil,
              normal =
              {
                ingredients =
                {
                    {type = "item", name = k, amount = 1},
                },
                results =
                {
                  {type = "item", name = v.plate, amount_min = 1, amount_max = 1, probability = Round((1 / v.ratio_plate), 2)},
                },
                main_product = v.plate,
                energy_required = (v.ratio_plate * 1.5),
                enabled = true,
              },
            },
        })
    end
    if v.ore and v.plate and data.raw.item[v.plate] and data.raw.item[v.ore.."-clean"] then
        data:extend({
            {
              type = "recipe",
              name = v.plate.."-0b",
              category = "smelting",
              main_product = v.plate,
              Add_To_Tech = v.Tech and v.Tech or nil,
              normal =
              {
                ingredients =
                {
                    {type = "item", name = v.ore.."-clean", amount = 1},
                },
                results =
                {
                  {type = "item", name = v.plate, amount_min = 2, amount_max = 4, probability = 1},
                },
                main_product = v.plate,
                energy_required = (v.ratio_plate * 2.5),
                enabled = true,
              },
            },
        })
    end
    if v.chunk and v.ore and data.raw.item[v.chunk] and data.raw.item[v.ore] then
        data:extend({
            {
              type = "recipe",
              name = v.ore.."-0a",
              --category = "smelting",
              main_product = v.ore,
              Add_To_Tech = v.Tech and v.Tech or nil,
              normal =
              {
                ingredients =
                {
                    {type = "item", name = v.chunk, amount = 100},
                },
                results =
                {
                  {type = "item", name = v.ore, amount_min = 1, amount_max = 1},
                  {type = "item", name = v.ore, amount_min = 1, amount_max = 10, probability = 0.0001},
                },
                main_product = v.ore,
                energy_required = 2.5,
                enabled = true,
              },
            },
        })
    end
    if v.ground and data.raw.item[k.."-ground"] and data.raw.item[k] then
        data:extend({
            {
              type = "recipe",
              name = k.."-to-ground",
              --category = "smelting",
              main_product = k.."-ground",
              Add_To_Tech = k.."-processing-1",
              normal =
              {
                ingredients =
                {
                    {type = "item", name = k, amount = 100},
                },
                results =
                {
                  {type = "item", name = k.."-ground", amount_min = 100, amount_max = 110},
                  {type = "item", name = k.."-ground", amount_min = 100, amount_max = 200, probability = 0.01},
                },
                main_product = k.."-ground",
                energy_required = 2.5,
                enabled = false,
              },
            },
        })
    end
end