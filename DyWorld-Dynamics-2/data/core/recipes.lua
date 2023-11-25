

-- Main Ore to Ore --
for k,v in pairs(DyWorld_2_Ore_Table_Main) do 
    if v.plate and data.raw.item[v.plate] and data.raw.item[k] and not data.raw.recipe[v.plate.."-0a"] then
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
    if v.ore and v.plate and data.raw.item[v.plate] and data.raw.item[v.ore.."-clean"] and not data.raw.recipe[v.plate.."-0b"] then
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
    if v.chunk and v.ore and data.raw.item[v.chunk] and data.raw.item[v.ore] and not data.raw.recipe[v.ore.."-0a"] then
        data:extend({
            {
              type = "recipe",
              name = v.ore.."-0a",
              category = DyDs.."assembling-1",
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
    if v.ground and data.raw.item[k.."-ground"] and data.raw.item[k] and not data.raw.recipe[k.."-to-ground-1"] and not data.raw.recipe[k.."-to-ground-2"] and not data.raw.recipe[k.."-to-ground-3"] then
        data:extend({
            {
              type = "recipe",
              name = k.."-to-ground-1",
              category = DyDs.."grinding",
              main_product = k.."-ground",
              Add_To_Tech = k.."-processing-1",
              normal =
              {
                ingredients =
                {
                    {type = "item", name = k, amount = 15},
                },
                results =
                {
                  {type = "item", name = k.."-ground", amount_min = 12, amount_max = 18},
                  {type = "item", name = k.."-ground", amount_min = 10, amount_max = 15, probability = 0.01},
                },
                main_product = k.."-ground",
                energy_required = 2.5,
                enabled = false,
              },
            },
            {
              type = "recipe",
              name = k.."-to-ground-2",
              category = DyDs.."grinding",
              main_product = k.."-ground",
              Add_To_Tech = k.."-processing-2",
              normal =
              {
                ingredients =
                {
                    {type = "item", name = k, amount = 30},
                },
                results =
                {
                  {type = "item", name = k.."-ground", amount_min = 25, amount_max = 45},
                  {type = "item", name = k.."-ground", amount_min = 10, amount_max = 15, probability = 0.01},
                },
                main_product = k.."-ground",
                energy_required = 4,
                enabled = false,
              },
            },
            {
              type = "recipe",
              name = k.."-to-ground-3",
              category = DyDs.."grinding",
              main_product = k.."-ground",
              Add_To_Tech = k.."-processing-3",
              normal =
              {
                ingredients =
                {
                    {type = "item", name = k, amount = 50},
                },
                results =
                {
                  {type = "item", name = k.."-ground", amount_min = 70, amount_max = 80},
                  {type = "item", name = k.."-ground", amount_min = 10, amount_max = 15, probability = 0.01},
                },
                main_product = k.."-ground",
                energy_required = 10,
                enabled = false,
              },
            },
        })
    end
end

-- Ore to Ore --
for k,v in pairs(DyWorld_2_Ore_Table) do
    -- multiple checks to ensure no loading errors --
    if (v.properties.plate and data.raw.item[k.."-plate"]) and (v.properties.chunk and data.raw.item[k.."-chunk"]) then
        -- chunk to plate --
        --maybe add it????
    end
    if (v.properties.plate and data.raw.item[k.."-plate"]) and (v.properties.ore and data.raw.item[k.."-ore"]) and not data.raw.recipe[k.."-plate-from-"..k.."-ore"] then
        -- ore to plate --
        data:extend({
            {
              type = "recipe",
              name = k.."-plate-from-"..k.."-ore",
              category = "smelting",
              Add_To_Tech = (v.properties.tech and k.."-processing-1" and not v.basic) or nil,
              main_product = k.."-plate",
              normal =
              {
                ingredients =
                {
                    {type = "item", name = k.."-ore", amount = 1},
                },
                results =
                {
                    {type = "item", name = k.."-plate", amount_min = 1, amount_max = 1},
                },
                main_product = k.."-plate",
                energy_required = 2.5,
                enabled = true,
              },
            },
        })
        
    end
    if (v.properties.plate and data.raw.item[k.."-plate"]) and (v.properties.clean and data.raw.item[k.."-ore-clean"]) then
        -- clean ore to plate --
        
    end
    if (v.properties.slurry and data.raw.fluid["slurry-"..k]) and (v.properties.clean and data.raw.item[k.."-ore-clean"]) and not data.raw.recipe[k.."-ore-clean-from-slurry-"..k] then
        -- slurry to clean ore --
        data:extend({
            {
              type = "recipe",
              name = k.."-ore-clean-from-slurry-"..k,
              category = DyDs.."grinding",
              main_product = k.."-ore-clean",
              Add_To_Tech = (v.properties.tech and k.."-processing-1") or nil,
              normal =
              {
                ingredients =
                {
                    {type = "fluid", name = "slurry-"..k, amount = 10},
                },
                results =
                {
                    {type = "item", name = k.."-ore-clean", amount_min = 10, amount_max = 12},
                    {type = "fluid", name = "water-dirty", amount = 5},
                },
                main_product = k.."-ore-clean",
                energy_required = 2.5,
                enabled = true,
              },
            },
        })
        
    end
    if (v.properties.slurry and data.raw.fluid["slurry-"..k]) then
        if (v.properties.ore and data.raw.item[k.."-ore"]) and not data.raw.recipe[k.."-ore-to-slurry-"..k] then
            -- ore to slurry --
            data:extend({
                {
                type = "recipe",
                name = k.."-ore-to-slurry-"..k,
                category = DyDs.."grinding",
                main_product = "slurry-"..k,
                Add_To_Tech = (v.properties.tech and k.."-processing-1") or nil,
                normal =
                {
                    ingredients =
                    {
                        {type = "item", name = k.."-ore", amount = 10},
                        {type = "fluid", name = "water", amount = 10},
                    },
                    results =
                    {
                        {type = "fluid", name = "slurry-"..k, amount_min = 10, amount_max = 12},
                    },
                    main_product = "slurry-"..k,
                    energy_required = 2.5,
                    enabled = true,
                },
                },
            })
        elseif data.raw.item[k] and not data.raw.recipe[k.."-to-slurry-"..k] then
            -- to slurry --
            data:extend({
                {
                type = "recipe",
                name = k.."-to-slurry-"..k,
                category = DyDs.."grinding",
                main_product = "slurry-"..k,
                Add_To_Tech = (v.properties.tech and k.."-processing-1") or nil,
                normal =
                {
                    ingredients =
                    {
                        {type = "item", name = k, amount = 10},
                        {type = "fluid", name = "water", amount = 10},
                    },
                    results =
                    {
                        {type = "fluid", name = "slurry-"..k, amount_min = 10, amount_max = 12},
                    },
                    main_product = "slurry-"..k,
                    energy_required = 2.5,
                    enabled = true,
                },
                },
            })
            
        end
    end
    if (v.molten.enabled and data.raw.fluid["molten-"..k]) and (v.properties.plate and data.raw.item[k.."-plate"]) and not data.raw.recipe[k.."-plate-from-molten-"..k] then
        -- molten to plate --
        data:extend({
            {
              type = "recipe",
              name = k.."-plate-from-molten-"..k,
              category = DyDs.."casting",
              main_product = k.."-plate",
              Add_To_Tech = (v.properties.tech and k.."-processing-1") or nil,
              normal =
              {
                ingredients =
                {
                    {type = "fluid", name = "molten-"..k, amount = 1},
                },
                results =
                {
                    {type = "item", name = k.."-plate", amount_min = 1, amount_max = 1},
                },
                main_product = k.."-plate",
                energy_required = 0.5,
                enabled = true,
              },
            },
        })
        --[[
        if v.properties.tech and not (k == "iron" or k == "copper" or k == "tin") then
            data.raw.recipe[k.."-plate-from-"..k.."-molten"].Add_To_Tech = k.."-processing-1"
        end
        ]]
    end
    if (v.molten.enabled and data.raw.fluid["molten-"..k]) and (v.properties.clean and data.raw.item[k.."-ore-clean"]) and not data.raw.recipe["molten-"..k.."-from-"..k.."-ore-clean"] then
        -- ore clean to molten --
        data:extend({
            {
              type = "recipe",
              name = "molten-"..k.."-from-"..k.."-ore-clean",
              category = DyDs.."blast-furnace",
              main_product = "molten-"..k,
              Add_To_Tech = (v.properties.tech and k.."-processing-1") or nil,
              normal =
              {
                ingredients =
                {
                    {type = "item", name = k.."-ore-clean", amount = 10},
                },
                results =
                {
                    {type = "fluid", name = "molten-"..k, amount_min = 12, amount_max = 15},
                },
                main_product = "molten-"..k,
                energy_required = 7.5,
                enabled = true,
              },
            },
        })
    end
end