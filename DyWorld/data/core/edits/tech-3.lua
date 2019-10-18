require "data/core/functions/prefix"

local Tech_Remove = {
	"stone-walls", 
	"gates",
	"engine",
	"electric-engine",
	"turrets",
	"toolbelt",
	"nuclear-power",
	"weapon-shooting-speed-1",
	"weapon-shooting-speed-2",
	"weapon-shooting-speed-3",
	"weapon-shooting-speed-4",
	"weapon-shooting-speed-5",
	"weapon-shooting-speed-6",
	"physical-projectile-damage-1",
	"physical-projectile-damage-2",
	"physical-projectile-damage-3",
	"physical-projectile-damage-4",
	"physical-projectile-damage-5",
	"physical-projectile-damage-6",
	"physical-projectile-damage-7",
	"energy-weapons-damage-1",
	"energy-weapons-damage-2",
	"energy-weapons-damage-3",
	"energy-weapons-damage-4",
	"energy-weapons-damage-5",
	"energy-weapons-damage-6",
	"energy-weapons-damage-7",
	--"stronger-explosives-1",
	--"stronger-explosives-2",
	--"stronger-explosives-3",
	--"stronger-explosives-4",
	--"stronger-explosives-5",
	--"stronger-explosives-6",
	--"stronger-explosives-7",
	"laser-turret-speed-1",
	"laser-turret-speed-2",
	"laser-turret-speed-3",
	"laser-turret-speed-4",
	"laser-turret-speed-5",
	"laser-turret-speed-6",
	"laser-turret-speed-7",
	"heavy-armor",
	"modular-armor",
	"power-armor",
	"power-armor-mk2",
}

for _,Tech_Removed in pairs(Tech_Remove) do
	for INDEX, TECH in pairs(data.raw.technology) do
		if TECH.prerequisites then
			for PreReqIndex,PreReq in pairs(TECH.prerequisites) do
				if PreReq == Tech_Removed then
					TECH.prerequisites[PreReqIndex] = nil
				end
			end
		end
	end
	if data.raw.technology[Tech_Removed] then
		data.raw.technology[Tech_Removed] = nil
	end
end

local Tech_PreReq_Remove = {
	["logistics-3"] = {"production-science-pack"},
	["automation-3"] = {"production-science-pack"},
	["uranium-processing"] = {"chemical-science-pack"},
	["military-3"] = {"chemical-science-pack"},
	["military-4"] = {"utility-science-pack"},
	["ammo-turrets-1"] = {"intermediates-1"},
	["circuit-network"] = {"logistic-science-pack"},
	["automobilism"] = {"logistics-2", "engine"},
	["logistic-system"] = {"utility-science-pack"},
}

local Tech_PreReq = {
	["smelting-2"] = {"silver-processing", "nickel-processing", "tin-processing"},
	["smelting-3"] = {"lead-processing", "steel-processing", "gold-processing"},
	["smelting-4"] = {"cobalt-processing"},
	["smelting-5"] = {"arditium-processing"},
	["smelting-6"] = {"tungsten-processing", "titanium-processing"},
	["smelting-9"] = {"neutronium-processing"},
	["automation-2"] = {"silver-processing", "nickel-processing", "tin-processing", "automation"},
	["automation-3"] = {"lead-processing", "steel-processing", "gold-processing", "automation-2"},
	["logistics-2"] = {"nickel-processing", "metallurgy-3"},
	["logistics-3"] = {"logistics-2"},
	["military-2"] = {"intermediates-2"},
	["military-3"] = {"intermediates-3"},
	["military-4"] = {"intermediates-4", "chemical-science-pack"},
	["rocket-fuel"] = {"lead-processing"},
	["automation-4"] = {"cobalt-processing"},
	["automation-5"] = {"arditium-processing"},
	["automation-6"] = {"tungsten-processing", "titanium-processing", "farming-4"},
	["automation-7"] = {"farming-5"},
	["automation-9"] = {"neutronium-processing"},
	["nuclear-energy-3"] = {"uranium-processing"},
	["metallurgy-1"] = {"steel-processing", "smelting-1", "lead-processing", "nuclear-energy-1"},
	["metallurgy-2"] = {"silver-processing", "nickel-processing", "tin-processing", "smelting-2"},
	["metallurgy-3"] = {"lead-processing", "gold-processing", "smelting-3"},
	["metallurgy-4"] = {"cobalt-processing", "smelting-4"},
	["metallurgy-5"] = {"arditium-processing", "smelting-5"},
	["metallurgy-6"] = {"tungsten-processing", "titanium-processing", "smelting-6"},
	["metallurgy-7"] = {"smelting-7"},
	["metallurgy-8"] = {"smelting-8"},
	["metallurgy-9"] = {"neutronium-processing", "smelting-9"},
	["metallurgy-10"] = {"smelting-10"},
	["storage-solutions-2"] = {"concrete", "tin-processing", "steel-processing"},
	["pollution-module-1"] = {"modules"},
	["logistic-robotics-2"] = {"logistic-robotics"},
	["construction-robotics-2"] = {"construction-robotics"},
	["solar-energy-2"] = {"solar-energy"},
	["solar-energy"] = {"intermediates-1", "silver-processing"},
	["oil-processing-2"] = {"oil-processing"},
	["oil-processing-3"] = {"advanced-oil-processing"},
	["super-module-1"] = {"productivity-module", "speed-module", "effectivity-module", "pollution-module-1"},
	["super-module-2"] = {"productivity-module-2", "speed-module-2", "effectivity-module-2", "pollution-module-2"},
	["super-module-3"] = {"productivity-module-3", "speed-module-3", "effectivity-module-3", "pollution-module-3"},
	["super-module-4"] = {"productivity-module-4", "speed-module-4", "effectivity-module-4", "pollution-module-4"},
	["super-module-5"] = {"productivity-module-5", "speed-module-5", "effectivity-module-5", "pollution-module-5"},
	["super-module-6"] = {"productivity-module-6", "speed-module-6", "effectivity-module-6", "pollution-module-6"},
	["super-module-7"] = {"productivity-module-7", "speed-module-7", "effectivity-module-7", "pollution-module-7"},
	["super-module-8"] = {"productivity-module-8", "speed-module-8", "effectivity-module-8", "pollution-module-8"},
	["super-module-9"] = {"productivity-module-9", "speed-module-9", "effectivity-module-9", "pollution-module-9"},
	["super-module-10"] = {"productivity-module-10", "speed-module-10", "effectivity-module-10", "pollution-module-10"},
	["chemical-science-pack"] = {"solar-energy-3", "logistics-2", "intermediates-3", "gold-processing", "lead-processing"},
	["logistic-science-pack"] = {"fast-inserter", "logistics", "tin-processing", "steel-processing", "intermediates-1"},
	["military-science-pack"] = {"ammo-turrets-2", "defensive-structures-1", "lead-processing", "gold-processing"},
	["production-science-pack"] = {"automation-4", "intermediates-4", "cobalt-processing", "arditium-processing"},
	["utility-science-pack"] = {"solar-energy-7", "automation-7", "intermediates-6", "production-science-pack", "titanium-processing", "tungsten-processing"},
	["space-science-pack"] = {"intermediates-7", "utility-science-pack", "titanium-processing", "solar-energy-6", "metallurgy-7"},
	["neutronium-processing"] = {"logistic-science-pack", "chemical-science-pack", "production-science-pack", "utility-science-pack"},
	["tungsten-processing"] = {"logistic-science-pack", "chemical-science-pack", "production-science-pack"},
	["titanium-processing"] = {"logistic-science-pack", "chemical-science-pack", "production-science-pack"},
	["arditium-processing"] = {"logistic-science-pack", "chemical-science-pack"},
	["cobalt-processing"] = {"logistic-science-pack", "chemical-science-pack"},
	["lead-processing"] = {"logistic-science-pack"},
	["gold-processing"] = {"logistic-science-pack"},
	["fluid-handling-2"] = {"fluid-handling"},
	["low-density-structure"] = {"intermediates-3", "metallurgy-4"},
	["rocket-control-unit"] = {"intermediates-6", "metallurgy-5"},
	["rocket-silo"] = {"intermediates-6", "metallurgy-7", "logistics-5", "tungsten-processing"},
	["rocket-gun-enhancement-1"] = {"rocketry"},
	["laser-gun-enhancement-1"] = {"laser"},
	["plasma-gun-enhancement-1"] = {"plasma"},
	["sniper-gun-enhancement-1"] = {"sniper"},
	["rocket-ammo-enhancement-1"] = {"rocketry"},
	["laser-ammo-enhancement-1"] = {"laser"},
	["plasma-ammo-enhancement-1"] = {"plasma"},
	["sniper-ammo-enhancement-1"] = {"sniper"},
	["automobilism"] = {"steel-processing"},
} 

for k,v in pairs(Tech_PreReq) do
	if data.raw.technology[k] then
		if not data.raw.technology[k].prerequisites then
			data.raw.technology[k].prerequisites = {}
		end
		for _,z in pairs(v) do
			if data.raw.technology[z] then
				table.insert(data.raw.technology[k].prerequisites,z)
			end
		end
	end
end

for k,v in pairs(Tech_PreReq_Remove) do
	if data.raw.technology[k] then
		if data.raw.technology[k].prerequisites then
			for index,z in pairs(data.raw.technology[k].prerequisites) do
				for _,x in pairs(v) do
					if z == x then
						data.raw.technology[k].prerequisites[index] = nil
					end
				end
			end
		end
	end
end

local Tech_Recipe_Add = {
	["intermediates-1"] = {"glass", "rotor", "obsidian", "blade", "turret-base-2x2", "turret-barrel", "basic-control-board"},
	["intermediates-2"] = {"frame", "heater", "gearbox", "coil", "battery-pack", "rubber", "obsidian-filter", "electronic-control-board", "electronic-motor"},
	["intermediates-3"] = {"housing", "intake", "turret-base-3x3", "advanced-control-board", "electronic-control-board-2"},
	["intermediates-4"] = {"logistic-unit", "turret-base-5x5", "diamond", "tough-control-board", "tough-motor"},
	["intermediates-5"] = {"processing-control-board"},
	["intermediates-6"] = {"logic-control-board", "controller", "logic-motor"},
	["intermediates-7"] = {"super-control-board"},
	["intermediates-8"] = {"extreme-control-board", "extreme-motor"},
	["intermediates-9"] = {"quantum-control-board"},
	["nickel-processing"] = {"nickel-plate"},
	["steel-processing"] = {"steel-plate"},
	["silver-processing"] = {"silver-plate"},
	["tin-processing"] = {"tin-plate"},
	["gold-processing"] = {"gold-plate"},
	["lead-processing"] = {"lead-plate"},
	["cobalt-processing"] = {"cobalt-plate"},
	["arditium-processing"] = {"arditium-plate"},
	["titanium-processing"] = {"titanium-plate"},
	["tungsten-processing"] = {"tungsten-plate"},
	["neutronium-processing"] = {"neutronium-plate"},
	["logistic-science-pack"] = {"science-2"},
	["chemical-science-pack"] = {"science-3", "science-advanced"},
	["military-science-pack"] = {"science-4", "science-advanced"},
	["production-science-pack"] = {"science-5", "science-extreme"},
	["utility-science-pack"] = {"science-6", "science-extreme"},
	["space-science-pack"] = {"science-7", "space-science-pack", "science-extreme"},
	["oil-processing"] = {"crude-refined-oil-processing"},
	["solar-energy"] = {"solar-cell"},
	["farming-1"] = {"carrot", "boiler-water"},
	["farming-2"] = {"wheat"},
	["farming-4"] = {"wood-2"},
	["military-2"] = {"rifle"},
	["military-4"] = {"chaingun"},
	["military-7"] = {"atomic-land-mine"},
	["defensive-structures-1"] = {"stone-wall", "gate"},
	["nuclear-energy-1"] = {"heat-pipe", "heat-pipe-furnace", "heated-furnace", "heated-inserter", "heated-assembler", "heated-long-inserter"},
} 

for k,v in pairs(Tech_Recipe_Add) do
	if data.raw.technology[k] then
		if not data.raw.technology[k].effects then
			data.raw.technology[k].effects = {}
		end
		for _,z in pairs(v) do
			if data.raw.recipe[z] then
				local INSERT = {type = "unlock-recipe", recipe = z}
				table.insert(data.raw.technology[k].effects,INSERT)
				if data.raw.recipe[z].enabled then
					data.raw.recipe[z].enabled = false
					if data.raw.recipe[z].normal then
						data.raw.recipe[z].normal.enabled = false
						data.raw.recipe[z].expensive.enabled = false
					end
				end
			end
		end
	end
end

for k,v in pairs(data.raw.technology) do
	v.upgrade = settings.startup["DyWorld_Tech_Upgrade"].value
end

local Tech_Science_Pack_Change = {
	["automation-2"] = 2,
	["automation-3"] = 3,
	["logistics-2"] = 2,
	["logistics-3"] = 3,
	["solar-energy"] = 1,
	["automobilism"] = 1,
	["uranium-processing"] = 3,
	["laser-ammo-enhancement-1"] = 2,
	["laser-ammo-enhancement-4"] = 3,
	["plasma-ammo-enhancement-1"] = 2,
	["plasma-ammo-enhancement-4"] = 3,
	["beam-ammo-enhancement-1"] = 2,
	["beam-ammo-enhancement-4"] = 3,
	["rocket-ammo-enhancement-1"] = 2,
	["rocket-ammo-enhancement-4"] = 3,
	["laser-gun-enhancement-1"] = 2,
	["laser-gun-enhancement-4"] = 3,
	["plasma-gun-enhancement-1"] = 2,
	["plasma-gun-enhancement-4"] = 3,
	["beam-gun-enhancement-1"] = 2,
	["beam-gun-enhancement-4"] = 3,
	["rocket-gun-enhancement-1"] = 2,
	["rocket-gun-enhancement-4"] = 3,
	["circuit-network"] = 1,
	["military"] = 1,
	["military-1"] = 1,
	["military-2"] = 2,
	["military-3"] = 3,
	["military-4"] = 4,
	["logistic-system"] = 4,
}

local Tech_Science_Pack_Change_Military = {
	["military-3"] = 1,
	["military-4"] = 2,
}

for k,v in pairs(Tech_Science_Pack_Change) do
	if data.raw.technology[k] then
		if v == 1 then
			data.raw.technology[k].unit.ingredients = {{"automation-science-pack", 1}}
		elseif v == 2 then
			data.raw.technology[k].unit.ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1}}
		elseif v == 3 then
			data.raw.technology[k].unit.ingredients = {{"automation-science-pack", 2},{"logistic-science-pack", 2}}
		elseif v == 4 then
			data.raw.technology[k].unit.ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1}}
		elseif v == 5 then
			data.raw.technology[k].unit.ingredients = {{"automation-science-pack", 3},{"logistic-science-pack", 3},{"chemical-science-pack", 3}}
		elseif v == 6 then
			data.raw.technology[k].unit.ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1},{"production-science-pack", 1}}
		elseif v == 7 then
			data.raw.technology[k].unit.ingredients = {{"automation-science-pack", 4},{"logistic-science-pack", 4},{"chemical-science-pack", 4},{"production-science-pack", 4}}
		elseif v == 8 then
			data.raw.technology[k].unit.ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1},{"production-science-pack", 1},{"utility-science-pack", 1}}
		elseif v == 9 then
			data.raw.technology[k].unit.ingredients = {{"automation-science-pack", 5},{"logistic-science-pack", 5},{"chemical-science-pack", 5},{"production-science-pack", 5},{"utility-science-pack", 5}}
		elseif v == 10 then
			data.raw.technology[k].unit.ingredients = {{"automation-science-pack", 5},{"logistic-science-pack", 5},{"chemical-science-pack", 5},{"production-science-pack", 5},{"utility-science-pack", 5},{"space-science-pack", 10}}
		end
	end
end	

for k,v in pairs(Tech_Science_Pack_Change_Military) do
	if data.raw.technology[k] then
		local INSERT = {"military-science-pack", v}
		table.insert(data.raw.technology[k].unit.ingredients, INSERT)
	end
end	