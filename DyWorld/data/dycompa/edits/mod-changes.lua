require "data/core/functions/prefix"

 -- ReforestedWood --
if mods["ReforestedWood"] then

data.raw["resource"]["reforested-wood"].minable.mining_time = 2.5
data.raw["resource"]["reforested-wood"].minable.fluid_amount = 25
data.raw["resource"]["reforested-wood"].autoplace.richness_multiplier_distance_bonus = 0.1
data.raw["resource"]["reforested-wood"].autoplace.richness_base = 1500
data.raw["resource"]["reforested-wood"].autoplace.sharpness = 0.99999
data.raw["resource"]["reforested-wood"].autoplace.coverage = 0.00015 / 2

end