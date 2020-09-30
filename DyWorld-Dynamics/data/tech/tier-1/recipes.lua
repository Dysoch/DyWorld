



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
	["cast-copper-3"] = {"advanced-copper-processing"},
	["cast-iron-3"] = {"advanced-iron-processing"},
	["cast-tin-3"] = {"advanced-tin-processing"},
	["slag-processing"] = {"slag-processing"},
	["storehouse-basic"] = {"storage-2"},
	["asteroid-miner-tin"] = {"basic-asteroid-mining"},
	["asteroid-miner-iron"] = {"basic-asteroid-mining"},
	["asteroid-miner-copper"] = {"basic-asteroid-mining"},
	["transport-belt-2"] = {"logistics-1"},
	["underground-belt-2"] = {"logistics-1"},
	["splitter-2"] = {"filters-1"},
	["loader-2"] = {"filters-1"},
}


for name, techtable in pairs(Recipes) do
	for _,tech in pairs(techtable) do
		DyWorld_Add_To_Tech(tech, name)
	end
end