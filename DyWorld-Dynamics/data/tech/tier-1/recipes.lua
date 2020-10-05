



local Recipes = {
	["bloomery"] = {"copper-processing", "iron-processing", "tin-processing"},
	["centrifuge"] = {"copper-processing", "iron-processing", "tin-processing"},
	["bronze-pump"] = {"copper-processing", "iron-processing", "tin-processing"},
	["water-centrifuge"] = {"copper-processing", "iron-processing", "tin-processing"},
	["canister-empty"] = {"copper-processing", "iron-processing", "tin-processing"},
	["canister-oxygen"] = {"copper-processing", "iron-processing", "tin-processing"},
	["canister-nitrogen"] = {"copper-processing"},
	["canister-water"] = {"iron-processing"},
	["canister-hydrogen"] = {"tin-processing"},
	["ore-purify-copper"] = {"copper-processing"},
	["ore-purify-iron"] = {"iron-processing"},
	["ore-purify-tin"] = {"tin-processing"},
	["cast-copper-2"] = {"copper-processing"},
	["cast-iron-2"] = {"iron-processing"},
	["cast-tin-2"] = {"tin-processing"},
	["cast-bronze-2"] = {"bronze-processing"},
	["cast-copper-3a"] = {"advanced-copper-processing"},
	["cast-iron-3a"] = {"advanced-iron-processing"},
	["cast-tin-3a"] = {"advanced-tin-processing"},
	["cast-copper-3b"] = {"advanced-copper-processing"},
	["cast-iron-3b"] = {"advanced-iron-processing"},
	["cast-tin-3b"] = {"advanced-tin-processing"},
	["cast-steel-2"] = {"steel-processing"},
	["cast-steel-3a"] = {"advanced-steel-processing"},
	["cast-steel-3b"] = {"advanced-steel-processing"},
	["slag-processing"] = {"slag-processing"},
	["storehouse-basic"] = {"storage-2"},
	["asteroid-miner-tin"] = {"basic-asteroid-mining"},
	["asteroid-miner-iron"] = {"basic-asteroid-mining"},
	["asteroid-miner-copper"] = {"basic-asteroid-mining"},
	["transport-belt-2"] = {"logistics-1"},
	["underground-belt-2"] = {"logistics-1"},
	["construction-robot-1"] = {"logistics-1"},
	["logistic-robot-1"] = {"logistics-1"},
	["roboport-1"] = {"logistics-1"},
	["construction-robot-2"] = {"logistics-3"},
	["logistic-robot-2"] = {"logistics-3"},
	["roboport-2"] = {"logistics-3"},
	["construction-robot-3"] = {"logistics-5"},
	["logistic-robot-3"] = {"logistics-5"},
	["roboport-3"] = {"logistics-5"},
	["splitter-2"] = {"filters-1"},
	["loader-2"] = {"filters-1"},
	["air-filter"] = {"filters-1"},
	["filter-nitrogen"] = {"filters-1"},
	["filter-oxygen"] = {"filters-1"},
	["filter-hydrogen"] = {"filters-1"},
	["blast-furnace"] = {"metallurgy-1"},
	["caster"] = {"metallurgy-1"},
}


for name, techtable in pairs(Recipes) do
	for _,tech in pairs(techtable) do
		DyWorld_Add_To_Tech(tech, name)
	end
end