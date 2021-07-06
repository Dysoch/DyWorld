



local Recipes = {
	["aai-strongbox"] = {"copper-processing", "iron-processing", "tin-processing"},
	["bloomery"] = {"copper-processing", "iron-processing", "tin-processing"},
	["centrifuge"] = {"copper-processing", "iron-processing", "tin-processing"},
	["bronze-pump"] = {"copper-processing", "iron-processing", "tin-processing"},
	["water-centrifuge"] = {"copper-processing", "iron-processing", "tin-processing"},
	["canister-empty"] = {"copper-processing", "iron-processing", "tin-processing"},
	["canister-oxygen"] = {"copper-processing", "iron-processing", "tin-processing"},
	["titanium-ore"] = {"titanium-processing"},
	["aluminium-ore"] = {"aluminium-processing"},
	["aluminium-ore"] = {"magnesium-processing"},
	["cast-titanium-3a"] = {"titanium-processing"},
	["cast-titanium-3b"] = {"titanium-processing"},
	["cast-aluminium-3a"] = {"aluminium-processing"},
	["cast-aluminium-3b"] = {"aluminium-processing"},
	["cast-magnesium-3a"] = {"magnesium-processing"},
	["cast-magnesium-3b"] = {"magnesium-processing"},
	["canister-nitrogen"] = {"copper-processing"},
	["canister-water"] = {"iron-processing"},
	["canister-hydrogen"] = {"tin-processing"},
	["cast-copper-2"] = {"copper-processing"},
	["cast-iron-2"] = {"iron-processing"},
	["cast-tin-2"] = {"tin-processing"},
	["cast-bronze-2"] = {"bronze-processing"},
	["cast-bronze-3a"] = {"advanced-bronze-processing"},
	["cast-bronze-3b"] = {"advanced-bronze-processing"},
	["cast-copper-3a"] = {"advanced-copper-processing"},
	["cast-iron-3a"] = {"advanced-iron-processing"},
	["cast-tin-3a"] = {"advanced-tin-processing"},
	["cast-copper-3b"] = {"advanced-copper-processing"},
	["cast-iron-3b"] = {"advanced-iron-processing"},
	["cast-tin-3b"] = {"advanced-tin-processing"},
	["cast-steel-2"] = {"steel-processing"},
	["cast-steel-3a"] = {"advanced-steel-processing"},
	["cast-steel-3b"] = {"advanced-steel-processing"},
	
	["blast-furnace"] = {"metallurgy-1"},
	["caster"] = {"metallurgy-1"},
	
	["ilmenite"] = {"metallurgy-2"},
	["biotite"] = {"metallurgy-2"},
	
	["ore-purify-copper-1"] = {"copper-processing"},
	["ore-purify-iron-1"] = {"iron-processing"},
	["ore-purify-tin-1"] = {"tin-processing"},
	["ore-purify-magnesium-1"] = {"magnesium-processing"},
	["ore-purify-titanium-1"] = {"titanium-processing"},
	["ore-purify-aluminium-1"] = {"aluminium-processing"},
	["ore-purify-gold-1"] = {"metallurgy-3"},
	["ore-purify-lead-1"] = {"metallurgy-3"},
	["ore-purify-silver-1"] = {"metallurgy-3"},
	
	["ore-purify-copper-2"] = {"metallurgy-2"},
	["ore-purify-iron-2"] = {"metallurgy-2"},
	["ore-purify-tin-2"] = {"metallurgy-2"},
	["ore-purify-magnesium-2"] = {"metallurgy-3"},
	["ore-purify-titanium-2"] = {"metallurgy-3"},
	["ore-purify-aluminium-2"] = {"metallurgy-3"},
	["ore-purify-gold-2"] = {"metallurgy-5"},
	["ore-purify-lead-2"] = {"metallurgy-5"},
	["ore-purify-silver-2"] = {"metallurgy-5"},
	
	["ore-purify-copper-3"] = {"metallurgy-4"},
	["ore-purify-iron-3"] = {"metallurgy-4"},
	["ore-purify-tin-3"] = {"metallurgy-4"},
	["ore-purify-magnesium-3"] = {"metallurgy-5"},
	["ore-purify-titanium-3"] = {"metallurgy-5"},
	["ore-purify-aluminium-3"] = {"metallurgy-5"},
	["ore-purify-gold-3"] = {"metallurgy-7"},
	["ore-purify-lead-3"] = {"metallurgy-7"},
	["ore-purify-silver-3"] = {"metallurgy-7"},
	
	["slag-processing"] = {"slag-processing"},
	
	["asteroid-miner-tin"] = {"basic-asteroid-mining"},
	["asteroid-miner-iron"] = {"basic-asteroid-mining"},
	["asteroid-miner-copper"] = {"basic-asteroid-mining"},
	["asteroid-miner-stone"] = {"basic-asteroid-mining"},
	["asteroid-miner-titanium"] = {"basic-asteroid-mining"},
	["asteroid-miner-random"] = {"basic-asteroid-mining"},
	["asteroid-miner-coal-1"] = {"basic-asteroid-mining"},
	["asteroid-miner-coal-2"] = {"basic-asteroid-mining"},
	["asteroid-miner-coal-3"] = {"basic-asteroid-mining"},
	
	["grinder"] = {"automatica-1"},
	["quartz"] = {"automatica-1"},
	["dy-arithmetic-combinator"] = {"automatica-1"},
	["dy-decider-combinator"] = {"automatica-1"},
	["dy-constant-combinator"] = {"automatica-1"},
	
	["dy-power-switch"] = {"automatica-2"},
	
	["dy-programmable-speaker"] = {"automatica-3"},
	["advanced-assembler"] = {"automatica-3"},
	
	["nano-assembler"] = {"automatica-5"},
	
	["quantum-assembler"] = {"automatica-8"},
	
	["small-lamp"] = {"optics"},
	["night-vision-equipment"] = {"optics"},
	
	["transport-belt-2"] = {"logistica-1"},
	["underground-belt-2"] = {"logistica-1"},
	["splitter-2"] = {"filters-1"},
	["loader-2"] = {"filters-1"},
	["transport-belt-3"] = {"logistica-3"},
	["underground-belt-3"] = {"logistica-3"},
	["splitter-3"] = {"logistica-4"},
	["loader-3"] = {"logistica-4"},
	["transport-belt-4"] = {"logistica-5"},
	["underground-belt-4"] = {"logistica-5"},
	["splitter-4"] = {"logistica-6"},
	["loader-4"] = {"logistica-6"},
	["transport-belt-5"] = {"logistica-7"},
	["underground-belt-5"] = {"logistica-7"},
	["splitter-5"] = {"logistica-8"},
	["loader-5"] = {"logistica-8"},
	
	["logistic-chest-storage"] = {"storage-1"},
	["logistic-chest-passive-provider"] = {"storage-1"},
	["logistic-chest-requester"] = {"storage-2"},
	["logistic-chest-active-provider"] = {"storage-3"},
	["logistic-chest-buffer"] = {"storage-3"},
	["construction-robot-1"] = {"storage-3"},
	["logistic-robot-1"] = {"storage-3"},
	["roboport-1"] = {"storage-3"},
	["construction-robot-2"] = {"storage-5"},
	["logistic-robot-2"] = {"storage-5"},
	["roboport-2"] = {"storage-5"},
	["construction-robot-3"] = {"storage-7"},
	["logistic-robot-3"] = {"storage-7"},
	["roboport-3"] = {"storage-7"},
	
	["aai-strongbox-passive-provider"] = {"storage-2"},
	["aai-strongbox-storage"] = {"storage-2"},
	["aai-strongbox-requester"] = {"storage-3"},
	["aai-strongbox-active-provider"] = {"storage-3"},
	["aai-strongbox-buffer"] = {"storage-3"},
	["aai-storehouse"] = {"storage-3"},
	["aai-storehouse-storage"] = {"storage-4"},
	["aai-storehouse-passive-provider"] = {"storage-4"},
	["aai-warehouse"] = {"storage-5"},
	["aai-storehouse-requester"] = {"storage-5"},
	["aai-storehouse-buffer"] = {"storage-5"},
	["aai-storehouse-active-provider"] = {"storage-5"},
	["aai-warehouse-passive-provider"] = {"storage-6"},
	["aai-warehouse-storage"] = {"storage-6"},
	["aai-warehouse-active-provider"] = {"storage-7"},
	["aai-warehouse-buffer"] = {"storage-7"},
	["aai-warehouse-requester"] = {"storage-7"},
	
	["water-centrifuge-2"] = {"water-filtering"},
	
	["air-filter"] = {"filters-1"},
	["filter-nitrogen-1"] = {"filters-1"},
	["filter-oxygen-1"] = {"filters-1"},
	["filter-hydrogen-1"] = {"filters-1"},
	["filter-nitrogen-2"] = {"filters-3"},
	["filter-oxygen-2"] = {"filters-3"},
	["filter-hydrogen-2"] = {"filters-3"},
	
	["storage-tank-1"] = {"copper-processing", "iron-processing", "tin-processing"},
	["storage-tank-2"] = {"fluids-3"},
	["storage-tank-3"] = {"fluids-6"},
	["storage-tank-4"] = {"fluids-9"},
	
	["rocket-silo-1"] = {"space-mining"},
	["rocket-part-1"] = {"space-mining"},
	--["satellite"] = {"space-mining"},
	
	["recycler"] = {"recycling"},
	
	["resin"] = {"intermediates-1"},
	["rubber"] = {"intermediates-1"},
	["landfill-1"] = {"intermediates-1"},
	["landfill-2"] = {"intermediates-1"},
	["landfill-3"] = {"intermediates-1"},
	["landfill-4"] = {"intermediates-1"},
	["stone-brick-advanced-1"] = {"intermediates-1"},
	["stone-brick-advanced-2"] = {"intermediates-1"},
	["stone-brick-advanced-3"] = {"intermediates-1"},
	["stone-brick-advanced-4"] = {"intermediates-1"},
	["stone-furnace"] = {"intermediates-1"},
	
	["glass-1"] = {"intermediates-2"},
	["glass-2"] = {"intermediates-2"},
	["sand-1"] = {"intermediates-2"},
	["sand-2"] = {"intermediates-2"},
	["engine-unit"] = {"intermediates-2"},
	["concrete-powder"] = {"intermediates-2"},
	["concrete"] = {"intermediates-2"},
	
	["flying-robot-frame"] = {"intermediates-3"},
	["control-board-2"] = {"intermediates-3"},
	
	["electric-engine-unit"] = {"intermediates-4"},
	["low-density-structure"] = {"intermediates-4"},
	
	["rocket-control-unit"] = {"intermediates-5"},
	["sulfur"] = {"intermediates-5"},
	["quartz"] = {"intermediates-5"},
	["sulfuric-acid"] = {"intermediates-5"},
	["battery"] = {"intermediates-5"},
	["obsidian"] = {"intermediates-5"},
	["refined-concrete-powder"] = {"intermediates-5"},
	["refined-concrete"] = {"intermediates-5"},
	
	["computer"] = {"intermediates-6"},
	["control-board-3"] = {"intermediates-6"},
	["lubricant"] = {"intermediates-6"},
	
	["control-board-4"] = {"intermediates-7"},
	--["lubricant"] = {"intermediates-7"},
	
	--["lubricant"] = {"intermediates-8"},
	
	--["lubricant"] = {"intermediates-9"},
	
	--["lubricant"] = {"intermediates-10"},
	["control-board-5"] = {"intermediates-10"},
	
	--["lubricant"] = {"intermediates-11"},
	
	--["lubricant"] = {"intermediates-12"},
	
	["oil-extractor"] = {"oil-extraction"},
	
	["chemical-plant"] = {"oil-processing"},
	["oil-refinery"] = {"oil-processing"},
	["oil-to-petroleum"] = {"oil-processing"},
	["oil-to-gasoline"] = {"oil-processing"},
	["oil-to-naphtha"] = {"oil-processing"},
	["polycarbonate"] = {"oil-processing"},
	["oil-boiler-1"] = {"oil-processing"},
	["oil-boiler-2"] = {"oil-processing"},
	["oil-boiler-3"] = {"oil-processing"},
	["petroleum-centrifuge"] = {"oil-processing"},
	["charcoal-centrifuge"] = {"oil-processing"},
	
	["oil-to-light-oil"] = {"oil-processing-2"},
	["oil-to-heavy-oil"] = {"oil-processing-2"},
	["oil-to-lubricant"] = {"oil-processing-2"},
	["oil-boiler-4"] = {"oil-processing-2"},
	["oil-boiler-5"] = {"oil-processing-2"},
	["polyurethane"] = {"oil-processing-2"},
	
	["polyvinyl-chloride"] = {"oil-processing-3"},
	["polylactic-acid"] = {"oil-processing-3"},
	["polyepoxide"] = {"oil-processing-3"},
	
	["gas-engine"] = {"gas-power"},
	["gas-extractor"] = {"gas-extraction"},
	["natural-gas-centrifuge"] = {"gas-extraction"},
	
	--["basic-762mm-turret"] = {"nuclear-1"},
	
	--["basic-762mm-turret"] = {"nuclear-2"},
	
	--["basic-762mm-turret"] = {"nuclear-3"},
	
	--["basic-762mm-turret"] = {"nuclear-4"},
	
	--["basic-762mm-turret"] = {"nuclear-5"},
	
	["basic-762mm-turret"] = {"warfare-1"},
	["advanced-762mm-turret"] = {"warfare-3"},
	
	["762mm-gun"] = {"warfare-1"},
	["1853mm-gun"] = {"warfare-2"},
	["860mm-gun"] = {"warfare-3"},
	
	["zaydon-power-armor"] = {"warfare-3"},
	
	["radar-1"] = {"warfare-1"},
	["radar-2"] = {"warfare-3"},
	["radar-3"] = {"warfare-5"},
	["radar-4"] = {"warfare-7"},
	
	["train-stop"] = {"rails-1"},
	["rail-1"] = {"rails-1"},
	["locomotive-1"] = {"rails-1"},
	["cargo-wagon-1"] = {"rails-1"},
	["fluid-wagon-1"] = {"rails-2"},
	["rail-signal"] = {"rails-2"},
	["rail-chain-signal"] = {"rails-2"},
	["rail-2"] = {"rails-3"},
	["rail-3"] = {"rails-5"},
	
	["advanced-power-pole"] = {"power-1"},
	["basic-power-relay"] = {"power-2"},
	["quantum-power-pole"] = {"power-4"},
	["advanced-power-relay"] = {"power-5"},
	["quantum-power-relay"] = {"power-8"},
	
	["dysci-01-fluid"] = {"dy-science-pack-1"},
	["dysci-01"] = {"dy-science-pack-1"},
	["dysci-02-fluid"] = {"dy-science-pack-2"},
	["dysci-02"] = {"dy-science-pack-2"},
	["dysci-03-fluid"] = {"dy-science-pack-3"},
	["dysci-03"] = {"dy-science-pack-3"},
	["dysci-04-fluid"] = {"dy-science-pack-4"},
	["dysci-04"] = {"dy-science-pack-4"},
	["dysci-05-fluid"] = {"dy-science-pack-5"},
	["dysci-05"] = {"dy-science-pack-5"},
	["dysci-06-fluid"] = {"dy-science-pack-6"},
	["dysci-06"] = {"dy-science-pack-6"},
	["dysci-07-fluid"] = {"dy-science-pack-7"},
	["dysci-07"] = {"dy-science-pack-7"},
	["dysci-08-fluid"] = {"dy-science-pack-8"},
	["dysci-08"] = {"dy-science-pack-8"},
	["dysci-09-fluid"] = {"dy-science-pack-9"},
	["dysci-09"] = {"dy-science-pack-9"},
	["dysci-10-fluid"] = {"dy-science-pack-10"},
	["dysci-10"] = {"dy-science-pack-10"},
	["dysci-11-fluid"] = {"dy-science-pack-11"},
	["dysci-11"] = {"dy-science-pack-11"},
	["dysci-12-fluid"] = {"dy-science-pack-12"},
	["dysci-12"] = {"dy-science-pack-12"},
	["dysci-13-fluid"] = {"dy-science-pack-13"},
	["dysci-13"] = {"dy-science-pack-13"},
	["dysci-14-fluid"] = {"dy-science-pack-14"},
	["dysci-14"] = {"dy-science-pack-14"},
	["dysci-15-fluid"] = {"dy-science-pack-15"},
	["dysci-15"] = {"dy-science-pack-15"},
	["dysci-16-fluid"] = {"dy-science-pack-16"},
	["dysci-16"] = {"dy-science-pack-16"},
	--[[["dysci-17-fluid"] = {"dy-science-pack-17"},
	["dysci-17"] = {"dy-science-pack-17"},
	["dysci-18-fluid"] = {"dy-science-pack-18"},
	["dysci-18"] = {"dy-science-pack-18"},
	["dysci-19-fluid"] = {"dy-science-pack-19"},
	["dysci-19"] = {"dy-science-pack-19"},
	["dysci-20-fluid"] = {"dy-science-pack-20"},
	["dysci-20"] = {"dy-science-pack-20"},]]--
	
	["soil-miner"] = {"bio-centrifuge"},
	["soil-mining"] = {"bio-centrifuge"},
	["dy-wood-0"] = {"bio-centrifuge"},
	["corpse-centrifuge"] = {"bio-centrifuge"},
	["blood-centrifuge"] = {"bio-centrifuge"},
	["bodily-fluid-centrifuge"] = {"bio-centrifuge"},
	["greenhouse"] = {"agroforestry", "agriculture"},
	["dy-wood-1"] = {"agroforestry-oak"},
	["dy-wood-2"] = {"agroforestry-sulfur"},
	["dy-wood-3"] = {"agroforestry-dead"},
	["dy-wood-4"] = {"agroforestry-dead"},
	["acidic-residue-centrifuge"] = {"acidification"},
	["fish-centrifuge-1"] = {"piscis-pike"},
	["cooked-fish-filet-1"] = {"piscis-pike"},
	["fish-centrifuge-2"] = {"piscis-salmon"},
	["cooked-fish-filet-2"] = {"piscis-salmon"},
	["fish-miner"] = {"piscis-farm"},
	["fish-mining"] = {"piscis-farm"},
	["bio-waste-refining"] = {"bio-waste"},
}


for name, techtable in pairs(Recipes) do
	for _,tech in pairs(techtable) do
		DyWorld_Add_To_Tech(tech, name)
	end
end

for name, techtable in pairs(Dy_Ammo_Tech_Add) do
	for _,tech in pairs(techtable) do
		DyWorld_Add_To_Tech(tech, name)
	end
end

for name, techtable in pairs(DyWorld_Automated_Tech_Add) do
	for _,tech in pairs(techtable) do
		DyWorld_Add_To_Tech(tech, name)
	end
end