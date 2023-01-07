

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
