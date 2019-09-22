require "data/core/functions/prefix"

  -- ReforestedWood --
if mods["ReforestedWood"] then
data.raw["resource"]["reforested-wood"].minable.mining_time = 7.5
data.raw["resource"]["reforested-wood"].minable.fluid_amount = 25
data.raw["resource"]["reforested-wood"].autoplace.richness_multiplier_distance_bonus = 0.1
data.raw["resource"]["reforested-wood"].autoplace.richness_base = 10
data.raw["resource"]["reforested-wood"].autoplace.sharpness = 0.99999
data.raw["resource"]["reforested-wood"].autoplace.coverage = 0.0015 / 2
data.raw["resource"]["reforested-wood"].autoplace.starting_area_size = 1 * 10
data.raw["resource"]["reforested-wood"].autoplace.starting_area_amount = 10
data.raw["resource"]["reforested-wood"].minable.result = nil
data.raw["resource"]["reforested-wood"].minable.results = 
    {{name = "wood", amount_min = 1, amount_max = 1, probability = 1},
    {name = "acorn", amount_min = 1, amount_max = 1, probability = 0.005}}   
end