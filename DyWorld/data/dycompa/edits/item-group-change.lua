require "data/core/functions/prefix"

 -- FARL --
if mods['FARL'] then
data.raw["item-with-entity-data"]["farl"].subgroup = dy.."locomotive"
data.raw["item-with-entity-data"]["farl"].order = Order_Tiers["single"]
data.raw.item["farl-roboport"].subgroup = dy.."locomotive"
data.raw.item["farl-roboport"].order = Order_Tiers["single"]
end