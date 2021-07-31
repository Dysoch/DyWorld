


Objectives_Side  = {
	-- Kill Types --
	["kill-unit-1"] = {objective_type = "kill-type", name = "unit", amount_needed_base = 10000, pre_req = "none"},
	["kill-spawner-1"] = {objective_type = "kill-type", name = "unit-spawner", amount_needed_base = 10, pre_req = "kill-unit-2"},
	-- Kill Named --
	["kill-small-biter-1"] = {objective_type = "kill-name", name = "small-biter", amount_needed_base = 500, pre_req = "kill-unit-1"},
	["kill-medium-biter-1"] = {objective_type = "kill-name", name = "medium-biter", amount_needed_base = 500, pre_req = "kill-unit-3"},
	["kill-big-biter-1"] = {objective_type = "kill-name", name = "big-biter", amount_needed_base = 500, pre_req = "kill-unit-5"},
	["kill-behemoth-biter-1"] = {objective_type = "kill-name", name = "behemoth-biter", amount_needed_base = 500, pre_req = "kill-unit-7"},
	["kill-small-spitter-1"] = {objective_type = "kill-name", name = "small-spitter", amount_needed_base = 500, pre_req = "kill-small-biter-1"},
	["kill-medium-spitter-1"] = {objective_type = "kill-name", name = "medium-spitter", amount_needed_base = 500, pre_req = "kill-medium-biter-1"},
	["kill-big-spitter-1"] = {objective_type = "kill-name", name = "big-spitter", amount_needed_base = 500, pre_req = "kill-big-biter-1"},
	["kill-behemoth-spitter-1"] = {objective_type = "kill-name", name = "behemoth-spitter", amount_needed_base = 500, pre_req = "kill-behemoth-biter-1"},
	-- Build Types --
	["build-transport-belt-1"] = {objective_type = "build-type", name = "transport-belt", amount_needed_base = 1000, pre_req = "none"},
	["build-splitter-1"] = {objective_type = "build-type", name = "splitter", amount_needed_base = 100, pre_req = "build-transport-belt-2"},
	["build-radar-1"] = {objective_type = "build-type", name = "radar", amount_needed_base = 5, pre_req = "kill-unit-3"},
	["build-furnace-1"] = {objective_type = "build-type", name = "furnace", amount_needed_base = 5, pre_req = "none"},
	["build-inserter-1"] = {objective_type = "build-type", name = "inserter", amount_needed_base = 50, pre_req = "none"},
	["build-assembling-machine-1"] = {objective_type = "build-type", name = "assembling-machine", amount_needed_base = 50, pre_req = "none"},
	-- Build Named --
	["build-transport-belt-2-1"] = {objective_type = "build-name", name = "transport-belt", amount_needed_base = 1000, pre_req = "build-transport-belt-1"},
	["build-transport-belt-3-1"] = {objective_type = "build-name", name = "transport-belt", amount_needed_base = 1000, pre_req = "build-transport-belt-2-1"},
	["build-transport-belt-4-1"] = {objective_type = "build-name", name = "transport-belt", amount_needed_base = 1000, pre_req = "build-transport-belt-3-1"},
	["build-transport-belt-5-1"] = {objective_type = "build-name", name = "transport-belt", amount_needed_base = 1000, pre_req = "build-transport-belt-4-1"},
	-- Misc Objectives --
	["scan-sector-1"] = {objective_type = "scanning", amount_needed_base = 5000, pre_req = "kill-unit-1"},
	["launch-rockets-1"] = {objective_type = "rockets", amount_needed_base = 50, pre_req = "scan-sector-1"},
	["rockets-satellites-navigation-1"] = {objective_type = "satellite", name = "satellite", amount_needed_base = 50, pre_req = "launch-rockets-1"},
	["rockets-satellites-advanced-asteroid-miner-stone-1"] = {objective_type = "satellite", name = "advanced-asteroid-miner-stone", amount_needed_base = 50, pre_req = "launch-rockets-1"},
	["rockets-satellites-advanced-asteroid-miner-coal-1"] = {objective_type = "satellite", name = "advanced-asteroid-miner-coal", amount_needed_base = 50, pre_req = "launch-rockets-2"},
	["rockets-satellites-advanced-asteroid-miner-iron-1"] = {objective_type = "satellite", name = "advanced-asteroid-miner-iron", amount_needed_base = 50, pre_req = "launch-rockets-3"},
	["rockets-satellites-advanced-asteroid-miner-copper-1"] = {objective_type = "satellite", name = "advanced-asteroid-miner-copper", amount_needed_base = 50, pre_req = "launch-rockets-4"},
	["rockets-satellites-advanced-asteroid-miner-tin-1"] = {objective_type = "satellite", name = "advanced-asteroid-miner-tin", amount_needed_base = 50, pre_req = "launch-rockets-5"},
	["rockets-satellites-advanced-asteroid-miner-titanium-1"] = {objective_type = "satellite", name = "advanced-asteroid-miner-titanium", amount_needed_base = 50, pre_req = "launch-rockets-6"},
	["rockets-satellites-advanced-asteroid-miner-magnesium-1"] = {objective_type = "satellite", name = "advanced-asteroid-miner-magnesium", amount_needed_base = 50, pre_req = "launch-rockets-7"},
	["rockets-satellites-advanced-asteroid-miner-aluminium-1"] = {objective_type = "satellite", name = "advanced-asteroid-miner-aluminium", amount_needed_base = 50, pre_req = "launch-rockets-8"},
}

for i = 1,4 do
	local Result = {objective_type = "kill-name", name = "small-biter", amount_needed_base = 500 * (i+1), pre_req = "kill-small-biter-"..i}
	Objectives_Side["kill-small-biter-"..(i+1)] = Result
	local Result = {objective_type = "kill-name", name = "medium-biter", amount_needed_base = 500 * (i+1), pre_req = "kill-medium-biter-"..i}
	Objectives_Side["kill-medium-biter-"..(i+1)] = Result
	local Result = {objective_type = "kill-name", name = "big-biter", amount_needed_base = 500 * (i+1), pre_req = "kill-big-biter-"..i}
	Objectives_Side["kill-big-biter-"..(i+1)] = Result
	local Result = {objective_type = "kill-name", name = "behemoth-biter", amount_needed_base = 500 * (i+1), pre_req = "kill-behemoth-biter-"..i}
	Objectives_Side["kill-behemoth-biter-"..(i+1)] = Result
	local Result = {objective_type = "kill-name", name = "small-spitter", amount_needed_base = 500 * (i+1), pre_req = "kill-small-spitter-"..i}
	Objectives_Side["kill-small-spitter-"..(i+1)] = Result
	local Result = {objective_type = "kill-name", name = "medium-spitter", amount_needed_base = 500 * (i+1), pre_req = "kill-medium-spitter-"..i}
	Objectives_Side["kill-medium-spitter-"..(i+1)] = Result
	local Result = {objective_type = "kill-name", name = "big-spitter", amount_needed_base = 500 * (i+1), pre_req = "kill-big-spitter-"..i}
	Objectives_Side["kill-big-spitter-"..(i+1)] = Result
	local Result = {objective_type = "kill-name", name = "behemoth-spitter", amount_needed_base = 500 * (i+1), pre_req = "kill-behemoth-spitter-"..i}
	Objectives_Side["kill-behemoth-spitter-"..(i+1)] = Result

	local Result = {objective_type = "satellite", name = "satellite", amount_needed_base = 50 * (i+1), pre_req = "rockets-satellites-navigation-"..i}
	Objectives_Side["rockets-satellites-navigation-"..(i+1)] = Result
	local Result = {objective_type = "satellite", name = "advanced-asteroid-miner-stone", amount_needed_base = 50 * (i+1), pre_req = "rockets-satellites-advanced-asteroid-miner-stone-"..i}
	Objectives_Side["rockets-satellites-advanced-asteroid-miner-stone-"..(i+1)] = Result
	local Result = {objective_type = "satellite", name = "advanced-asteroid-miner-coal", amount_needed_base = 50 * (i+1), pre_req = "rockets-satellites-advanced-asteroid-miner-coal-"..i}
	Objectives_Side["rockets-satellites-advanced-asteroid-miner-coal-"..(i+1)] = Result
	local Result = {objective_type = "satellite", name = "advanced-asteroid-miner-iron", amount_needed_base = 50 * (i+1), pre_req = "rockets-satellites-advanced-asteroid-miner-iron-"..i}
	Objectives_Side["rockets-satellites-advanced-asteroid-miner-iron-"..(i+1)] = Result
	local Result = {objective_type = "satellite", name = "advanced-asteroid-miner-copper", amount_needed_base = 50 * (i+1), pre_req = "rockets-satellites-advanced-asteroid-miner-copper-"..i}
	Objectives_Side["rockets-satellites-advanced-asteroid-miner-copper-"..(i+1)] = Result
	local Result = {objective_type = "satellite", name = "advanced-asteroid-miner-tin", amount_needed_base = 50 * (i+1), pre_req = "rockets-satellites-advanced-asteroid-miner-tin-"..i}
	Objectives_Side["rockets-satellites-advanced-asteroid-miner-tin-"..(i+1)] = Result
	local Result = {objective_type = "satellite", name = "advanced-asteroid-miner-titanium", amount_needed_base = 50 * (i+1), pre_req = "rockets-satellites-advanced-asteroid-miner-titanium-"..i}
	Objectives_Side["rockets-satellites-advanced-asteroid-miner-titanium-"..(i+1)] = Result
	local Result = {objective_type = "satellite", name = "advanced-asteroid-miner-magnesium", amount_needed_base = 50 * (i+1), pre_req = "rockets-satellites-advanced-asteroid-miner-magnesium-"..i}
	Objectives_Side["rockets-satellites-advanced-asteroid-miner-magnesium-"..(i+1)] = Result
	local Result = {objective_type = "satellite", name = "advanced-asteroid-miner-aluminium", amount_needed_base = 50 * (i+1), pre_req = "rockets-satellites-advanced-asteroid-miner-aluminium-"..i}
	Objectives_Side["rockets-satellites-advanced-asteroid-miner-aluminium-"..(i+1)] = Result

	local Result = {objective_type = "build-type", name = "furnace", amount_needed_base = 5 * (i+1), pre_req = "build-furnace-"..i}
	Objectives_Side["build-furnace-"..(i+1)] = Result
	local Result = {objective_type = "build-name", name = "transport-belt-2", amount_needed_base = 1000 * (i+1), pre_req = "build-transport-belt-2-"..i}
	Objectives_Side["build-transport-belt-2-"..(i+1)] = Result
	local Result = {objective_type = "build-name", name = "transport-belt-3", amount_needed_base = 1000 * (i+1), pre_req = "build-transport-belt-3-"..i}
	Objectives_Side["build-transport-belt-3-"..(i+1)] = Result
	local Result = {objective_type = "build-name", name = "transport-belt-4", amount_needed_base = 1000 * (i+1), pre_req = "build-transport-belt-4-"..i}
	Objectives_Side["build-transport-belt-4-"..(i+1)] = Result
	local Result = {objective_type = "build-name", name = "transport-belt-5", amount_needed_base = 1000 * (i+1), pre_req = "build-transport-belt-5-"..i}
	Objectives_Side["build-transport-belt-5-"..(i+1)] = Result
end

for i = 1,9 do
	local Result = {objective_type = "build-type", name = "radar", amount_needed_base = 10 * (i+1), pre_req = "build-radar-"..i}
	Objectives_Side["build-radar-"..(i+1)] = Result
	local Result = {objective_type = "build-type", name = "splitter", amount_needed_base = 200 * (i+1), pre_req = "build-splitter-"..i}
	Objectives_Side["build-splitter-"..(i+1)] = Result
	local Result = {objective_type = "build-type", name = "transport-belt", amount_needed_base = 2500 * (i+1), pre_req = "build-transport-belt-"..i}
	Objectives_Side["build-transport-belt-"..(i+1)] = Result
end

for i = 1,19 do
	local Result = {objective_type = "build-type", name = "assembling-machine", amount_needed_base = 50 * (i+1), pre_req = "build-assembling-machine-"..i}
	Objectives_Side["build-assembling-machine-"..(i+1)] = Result
end
--[[
for i = 1,24 do
	local Result = {objective_type = "kill-type", name = "unit", amount_needed_base = 10000 * (i+1), pre_req = "kill-unit-"..i}
	Objectives_Side["kill-unit-"..(i+1)] = Result
end
]]
for i = 1,49 do
	local Result = {objective_type = "kill-type", name = "unit", amount_needed_base = 10000 * (i+1), pre_req = "kill-unit-"..i}
	Objectives_Side["kill-unit-"..(i+1)] = Result
	local Result = {objective_type = "kill-type", name = "unit-spawner", amount_needed_base = 10 * (i+1), pre_req = "kill-spawner-"..i}
	Objectives_Side["kill-spawner-"..(i+1)] = Result
	local Result = {objective_type = "scanning", amount_needed_base = 5000 * (i+1), pre_req = "scan-sector-"..i}
	Objectives_Side["scan-sector-"..(i+1)] = Result
	local Result = {objective_type = "rockets", amount_needed_base = 50 * (i+1), pre_req = "launch-rockets-"..i}
	Objectives_Side["launch-rockets-"..(i+1)] = Result
	local Result = {objective_type = "build-type", name = "inserter", amount_needed_base = 50 * (i+1), pre_req = "build-inserter-"..i}
	Objectives_Side["build-inserter-"..(i+1)] = Result
end