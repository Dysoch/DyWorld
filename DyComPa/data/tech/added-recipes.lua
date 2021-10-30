



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
	["magnesium-ore"] = {"magnesium-processing"},
	["melt-titanium"] = {"titanium-processing"},
	["melt-aluminium"] = {"aluminium-processing"},
	["melt-magnesium"] = {"magnesium-processing"},
	["canister-nitrogen"] = {"copper-processing"},
	["canister-water"] = {"iron-processing"},
	["canister-hydrogen"] = {"tin-processing"},
	["cast-copper-2"] = {"copper-processing"},
	["cast-iron-2"] = {"iron-processing"},
	["cast-tin-2"] = {"tin-processing"},
	["cast-bronze-2"] = {"bronze-processing"},
	["cast-bronze-3a"] = {"advanced-bronze-processing"},
	["cast-bronze-3b"] = {"advanced-bronze-processing"},
	["melt-copper"] = {"advanced-copper-processing"},
	["melt-iron"] = {"advanced-iron-processing"},
	["melt-tin"] = {"advanced-tin-processing"},
	["cast-steel-2"] = {"steel-processing"},
	["cast-steel-3a"] = {"advanced-steel-processing"},
	["cast-steel-3b"] = {"advanced-steel-processing"},
	
	["cast-iron-ingot"] = {"advanced-iron-processing"},
	["cast-iron-plate"] = {"advanced-iron-processing"},
	["cast-copper-ingot"] = {"advanced-copper-processing"},
	["cast-copper-plate"] = {"advanced-copper-processing"},
	["cast-tin-ingot"] = {"advanced-tin-processing"},
	["cast-tin-plate"] = {"advanced-tin-processing"},
	["cast-titanium-ingot"] = {"titanium-processing"},
	["cast-titanium-plate"] = {"titanium-processing"},
	["cast-magnesium-ingot"] = {"magnesium-processing"},
	["cast-magnesium-plate"] = {"magnesium-processing"},
	["cast-aluminium-ingot"] = {"aluminium-processing"},
	["cast-aluminium-plate"] = {"aluminium-processing"},
	
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
	["ore-purify-nickel-1"] = {"metallurgy-4"},
	["ore-purify-zinc-1"] = {"metallurgy-4"},
	["ore-purify-cobalt-1"] = {"metallurgy-4"},
	["ore-purify-chromium-1"] = {"metallurgy-4"},
	["ore-purify-tungsten-1"] = {"metallurgy-4"},
	
	["melt-gold"] = {"metallurgy-3"},
	["melt-lead"] = {"metallurgy-3"},
	["melt-silver"] = {"metallurgy-3"},
	["melt-nickel"] = {"metallurgy-4"},
	["melt-zinc"] = {"metallurgy-4"},
	["melt-cobalt"] = {"metallurgy-4"},
	["melt-chromium"] = {"metallurgy-4"},
	["melt-tungsten"] = {"metallurgy-4"},
	
	["cast-gold-ingot"] = {"metallurgy-3"},
	["cast-lead-ingot"] = {"metallurgy-3"},
	["cast-silver-ingot"] = {"metallurgy-3"},
	["cast-nickel-ingot"] = {"metallurgy-4"},
	["cast-zinc-ingot"] = {"metallurgy-4"},
	["cast-cobalt-ingot"] = {"metallurgy-4"},
	["cast-chromium-ingot"] = {"metallurgy-4"},
	["cast-tungsten-ingot"] = {"metallurgy-4"},
	
	["cast-gold-plate"] = {"metallurgy-4"},
	["cast-lead-plate"] = {"metallurgy-4"},
	["cast-silver-plate"] = {"metallurgy-4"},
	["cast-nickel-plate"] = {"metallurgy-5"},
	["cast-zinc-plate"] = {"metallurgy-5"},
	["cast-cobalt-plate"] = {"metallurgy-5"},
	["cast-chromium-plate"] = {"metallurgy-5"},
	["cast-tungsten-plate"] = {"metallurgy-5"},
	
	["ore-purify-copper-2"] = {"metallurgy-2"},
	["ore-purify-iron-2"] = {"metallurgy-2"},
	["ore-purify-tin-2"] = {"metallurgy-2"},
	["ore-purify-magnesium-2"] = {"metallurgy-3"},
	["ore-purify-titanium-2"] = {"metallurgy-3"},
	["ore-purify-aluminium-2"] = {"metallurgy-3"},
	["ore-purify-gold-2"] = {"metallurgy-4"},
	["ore-purify-lead-2"] = {"metallurgy-4"},
	["ore-purify-silver-2"] = {"metallurgy-4"},
	["ore-purify-nickel-2"] = {"metallurgy-5"},
	["ore-purify-zinc-2"] = {"metallurgy-5"},
	["ore-purify-cobalt-2"] = {"metallurgy-5"},
	["ore-purify-chromium-2"] = {"metallurgy-5"},
	["ore-purify-tungsten-2"] = {"metallurgy-5"},
	
	["ore-purify-copper-3"] = {"metallurgy-4"},
	["ore-purify-iron-3"] = {"metallurgy-4"},
	["ore-purify-tin-3"] = {"metallurgy-4"},
	["ore-purify-magnesium-3"] = {"metallurgy-5"},
	["ore-purify-titanium-3"] = {"metallurgy-5"},
	["ore-purify-aluminium-3"] = {"metallurgy-5"},
	["ore-purify-gold-3"] = {"metallurgy-6"},
	["ore-purify-lead-3"] = {"metallurgy-6"},
	["ore-purify-silver-3"] = {"metallurgy-6"},
	["ore-purify-nickel-3"] = {"metallurgy-7"},
	["ore-purify-zinc-3"] = {"metallurgy-7"},
	["ore-purify-cobalt-3"] = {"metallurgy-7"},
	["ore-purify-chromium-3"] = {"metallurgy-7"},
	["ore-purify-tungsten-3"] = {"metallurgy-7"},
	
	["slag-processing"] = {"slag-processing"},
	
	["rocket-silo-1"] = {"space-mining"},
	["rocket-part-1"] = {"space-mining"},
	["solar-cell"] = {"space-mining"},
	["asteroid-miner"] = {"space-mining"},
	
	["asteroid-miner-tin"] = {"basic-asteroid-mining"},
	["asteroid-miner-iron"] = {"basic-asteroid-mining"},
	["asteroid-miner-copper"] = {"basic-asteroid-mining"},
	["asteroid-miner-stone"] = {"basic-asteroid-mining"},
	["asteroid-miner-titanium"] = {"basic-asteroid-mining"},
	["asteroid-miner-coal-1"] = {"basic-asteroid-mining"},
	["asteroid-miner-coal-2"] = {"basic-asteroid-mining"},
	["asteroid-miner-coal-3"] = {"basic-asteroid-mining"},
	["asteroid-miner-magnesium"] = {"basic-asteroid-mining"},
	["asteroid-miner-aluminium"] = {"basic-asteroid-mining"},
	
	["rocket-silo-2"] = {"normal-asteroid-mining"},
	["rocket-part-2"] = {"normal-asteroid-mining"},
	["asteroid-miner-gold"] = {"normal-asteroid-mining"},
	["asteroid-miner-lead"] = {"normal-asteroid-mining"},
	["asteroid-miner-silver"] = {"normal-asteroid-mining"},
	["asteroid-miner-uranium"] = {"normal-asteroid-mining"},
	
	["rocket-silo-3"] = {"advanced-asteroid-mining"},
	["rocket-part-3"] = {"advanced-asteroid-mining"},
	["advanced-asteroid-miner"] = {"advanced-asteroid-mining"},
	["advanced-asteroid-miner-tin"] = {"advanced-asteroid-mining"},
	["advanced-asteroid-miner-iron"] = {"advanced-asteroid-mining"},
	["advanced-asteroid-miner-copper"] = {"advanced-asteroid-mining"},
	["advanced-asteroid-miner-stone"] = {"advanced-asteroid-mining"},
	["advanced-asteroid-miner-titanium"] = {"advanced-asteroid-mining"},
	["advanced-asteroid-miner-coal"] = {"advanced-asteroid-mining"},
	
	["rocket-silo-4"] = {"quantum-asteroid-mining"},
	["rocket-part-4"] = {"quantum-asteroid-mining"},
	["advanced-asteroid-miner-magnesium"] = {"quantum-asteroid-mining"},
	["advanced-asteroid-miner-aluminium"] = {"quantum-asteroid-mining"},
	["advanced-asteroid-miner-gold"] = {"quantum-asteroid-mining"},
	["advanced-asteroid-miner-lead"] = {"quantum-asteroid-mining"},
	["advanced-asteroid-miner-silver"] = {"quantum-asteroid-mining"},
	["advanced-asteroid-miner-uranium"] = {"quantum-asteroid-mining"},
	
	["satellite"] = {"space-travel"},
	
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
	["stone-tablet"] = {"intermediates-3"},
	
	["electric-engine-unit"] = {"intermediates-4"},
	["low-density-structure"] = {"intermediates-4"},
	
	["rocket-control-unit"] = {"intermediates-5"},
	["sulfur"] = {"intermediates-5"},
	["sulfuric-acid"] = {"intermediates-5"},
	["battery"] = {"intermediates-5"},
	["cliff-explosives-1"] = {"intermediates-5"},
	["explosives"] = {"intermediates-5"},
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
	
	["reactor-fission"] = {"reactor-1"},
	["heat-pipe-fission"] = {"reactor-1"},
	
	["thermo-centrifuge"] = {"reactor-2"},
	["process-spend-uranium-ore"] = {"reactor-2"},
	["process-spend-uranium-235"] = {"reactor-2"},
	["process-spend-uranium-238"] = {"reactor-2"},
	
	["reactor-fusion"] = {"reactor-3"},
	["heat-pipe-fusion"] = {"reactor-3"},
	
	--["basic-762mm-turret"] = {"reactor-2"},
	
	--["basic-762mm-turret"] = {"reactor-3"},
	
	--["basic-762mm-turret"] = {"reactor-4"},
	
	--["basic-762mm-turret"] = {"reactor-5"},
	
	["basic-762mm-turret"] = {"warfare-1"},
	["radar-1"] = {"warfare-1"},
	["762mm-gun"] = {"warfare-1"},
	
	["1853mm-gun"] = {"warfare-2"},
	["860mm-gun"] = {"warfare-2"},
	["advanced-762mm-turret"] = {"warfare-2"},
	
	["zaydon-power-armor"] = {"warfare-3"},
	["radar-2"] = {"warfare-3"},
	
	["radar-3"] = {"warfare-5"},
	
	["radar-4"] = {"warfare-7"},
	
	["electric-turret-base-1"] = {"electric-turrets-1"},
	["electric-turret-base-2"] = {"electric-turrets-2"},
	["electric-turret-base-3"] = {"electric-turrets-3"},
	["electric-turret-base-4"] = {"electric-turrets-4"},
	["electric-turret-base-5"] = {"electric-turrets-5"},
	["lense-1"] = {"laser-turrets-1", "beam-turrets-1"},
	["lense-2"] = {"laser-turrets-2", "beam-turrets-2"},
	["lense-3"] = {"laser-turrets-3", "beam-turrets-3"},
	["lense-4"] = {"laser-turrets-4", "beam-turrets-4"},
	["lense-5"] = {"laser-turrets-5", "beam-turrets-5"},
	
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
	["solar-panel"] = {"power-4"},
	["accumulator"] = {"power-4"},
	
	["advanced-power-relay"] = {"power-5"},
	
	["quantum-power-relay"] = {"power-8"},
	
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
	
	["chemical-recycler"] = {"chemical-recycling-1"},
}


for name, techtable in pairs(Recipes) do
	for _,tech in pairs(techtable) do
		DyW.Tech.Recipe.Add(tech, name)
	end
end

for name, techtable in pairs(Dy_Ammo_Tech_Add) do
	for _,tech in pairs(techtable) do
		DyW.Tech.Recipe.Add(tech, name)
	end
end

for name, techtable in pairs(DyWorld_Automated_Tech_Add) do
	for _,tech in pairs(techtable) do
		DyW.Tech.Recipe.Add(tech, name)
	end
end