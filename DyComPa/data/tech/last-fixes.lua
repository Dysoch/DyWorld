
function DyComPa_Prereq_Tech_Fix(TECH, ARG)
    if data.raw.technology[TECH] then
        data.raw.technology[TECH].prerequisites = ARG
    end
end
function DyComPa_Ingre_Tech_Fix(TECH, ARG)
    if data.raw.technology[TECH] then
        data.raw.technology[TECH].unit.count = 1
        data.raw.technology[TECH].unit.ingredients = ARG
    end
end

local Fix_Prereq_Table = {
    ["rocket-fuel"] = {"logistic-science-pack", "oil-processing-2"},
    ["nano-range-3"] = {"intermediates-3", "nano-range-2"},
    ["nano-speed-3"] = {"intermediates-3", "nano-speed-2"},
    ["nano-range-4"] = {"storage-2", "nano-range-3"},
    ["nano-speed-4"] = {"storage-2", "nano-speed-3"},    
    ["se-heat-shielding"] = {"chemical-science-pack"},
    ["se-recycling-facility"] = {"automatica-6"},
    ["industrial-furnace"] = {"intermediates-6", "automatica-6"},
    ["se-lifesupport-equipment-1"] = {"se-lifesupport-facility"},
    ["jetpack-1"] = {"fuel-processing"},
    ["se-thruster-suit"] = {"intermediates-1", "space-mining", "jetpack-1", "se-lifesupport-equipment-1"},
    ["se-pulveriser"] = {"logistic-science-pack"},
    ["aai-signal-transmission"] = {"chemical-science-pack"},
    ["se-rtg-equipment"] = {"chemical-science-pack"},
    ["waterfill"] = {"intermediates-5"}, -- from Noxys_Waterfill
}

for k,v in pairs(Fix_Prereq_Table) do
	DyComPa_Prereq_Tech_Fix(k, v)
end

data.raw.technology["rocket-fuel"].unit.ingredients = {
	{"automation-science-pack", 300},
	{"logistic-science-pack", 300},
}

FORCE_ALLOW_ITEM_RECIPES = {
    ["water-well-pump"] = {subgroup = DyDs.."oil-pumps"}, -- from WaterWell
    ["crafting_combinator:crafting-combinator"] = {subgroup = DyDs.."circuit-network"}, -- from crafting_combinator
    ["crafting_combinator:recipe-combinator"] = {subgroup = DyDs.."circuit-network"}, -- from crafting_combinator
    ["gui-signal-display"] = {subgroup = DyDs.."circuit-network"}, -- from visual-signals
}

-- force these recipes to be allowed
for k,v in pairs(FORCE_ALLOW_ITEM_RECIPES) do
    if data.raw.item[k] and v["subgroup"] then
        data.raw.item[k].subgroup = v.subgroup
        data.raw.recipe[k].enabled = true
        data.raw.recipe[k].hidden = false
        data.raw.recipe[k].DyWorld_Hider = false
    end
end

for k,v in pairs(data.raw.technology) do
	if v.hidden == true then
		v.effects = {}
    end
end
