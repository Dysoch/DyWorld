



local Tool5 = table.deepcopy(data.raw["item"]["steel-plate"])
Tool5.type = "tool"
Tool5.localised_name = {"looped-name.steel-4"}
Tool5.subgroup = DyDs.."0-resource-4"
Tool5.durability = 1
Tool5.durability_description_key = "description.science-pack-remaining-amount-key"
Tool5.durability_description_value = "description.science-pack-remaining-amount-value"

local Tool6 = table.deepcopy(data.raw["item"]["wood"])
Tool6.type = "tool"
Tool6.subgroup = DyDs.."intermediates-tier-0"
Tool6.durability = 1
Tool6.durability_description_key = "description.science-pack-remaining-amount-key"
Tool6.durability_description_value = "description.science-pack-remaining-amount-value"

local Tool7 = table.deepcopy(data.raw["item"]["sulfur"])
Tool7.type = "tool"
Tool7.subgroup = DyDs.."intermediates-tier-4"
Tool7.durability = 1
Tool7.durability_description_key = "description.science-pack-remaining-amount-key"
Tool7.durability_description_value = "description.science-pack-remaining-amount-value"

--data:extend({Tool1, Tool2, Tool3, Tool4, Tool5, Tool6, Tool7})
data:extend({Tool5, Tool6, Tool7})

data.raw.item["iron-ore"].subgroup = DyDs.."0-resource-2"
data.raw.item["copper-ore"].subgroup = DyDs.."0-resource-2"
data.raw.item["iron-plate"].subgroup = DyDs.."0-resource-4"
data.raw.item["copper-plate"].subgroup = DyDs.."0-resource-4"

data.raw.item["steel-plate"] = nil
data.raw.item["wood"] = nil
data.raw.item["sulfur"] = nil