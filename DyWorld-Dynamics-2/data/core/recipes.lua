

-- Main Ore to Ore --
for k,v in pairs(DyWorld_2_Ore_Table_Main) do 
    if v.ore and data.raw.item[v.ore] and data.raw.item[k] then
        data:extend({
            {
              type = "recipe",
              name = v.ore.."-0",
              --category = "air-filter",
              main_product = v.ore,
              normal =
              {
                ingredients =
                {
                    {type = "item", name = k, amount = v.ratio_main},
                },
                results =
                {
                  {type = "item", name = v.ore, amount_min = 1, amount_max = v.ratio_ore},
                },
                main_product = v.ore,
                energy_required = (v.ratio_ore * 2.5),
                enabled = true,
              },
            },
        })
    end
end

for k,v in pairs(DyWorld_2_Ore_Table) do
    if v.properties and v.properties.chunk then
        data:extend({
            {
              type = "recipe",
              name = k.."-0-chunk",
              --category = "air-filter",
              main_product = k.."-ore",
              normal =
              {
                ingredients =
                {
                    {type = "item", name = k.."-chunk", amount = 100},
                },
                results =
                {
                  {type = "item", name = k.."-ore", amount_min = 6, amount_max = 10},
                },
                main_product = k.."-ore",
                energy_required = 2.5,
                enabled = true,
              },
            },
        })
    end
end