

if data.raw.resource["iron-ore"] then
    local v = data.raw.resource["iron-ore"]
    v.localised_name = {"looped-name.deposit", {"item-name.hematite"}}
    v.minable =
    {
      --mining_particle = resource_parameters.name .. "-particle",
      mining_time = 1,
      results = {
        {type = "item", name = "hematite", amount_min = 1, amount_max = 1},
        {type = "item", name = "iron-chunk", amount_min = 1, amount_max = 5, probability = 0.5},
        {type = "item", name = "iron-ore", amount_min = 1, amount_max = 1, probability = 0.35},
        {type = "item", name = "iron-ore-clean", amount_min = 1, amount_max = 1, probability = 0.0001},
      },
    }
end

if data.raw.resource["copper-ore"] then
    local v = data.raw.resource["copper-ore"]
    v.localised_name = {"looped-name.deposit", {"item-name.chalcopyrite"}}
    v.minable =
    {
      --mining_particle = resource_parameters.name .. "-particle",
      mining_time = 1,
      results = {
        {type = "item", name = "chalcopyrite", amount_min = 1, amount_max = 1},
        {type = "item", name = "copper-chunk", amount_min = 1, amount_max = 5, probability = 0.5},
        {type = "item", name = "copper-ore", amount_min = 1, amount_max = 1, probability = 0.35},
        {type = "item", name = "copper-ore-clean", amount_min = 1, amount_max = 1, probability = 0.0001},
      },
    }
end

if data.raw.resource["stone"] then
    local v = data.raw.resource["stone"]
    v.localised_name = {"looped-name.deposit", {"item-name.limestone"}}
    v.minable =
    {
      --mining_particle = resource_parameters.name .. "-particle",
      mining_time = 1,
      results = {
        {type = "item", name = "limestone", amount_min = 1, amount_max = 1},
        {type = "item", name = "stone", amount_min = 1, amount_max = 5, probability = 0.25},
      },
    }
end

if data.raw.resource["coal"] then
    local v = data.raw.resource["coal"]
    v.localised_name = {"looped-name.deposit", {"item-name.carbon"}}
    v.minable =
    {
      --mining_particle = resource_parameters.name .. "-particle",
      mining_time = 1,
      results = {
        {type = "item", name = "carbon", amount_min = 1, amount_max = 1},
        {type = "item", name = "coal", amount_min = 1, amount_max = 5, probability = 0.25},
      },
    }
end

if data.raw["autoplace-control"]["iron-ore"] then
    local v = data.raw["autoplace-control"]["iron-ore"]
    v.localised_name = {"", "[item=hematite] ", {"looped-name.deposit", {"item-name.hematite"}}}
end

if data.raw["autoplace-control"]["copper-ore"] then
    local v = data.raw["autoplace-control"]["copper-ore"]
    v.localised_name = {"", "[item=chalcopyrite] ", {"looped-name.deposit", {"item-name.chalcopyrite"}}}
end

if data.raw["autoplace-control"]["stone"] then
    local v = data.raw["autoplace-control"]["stone"]
    v.localised_name = {"", "[item=limestone] ", {"looped-name.deposit", {"item-name.limestone"}}}
end

if data.raw["autoplace-control"]["coal"] then
    local v = data.raw["autoplace-control"]["coal"]
    v.localised_name = {"", "[item=carbon] ", {"looped-name.deposit", {"item-name.carbon"}}}
end