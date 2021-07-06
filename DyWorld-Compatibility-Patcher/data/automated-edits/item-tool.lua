



local Tool1 = table.deepcopy(data.raw["item"]["iron-ore"])
Tool1.type = "tool"
Tool1.localised_name = {"looped-name.iron-2"}
Tool1.subgroup = DyDs.."0-resource-2"
Tool1.durability = 1
Tool1.durability_description_key = "description.science-pack-remaining-amount-key"
Tool1.durability_description_value = "description.science-pack-remaining-amount-value"

local Tool2 = table.deepcopy(data.raw["item"]["copper-ore"])
Tool2.type = "tool"
Tool2.localised_name = {"looped-name.copper-2"}
Tool2.subgroup = DyDs.."0-resource-2"
Tool2.durability = 1
Tool2.durability_description_key = "description.science-pack-remaining-amount-key"
Tool2.durability_description_value = "description.science-pack-remaining-amount-value"

local Tool3 = table.deepcopy(data.raw["item"]["iron-plate"])
Tool3.type = "tool"
Tool3.localised_name = {"looped-name.iron-4"}
Tool3.subgroup = DyDs.."metal-2"
Tool3.durability = 1
Tool3.durability_description_key = "description.science-pack-remaining-amount-key"
Tool3.durability_description_value = "description.science-pack-remaining-amount-value"

local Tool4 = table.deepcopy(data.raw["item"]["copper-plate"])
Tool4.type = "tool"
Tool4.localised_name = {"looped-name.copper-4"}
Tool4.subgroup = DyDs.."metal-2"
Tool4.durability = 1
Tool4.durability_description_key = "description.science-pack-remaining-amount-key"
Tool4.durability_description_value = "description.science-pack-remaining-amount-value"

local Tool5 = table.deepcopy(data.raw["item"]["steel-plate"])
Tool5.type = "tool"
Tool5.localised_name = {"looped-name.steel-4"}
Tool5.subgroup = DyDs.."metal-3"
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

data:extend({Tool1, Tool2, Tool3, Tool4, Tool5, Tool6, Tool7})

data.raw.item["iron-ore"] = nil
data.raw.item["copper-ore"] = nil
data.raw.item["iron-plate"] = nil
data.raw.item["copper-plate"] = nil
data.raw.item["steel-plate"] = nil
data.raw.item["wood"] = nil
data.raw.item["sulfur"] = nil