



--[[local Recipes = {
	["motor"] = {"intermediates-1"},
	["electric-motor"] = {"intermediates-2"},
}


for name, techtable in pairs(Recipes) do
	for _,tech in pairs(techtable) do
		DyWorld_Add_To_Tech(tech, name)
	end
end]]--

DyW.Tech.Prereq.Override("se-rocket-fuel-from-water", {"oil-processing", "chemical-science-pack"})
DyW.Tech.Prereq.Override("se-fuel-refining", {"oil-processing", "logistic-science-pack"})
data.raw.technology["artillery-shell-range-2"].hidden = true
data.raw.technology["artillery-shell-speed-2"].hidden = true

DyW.Tech.Prereq.Override("se-rocket-science-pack", {"se-space-science-lab", "intermediates-6"})
--DyW.Tech.Prereq.Override("se-adaptive-armour-1", {"modular-armor", "se-", "se-", "se-", ""})
--DyW.Tech.Prereq.Override("se-adaptive-armour-2", {"se-", "se-", "se-", "se-", ""})
--DyW.Tech.Prereq.Override("se-adaptive-armour-3", {"se-", "se-", "se-", "se-", ""})
--DyW.Tech.Prereq.Override("se-adaptive-armour-4", {"se-", "se-", "se-", "se-", ""})
--DyW.Tech.Prereq.Override("se-adaptive-armour-5", {"se-", "se-", "se-", "se-", ""})
DyW.Tech.Prereq.Override("se-aeroframe-pole", {"se-processing-beryllium", "se-astronomic-science-pack-1"})
DyW.Tech.Prereq.Override("se-medpack", {"automation-science-pack"})
DyW.Tech.Prereq.Override("se-aeroframe-scaffold", {"se-aeroframe-pole", "se-astronomic-science-pack-2", "intermediates-6"})
DyW.Tech.Prereq.Override("se-aeroframe-bulkhead", {"se-aeroframe-scaffold", "se-astronomic-science-pack-3"})
DyW.Tech.Prereq.Override("se-antimatter-reactor", {"reactor-4", "se-antimatter-production"})
DyW.Tech.Prereq.Override("se-astronomic-science-pack-1", {"se-processing-beryllium", "se-space-catalogue-astronomic-1"})
DyW.Tech.Prereq.Override("se-astronomic-science-pack-2", {"se-space-catalogue-astronomic-2"})
DyW.Tech.Prereq.Override("se-astronomic-science-pack-3", {"se-space-catalogue-astronomic-3"})
DyW.Tech.Prereq.Override("se-astronomic-science-pack-4", {"se-space-catalogue-astronomic-4"})
DyW.Tech.Prereq.Override("se-biological-science-pack-1", {"se-processing-vitamelange", "se-space-catalogue-biological-1"})
DyW.Tech.Prereq.Override("se-biological-science-pack-2", {"se-space-catalogue-biological-2", "se-bioscrubber"})
DyW.Tech.Prereq.Override("se-biological-science-pack-3", {"se-space-catalogue-biological-3"})
DyW.Tech.Prereq.Override("se-biological-science-pack-4", {"se-space-catalogue-biological-4"})
DyW.Tech.Prereq.Override("se-core-miner", {"se-pulveriser", "oil-processing-2", "logistic-science-pack-advanced"})
DyW.Tech.Prereq.Override("se-cryogun", {"se-aeroframe-pole", "se-processing-cryonite", "se-space-thermodynamics-laboratory", "warfare-10"})
DyW.Tech.Prereq.Override("se-meteor-point-defence", {"intermediates-2", "logistic-science-pack"})
DyW.Tech.Prereq.Override("se-meteor-defence", {"chemical-science-pack", "se-meteor-point-defence", "intermediates-5"})

